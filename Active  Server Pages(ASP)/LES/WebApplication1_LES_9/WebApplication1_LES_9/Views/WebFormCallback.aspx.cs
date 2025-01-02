using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1_LES_9.Views
{
    public partial class WebFormCallback : System.Web.UI.Page
    {
        private Dictionary<string, int> _keyValues = new Dictionary<string, int>
        {
            ["Asp.Net"] = 10,
            ["C#"] = 9,
            ["JavaScript"] = 8
        };
        protected void Page_Load(object sender, EventArgs e)
        {

            Label1.DataBind();
            ListBoxSubjects.DataSource = _keyValues.Keys;
            ListBoxSubjects.DataBind();

            ClientScriptManager scriptManager = Page.ClientScript;
            string resp = scriptManager.GetCallbackEventReference(this, "'date'", "showDate", null, false);
            btnDateTime.Attributes["onclick"] = $"javascript:{{{resp}}}";

            resp = scriptManager.GetCallbackEventReference(this, "document.getElementById('ListBoxSubjects').value",
                "showRating", null, false);
            btnDateTime.Attributes["onclick"] = $"javascript:{{{resp}}}";
        }
        private string _eventArgument;
        void ICallbackEventHandler.RaiseCallbackEvent(string eventArgument)
        {
            _eventArgument = eventArgument;
        }

        string ICallbackEventHandler.GetCallbackResult()
        {
            if (string.IsNullOrEmpty(_eventArgument))
            {
                return string.Empty;
            }
            if (_eventArgument.Equals("date"))
            {
                return DateTime.Now.ToString();
            }
            else
            {
                return _keyValues[_eventArgument].ToString();
            }
        }
    }
}