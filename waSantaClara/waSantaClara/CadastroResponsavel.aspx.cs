using Models;
using Models.Adapters;
using System;
using System.Web.UI;

namespace waSantaClara
{
    public partial class CadastroResponsavel : Page
    {
        private static Responsavel _responsavel { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            ClearMsgErro();
            msgOk.Visible = false;
            btnProximo.Enabled = false;
        }
        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            if (ValidateFields())
            {
                _responsavel = new Responsavel()
                {
                    Nome = txtNomeResp.Text,
                    Email = txtEmailResp.Text,
                    Telefones = txtCelularResp.Text
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
                    btnProximo.Enabled = true;
                }
                else if (ResponsavelAdapter.Insert(_responsavel))
                {
                    msgOk.Visible = true;
                    btnProximo.Enabled = true;
                }
            }
        }


        protected void btnProximo_Click(object sender, EventArgs e)
        {
            Response.Redirect($"CadastroAlunos.aspx?rid={_responsavel.Id}");
        }

        private void ClearMsgErro()
        {
            msgErro.Visible = false;
            msgErro.InnerText = "";
        }

        private bool ValidateFields()
        {
            ClearMsgErro();

            if (string.IsNullOrWhiteSpace(txtNomeResp.Text))
            {
                msgErro.Visible = true;
                msgErro.InnerText = "Nome do Responsável requerido. Preencha!";
                txtNomeResp.Focus();
                return false;
            }

            if (string.IsNullOrWhiteSpace(txtCelularResp.Text))
            {
                msgErro.Visible = true;
                msgErro.InnerText = "Celular do Responsável requerido. Preencha!";
                txtCelularResp.Focus();
                return false;
            }

            return true;
        }

        protected void txtNomeResp_TextChanged(object sender, EventArgs e)
        {
            if (txtNomeResp.Text.Trim().Length > 0)
            {
                ClearMsgErro();
                msgOk.Visible = false;
                btnProximo.Enabled = false;
            }
        }

        protected void txtCelularResp_TextChanged(object sender, EventArgs e)
        {
            if (txtCelularResp.Text.Trim().Length > 0)
            {
                ClearMsgErro();
                msgOk.Visible = false;
                btnProximo.Enabled = false;
            }
        }

        protected void txtEmailResp_TextChanged(object sender, EventArgs e)
        {
            if (txtEmailResp.Text.Trim().Length > 0)
            {
                ClearMsgErro();
                msgOk.Visible = false;
                btnProximo.Enabled = false;
            }                
        }
    }
}