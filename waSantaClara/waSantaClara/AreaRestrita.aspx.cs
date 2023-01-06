using Models.Adapters;
using System;
using System.Linq;
using System.Web.UI;

namespace waSantaClara
{
    public partial class AreaRestrita : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ClearFields();
            ClearMsgErro();
            txtUsuario.Focus();
        }

        protected override void OnLoadComplete(EventArgs e)
        {

        }

        protected void txtUsuario_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtSenha_TextChanged(object sender, EventArgs e)
        {

        }


        private void ClearFields()
        {
            txtUsuario.Text = string.Empty;
            txtSenha.Text = string.Empty;
        }

        private void ClearMsgErro()
        {

            msgErro.Visible = false;
            msgErro.InnerText = "";
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (ValidateFields())
            {
                if (CheckLogin())
                {

                }
            }
        }


        private bool ValidateFields()
        {
            ClearMsgErro();

            if (string.IsNullOrWhiteSpace(txtUsuario.Text))
            {
                msgErro.Visible = true;
                msgErro.InnerText = "Usuário requerido. Preencha!";
                txtUsuario.Focus();
                return false;
            }

            if (string.IsNullOrWhiteSpace(txtSenha.Text))
            {
                msgErro.Visible = true;
                msgErro.InnerText = "Senha requerida. Preencha!";
                txtSenha.Focus();
                return false;
            }

            return true;
        }

        private bool CheckLogin()
        {

            return true;
        }
    }
}