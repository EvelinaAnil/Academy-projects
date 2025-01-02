using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebASP_3.Views
{
    public partial class Application2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int count = Convert.ToInt32(Application["Clicks"]) + 1;

            Application.Lock();
            Application["Clicks"] = count;
            Application.UnLock();

            Label1.Text = $"Number clicks: {count}";
        }
    }
}