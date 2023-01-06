using Custom;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace waSantaClara
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var geo = new GeoLocation();                
                var resp = geo.GetLocation();

                if (resp != null)
                {
                    var lat = resp.latitude.ToString().Replace(',','.');
                    var longit = resp.longitude.ToString().Replace(',', '.');
                    this.mapLink.NavigateUrl = $"https://www.google.com/maps/dir/{lat},{longit}/Igreja+Católica+Santa+Clara+-+R.+31,+1-169+-+Cidade+Nova,+Manaus+-+AM,+69097-758/@-3.0443107,-60.0087601,13z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x926c190d281bc01b:0x5c9f2e65399f9d48!2m2!1d-59.9710091!2d-3.0132874";
                }

            }
            catch (Exception ex)
            {
                var erro = ex.Message;
            }
        }
    }
}