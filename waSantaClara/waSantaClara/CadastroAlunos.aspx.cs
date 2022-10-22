using Models;
using Models.Adapters;
using System;
using System.Web.UI;

namespace waSantaClara
{
    public partial class CadastroAlunos : Page
    {
        private static Responsavel _responsavel { set; get; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                grupoOutraReligiao.Visible = false;
                grupoArte.Visible = false;
                grupoEngajamento.Visible = false;

                msgOk.Visible = false;
                ClearMsgErro();
            }

            if (Request.QueryString["rid"] != null)
            {
                // * Carrega o responsável do Aluno IVC
                int.TryParse(Request.QueryString["rid"].ToString(), out int respid);

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
                _responsavel = new Responsavel()
                {
                    Nome = txtNomeResp.Text,
                    //Email = txtEmailResp.Text,
                    //Telefones = txtCelularResp.Text
                };

                // * Verifica se já existe
                var check = ResponsavelAdapter.GetByName(_responsavel.Nome);
                if (check.Count > 0)
                {
                    if (check[0].Nome.ToLower().Equals(_responsavel.Nome.Trim().ToLower()))
                    {
                        _responsavel = check[0];        // * Atribui o registro existente no db;
                        msgErro.Visible = true;
                        msgErro.InnerText = "Responsável já cadastrado!";
                        txtNomeResp.Focus();
                    }
                    //btnProximo.Enabled = true;
                }
                else if (ResponsavelAdapter.Insert(_responsavel))
                {
                    //msgOk.Visible = true;
                    //btnProximo.Enabled = true;
                }
            }
        }
        private void ClearMsgErro()
        {
            msgErro.Visible = false;
            msgErro.InnerText = "";
        }

        private bool ValidateFields()
        {
            ClearMsgErro();

            if (string.IsNullOrWhiteSpace(txtNomeAluno.Text))
            {
                msgErro.Visible = true;
                msgErro.InnerText = "Nome do Aluno requerido. Preencha!";
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
                msgErro.InnerText = "Data de Nascimento requerido. Preencha!";
                txtDtNasc.Focus();
                return false;
            }

            return true;
        }
    }
}