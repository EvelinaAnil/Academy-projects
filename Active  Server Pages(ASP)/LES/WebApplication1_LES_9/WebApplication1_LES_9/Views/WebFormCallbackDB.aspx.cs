using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1_LES_9.Views
{
    public partial class WebFormCallbackDB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dropDownLIstAuthors.Attributes["onchange"] = Page.ClientScript.GetCallbackEventReference(this,
                "document.getElementById('dropDownListAuthors').value", "clientCallback", null, false);

        }
        private string _eventArgument;
        void ICallbackEventHandler.RaiseCallbackEvent(string eventArgument)
        {
            _eventArgument = eventArgument;

        }

        string ICallbackEventHandler.GetCallbackResult()
        {
            using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["library"].ConnectionString))
            {
                using (SqlCommand command = new SqlCommand("SELECT * FROM Books WHERE Id_author = @AuthorId;",
                    connection)
                {
                    command.Parameters.Add(new SqlParameter("@AuthorId",System.Data.SqlDbType.Int));
                command.Parameters["@AuthorId"].Value = int.Parse(_eventArgument);
                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {

                }
            
            }
        }
    }
}            
        
    
