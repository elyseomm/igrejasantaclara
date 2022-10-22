using Models.Adapters;
using System;
using System.Web.UI;

namespace waSantaClara
{
    public partial class Batismo : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected override void OnLoadComplete(EventArgs e)
        {   
            var resp = RequisitoPadrinhoBatismoAdapter.All();
            if (resp != null)
            {
                requisitos.DataSource = resp;
                requisitos.DataBind();
                //foreach (var item in resp.Rows)
                //{
                //}
            }
        }
    }
}