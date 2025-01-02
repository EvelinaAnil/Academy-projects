using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebASP_1.Views
{
    public partial class WebForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // form1.InnerHtml = "<h3>Hello</h3>";
           // Button1.Value = "Your Butt";
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            Label1.BackColor = CheckBox1.Checked ? Color.Red : Color.Green;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Label1.Text = "New!";
        }
    }
}