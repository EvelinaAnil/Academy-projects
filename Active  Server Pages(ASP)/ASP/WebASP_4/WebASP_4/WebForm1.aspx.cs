using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebASP_4
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            //Response.Write(Page.IsValid ? "OK!" : "No!");
            if (Page.IsValid)
            {
                Response.Write("OK!");
                //LastLabel.ForeColor = Color.Green;
                LastLabel.Visible = false;
            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            try
            {
                int num = int.Parse(args.Value);
                args.IsValid = num % 2 == 0;
            }
            catch
            {
                args.IsValid = false;
            }
        }
    }
}