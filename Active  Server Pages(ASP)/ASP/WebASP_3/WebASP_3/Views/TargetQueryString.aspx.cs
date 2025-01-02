using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebASP_3.Views
{
    public partial class TargetQueryString : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            const string Name = "USER", Password = "ROOT";

            string name = Server.UrlDecode(Request.QueryString["Name"]);
            string password = Server.UrlDecode(Request.QueryString["Password"]);

            Label label = new Label();
            form1.Controls.Add(label);

            PlaceHolder placeHolder = new PlaceHolder();
            form1.Controls.Add(placeHolder);

            Button button = new Button();
            form1.Controls.Add(button);

            string message = "";
            if (name.ToUpper() == Name && password.ToUpper() == Password)
            {
                message = $@"<h1 style='color: Green'>Hello {name}!</h1>";

                button.PostBackUrl = "javascript:void(0)";
                button.Text = "Next ->";

                HyperLink link = new HyperLink
                {
                    Text = "<- Back",
                    NavigateUrl = $"~/Views/SourceQueryString.aspx?Name={name}"
                };
                placeHolder.Controls.Add(link);

                placeHolder.Controls.Add(new Literal { Text = "&nbsp;&nbsp;&nbsp;&nbsp;" });
            }
            else
            {
                message = "<h1 style='color: Red'>Not user!</h1>";
                button.PostBackUrl = $"~/Views/SourceQueryString.aspx?Name={name}";
                button.Text = "<- Back";
            }
            label.Text = message;
        }
    }
}