using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1_LES_9.Views
{
    public partial class WebFormJavaScript : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TextBox1.Attributes.Add("onmouseover", "alert('Your mous is hovering on the TextBox')");

        }
    }
}