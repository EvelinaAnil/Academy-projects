using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebASP_1.Views
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //form1.InnerHtml = "<h3>Hello</h3>";
            //Button1.Value = "RunatButton";

            if (!Page.IsPostBack)
            {
                DropDownList1.Items.Add("Name3");
            }

            Button button = new Button
            {
                ID = "NewButton",
                Text = "NewButton"
                // ...
            };
            button.Click += Button_Click;
            //// Page.Controls.Add(button); Error
            
            //form1.Controls.Add(button);

            ////form1.Controls.AddAt(3, button);

            PlaceHolder1.Controls.Add(button);
        }

        private void Button_Click(object sender, EventArgs e)
        {
            Label1.Text = "Hello new button!";
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            Label1.BackColor = CheckBox1.Checked ? Color.Red : Color.Green;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Label1.Text = "New!";

            if (Page.FindControl("NewButton") is Button button)
            {
                //PlaceHolder1.Controls.Remove(button);
                button.Parent.Controls.Remove(button);
            }

            string name = "Bob";
            Response.Write($"<span style='color: red'>Hi, {name}!</span>");
        }
    }
}