using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebASP_3.Views
{
    public partial class Session : System.Web.UI.Page
    {
        int _clicks = 1;
        string _text;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack || Session.IsNewSession)
            {
                Session.Add("text", TextBox1.Text);
                Session["clicks"] = _clicks;
            }
            else
            {
                _text = Session["text"].ToString();
                _clicks = (int)Session["clicks"];

                Session["clicks"] = ++_clicks;

                Response.Write($"Text: {_text} Clicks: {_clicks}");
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            Session["text"] = TextBox1.Text;
        }

        protected void Abandon_Click(object sender, EventArgs e)
        {
            TextBox1.Text = "";
            Session.Abandon();
        }
    }
}