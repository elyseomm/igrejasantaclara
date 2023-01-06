using Custom;
using Models;
using Models.Adapters;
using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace waSantaClara
{
    public partial class CadastroAlunos : Page
    {
        private static Responsavel _responsavel { set; get; }
        private static AlunoIvc _aluno { set; get; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                grupoOutraReligiao.Visible = false;
                grupoArte.Visible = false;
                grupoEngajamento.Visible = false;

                msgOk.Visible = false;
                ClearMsgErro();
                ClearFields();
                txtNomeAluno.Focus();
            }

            if (Request.QueryString["rid"] != null)
            {
                // * Carrega o responsável do Aluno IVC
                var rid = Helper.DecodeFrom64(Request.QueryString["rid"].ToString());
                rid = rid.Replace("_v@lwE",""); // * Código Decodificador

                int.TryParse(rid, out int respid);

                if (_responsavel == null || (_responsavel != null && _responsavel.Id != respid))
                {
                    _responsavel = ResponsavelAdapter.Get(respid);

                    if (_responsavel != null)
                        txtNomeResp.Text = "<strong>Nome Responsável: " + _responsavel.Nome + "</strong>";
                }
            }
        }        

        protected void SeEngajado_SelectedIndexChanged(object sender, EventArgs e)
        {
            grupoEngajamento.Visible = seEngajado.SelectedValue == "1";
            if (grupoEngajamento.Visible)
                txtEngajamento.Focus();
        }

        protected void SeOutraReligiao_SelectedIndexChanged(object sender, EventArgs e)
        {
            grupoOutraReligiao.Visible = seOutraReligiao.SelectedValue == "1";
            if (grupoOutraReligiao.Visible)
                txtOutraReligiao.Focus();
        }

        protected void SeArtista_SelectedIndexChanged(object sender, EventArgs e)
        {
            grupoArte.Visible = seArtista.SelectedValue == "1";
            if (grupoArte.Visible)
                txtAptidaoArtistica.Focus();
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            if (ValidateFields())
            {
                DateTime.TryParse(txtDtNasc.Text.Trim(), out DateTime dtnasc);

                int.TryParse(chkSacramentos.SelectedValue, out int sacramento);

                _aluno = new AlunoIvc()
                {
                    Nome = txtNomeAluno.Text.Trim(),
                    Mae = txtMae.Text.Trim(),
                    Pai = txtPai.Text.Trim(),
                    DtNasc = dtnasc,
                    Sexo = int.Parse(sexo.SelectedValue),
                    Naturalidade = txtNaturalidade.Text.Trim(),
                    EstadoCivil = int.Parse(estadoCivil.SelectedValue),
                    Escolaridade = int.Parse(escolaridade.SelectedValue),

                    Endereco = txtEndereco.Text.Trim(),
                    Nr = txtNrResid.Text.Trim(),
                    Bairro = txtBairro.Text.Trim(),
                    Cidade = txtCidade.Text.Trim(),

                    EhEngajado = int.Parse(seEngajado.SelectedValue),
                    DescEngajamento = txtEngajamento.Text.Trim(),

                    Sacranmento = sacramento,
                    VaiAMissa = int.Parse(seVaiAMissa.SelectedValue),

                    OutraReligiao = int.Parse(seOutraReligiao.SelectedValue),
                    DescReligiao = txtOutraReligiao.Text.Trim(),

                    EhArtista = int.Parse(seArtista.SelectedValue),
                    DescArte = txtAptidaoArtistica.Text.Trim(),

                    IdResponsavel = _responsavel.Id,
                    GrauParentesco = int.Parse(parentescoResp.SelectedValue),

                };

                // * Verifica se já existe
                var check = AlunoIvcAdapter.GetByName(_aluno.Nome);
                if (check.Count > 0)
                {
                    var found = check.Where(x => x.Nome.ToLower().StartsWith(_aluno.Nome.Trim().ToLower())).FirstOrDefault();
                    if (found != null)                        
                    {
                        _aluno = found;        // * Atribui o registro existente no db;
                        msgErro.Visible = true;
                        msgErro.InnerText = $"Aluno [ {_aluno.Nome} ] já cadastrado!";
                        txtNomeResp.Focus();
                    }
                    else if (AlunoIvcAdapter.Insert(_aluno))
                    {
                        msgOk.Visible = true;
                        ClearFields();
                        txtNomeAluno.Focus();
                    }
                }
                else if (AlunoIvcAdapter.Insert(_aluno))
                {
                    msgOk.Visible = true;
                    ClearFields();
                    txtNomeAluno.Focus();
                }
            }
        }

        private void ClearFields()
        {
            txtNomeAluno.Text = string.Empty;
            txtPai.Text = string.Empty;
            txtMae.Text = string.Empty;
            txtDtNasc.Text = string.Empty;
            txtNaturalidade.Text = string.Empty;

            sexo.SelectedValue = "0";
            estadoCivil.SelectedValue = "0";
            escolaridade.SelectedValue = "0";

            txtEndereco.Text = string.Empty;
            txtNrResid.Text = string.Empty;
            txtBairro.Text = string.Empty;
            txtCidade.Text = string.Empty;

            seEngajado.SelectedValue = "0";
            txtEngajamento.Text = string.Empty;

            // * Demarca todos os itens marcados do "Sacramento"
            foreach (ListItem item in chkSacramentos.Items)
                item.Selected = false;

            seVaiAMissa.SelectedValue = "1"; // * As Vezes

            seOutraReligiao.SelectedValue = "0";
            txtOutraReligiao.Text = string.Empty;

            seArtista.SelectedValue = "0";
            txtAptidaoArtistica.Text = string.Empty;
        }

        private void ClearMsgErro()
        {
            msgOk.Visible = false;
            msgErro.Visible = false;
            msgErro.InnerText = "";
        }

        private bool ValidateFields()
        {
            ClearMsgErro();

            if (string.IsNullOrWhiteSpace(txtNomeAluno.Text))
            {
                msgErro.Visible = true;
                msgErro.InnerText = "Nome do aluno requerido. Preencha!";
                txtNomeAluno.Focus();
                return false;
            }
                        
            if (string.IsNullOrWhiteSpace(txtMae.Text))
            {
                msgErro.Visible = true;
                msgErro.InnerText = "Nome da mãe requerido. Preencha!";
                txtMae.Focus();
                return false;
            }

            if (string.IsNullOrWhiteSpace(txtDtNasc.Text))
            {
                msgErro.Visible = true;
                msgErro.InnerText = "Data de nascimento requerida. Preencha!";
                txtDtNasc.Focus();
                return false;
            }

            return true;
        }
    }
}