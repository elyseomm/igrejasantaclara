using Models.Adapters;
using System;
using System.Linq;
using System.Web.UI;

namespace waSantaClara
{
    public partial class Contato : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void OnLoadComplete(EventArgs e)
        {
            var paroquia = ParoquiaAdapter.Get();
            if (paroquia != null)
            {
                endereco.Text = paroquia.Endereco;
                telefone.Text = paroquia.Telefone; 
                var dbemail = paroquia.Email;

                email.Text = dbemail;
                email.Attributes.Add("HRef", dbemail);

                facebook.HRef = paroquia.Facebook;
                maps.HRef = paroquia.GeoLoc;
            }

            var contato = ContatoAdapter.GetByFuncao("Secretário Paroquial").FirstOrDefault();
            secretario.Text = contato.Nome + $"({contato.Funcao})";
        }
    }
}