using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebASP_3.Views
{
    public partial class PreviousPage2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PreviousPage1 previous = PreviousPage as PreviousPage1;

            if (previous != null)
            {
                Label1.Text = previous.TextBoxText;
            }

            GetPreviousPage();
        }

        private void GetPreviousPage()
        {
            Type type = PreviousPage.GetType();
            MethodInfo methodInfo = type.GetMethod("GetText");
            string text1 = methodInfo.Invoke(PreviousPage, null).ToString();

            PropertyInfo propertyInfo = type.GetProperty("TextBoxText");
            string text2 = propertyInfo.GetGetMethod().Invoke(PreviousPage, null).ToString();

            Response.Write($"<h1>{text1} {text2}</h1>");
        }
    }
}