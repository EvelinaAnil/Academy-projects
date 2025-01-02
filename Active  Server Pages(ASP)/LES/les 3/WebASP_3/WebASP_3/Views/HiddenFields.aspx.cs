using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace WebASP_3.Views
{
    public partial class HiddenFields : System.Web.UI.Page
    {
        private int _count;
        private Label _lblTime;
        protected void Page_Load(object sender, EventArgs e)
        {
            _lblTime = new Label();
            PlaceHolder1.Controls.Add(_lblTime);
            PlaceHolder1.Controls.Add(new HtmlGenericControl("br"));

            Button button = new Button {Text = "Current time " };
            button.Click += CurrentTimeClick;
            PlaceHolder1.Controls.Add(button);

            PlaceHolder1.Controls.Add(new Literal { Text = "&nbsp;&nbsp;&nbsp;" });

            button = new Button { Text = "Begin time" };
            button.Click += BeginTimeClick;
            PlaceHolder1.Controls.Add(button);

            if (!IsPostBack)
            {
                beginTime.Value = DateTime.Now.ToLongTimeString();
                _count = 1;
                BeginTimeClick(null, EventArgs.Empty);
            }
            else
            {
                if (int.TryParse(countRequest.Value, out _count))
                {
                    _count++;
                }
            }
            countRequest.Value = _count.ToString();


        }

        private void CurrentTimeClick(object sender, EventArgs e)
        {
            _lblTime.Text = $"Current time: {DateTime.Now.ToLongTimeString()}<br/>Reguest: {_count} ";
        }

        private void BeginTimeClick(object sender, EventArgs e)
        {
            _lblTime.Text = $"Begin time: {beginTime.Value}<br/>Reguest: {_count} ";
        }
    }
}