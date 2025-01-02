using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebASP_3.Views
{
    public partial class Cookie1 : System.Web.UI.Page
    {
        private string _result;
        private int _count;

        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["count"];
            if (cookie != null)
            {
                int.TryParse(cookie.Value, out _count);
            }
            _count++;
            cookie = Response.Cookies["count"];
            cookie.Value = _count.ToString();
            cookie.Expires = DateTime.Now.AddDays(1);

            _result = $"Current: {_count}";
        }

        protected override void Render(HtmlTextWriter writer)
        {
            writer.RenderBeginTag(HtmlTextWriterTag.Center);
            base.Render(writer);
            writer.Write("<hr />");
            writer.Write(_result);
            writer.RenderEndTag();
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = new HttpCookie("oldInfo");
            cookie["name"] = TextBox1.Text;
            cookie["clicks"] = _count.ToString();
            Response.Cookies.Add(cookie);
        }

        protected void Restore_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["oldInfo"];
            if (cookie != null)
            {
                _result = $"Save text: {Server.HtmlEncode(cookie["name"])} Clicks: {Server.HtmlEncode(cookie["clicks"])}";
            }
            else
            {
                _result = "No cookies!";
            }
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            if (Response.Cookies["count"] != null)
            {
                Response.Cookies["count"].Expires = DateTime.Now.AddDays(-1);
            }
        }
    }
}