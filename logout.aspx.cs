using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SistemaWeb
{
    public partial class logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["id_usuLogin"] = null;
            Session["usuLogin"] = null;
            Session["id_grpLogin"] = null;
            Session["grpLogin"] = null;
            Session["id_usuSucursal"] = null;

            Response.Redirect("loguin.aspx", true);
        }
    }
}