using System;
using System.Web.UI;

namespace waSantaClara
{
    public partial class Sobre : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected override void OnLoadComplete(EventArgs e)
        {
            //var strCmd = "SELECT id, requisito, ativo FROM bdsc.requisitospadrinhosbatismo";
            //var resp = DBAdapt.GetDTable(strCmd);
            //if (resp != null)
            //{
            //    //gridView.DataSource = resp;
            //    //gridView.DataBind();
            //    //foreach (var item in resp.Rows)
            //    //{

            //    //}
            //}
        }
        
    }
}