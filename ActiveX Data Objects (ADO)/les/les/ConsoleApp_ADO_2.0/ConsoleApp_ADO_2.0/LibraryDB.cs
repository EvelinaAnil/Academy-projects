using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp_ADO_2._0
{ 
    
     class LibraryDB
    {private string _connectString;
        public LibraryDB()
        {
   _connectString = ConfigurationManager.
   ConnectionStrings["connectStr"].ConnectionString;

            
        }
        
        public void SelectDB()
        {
            try
            {
                SqlConnection connection = new SqlConnection
                    ( _connectString );
                try
                {
                    SqlCommand command = new SqlCommand
          ("SELECT FirstName, LastName, Term FROM Students;",connection);
                    try
                    {
                        SqlCommand command = new SqlCommand
                        {
                            CommandText = command,
                            Connection = connection
                        };
                    }
                    finally
                    {
                            
                    }
                }
                finally
                {
                        connection.Close ();
                }

            }
            catch 
            {

                throw;
            }
        }
    }
}
