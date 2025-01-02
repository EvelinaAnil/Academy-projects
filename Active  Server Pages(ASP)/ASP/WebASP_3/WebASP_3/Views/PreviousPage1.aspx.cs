using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebASP_3.Views
{
    public partial class PreviousPage1 : System.Web.UI.Page
    {
        public string TextBoxText
        {
            get { return TextBox1.Text; }
        }

        public string GetText()
        {
            return TextBox1.Text;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}