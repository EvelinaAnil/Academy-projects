using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebASP_3.Views
{
    public partial class SourceQueryString : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["Name"] != null && !IsPostBack)
            {
                Name.Text = Request.QueryString["Name"];
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string url = $"TargetQueryString.aspx?Name={Server.UrlEncode(Name.Text)}&Password={Server.UrlEncode(Password.Text)}";
            Response.Redirect(url);
        }
    }
}