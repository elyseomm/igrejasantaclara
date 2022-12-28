using Models;
using Models.Adapters;
using System;
using System.Web.UI;

namespace waSantaClara
{
    public partial class ListagemAlunos : Page
    {
        private static Responsavel _responsavel { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            ClearMsgErro();
        }

        protected void btnPesquisar_Click(object sender, EventArgs e)
        {
            alunos.DataSource = null;
            alunos.DataBind();
            var strSQL = string.Empty;
            var strAND = string.Empty;
            try
            {
                if (ValidateFields())
                {
                    if (txtNomeAluno.Text.Trim().Length > 0)
                    {
                        strSQL += $" aluno LIKE '%{txtNomeAluno.Text.Trim()}%' ";
                        strAND = "AND";
                    }

                    if (txtResponsavel.Text.Trim().Length > 0)
                        strSQL += $"{strAND} responsavel LIKE '%{txtResponsavel.Text.Trim()}%' ";

                    if (txtCatequista.Text.Trim().Length > 0)                  
                        strSQL += $"{strAND} catequista LIKE '%{txtCatequista.Text.Trim()}%' ";

                    var list = AlunoIvcAdapter.GetTurmasIvcListagem(strSQL);

                    if (list != null)
                    {
                        alunos.DataSource = list;
                        alunos.DataBind();
                    }
                }
            }
            catch (Exception)
            {
                throw;
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

            if (string.IsNullOrWhiteSpace(txtNomeAluno.Text) && string.IsNullOrWhiteSpace(txtCatequista.Text) && 
                string.IsNullOrWhiteSpace(txtResponsavel.Text))
            {
                msgErro.Visible = true;
                msgErro.InnerText = "Preencha ao menos um dos campos para a pesquisa.";
                txtNomeAluno.Focus();
                return false;
            }
            return true;
        }

        protected void txtNomeAluno_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtCatequista_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtResponsavel_TextChanged(object sender, EventArgs e)
        {

        }
    }
}