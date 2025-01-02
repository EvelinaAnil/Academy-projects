using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WindowsFormsApp_ADO_7_DataSet_4.DBClasses
{
     class NorthwindDB
    {
        private string _connectString;
        public DataSet DataSet { get;}

        public SqlDataAdapter AdapterCustomers  { get; }

        public SqlDataAdapter AdapterOrders  { get; }
        public SqlDataAdapter AdapterOrdersId  { get; }
        public SqlDataAdapter AdapterEmployees  { get; }
        public SqlDataAdapter AdapterOrderDetails  { get; }
   

        public NorthwindDB()
        {
            try
            {
                DataSet =new DataSet();
                _connectString = 
                    ConfigurationManager.ConnectionStrings
                 ["librar"].ConnectionString;

                using ( SqlConnection connection = new SqlConnection(_connectString))
                {
                    AdapterCustomers = new SqlDataAdapter
                        ("SELECT FirstName, SecondName FROM Author;", _connectString);
                }

                AdapterOrders = new SqlDataAdapter
("SELECT Name FROM Book WHERE PublishId = @ID ORDER BY Publishing_house AND  AuthorId = @ID ORDER BY Author;",
        _connectString);
                SqlParameter parameter = new SqlParameter
                {
                    ParameterName = "@ID",
                    SqlDbType = SqlDbType.NChar,
                    Size = 5,
                    Value = "AROUT"
                };
                AdapterOrders.SelectCommand.Parameters.Add(parameter);

                AdapterOrdersId = new SqlDataAdapter
    ("SELECT Book.Id, AuthorId, PublishId,Name,Author.FirstName, Author.SecondName,Publishing_house.NamePublisher FROM Book , Publishing_house , Author WHERE Book.Id = @OID AND AuthorId = Author.Id AND PublishId = Publishing_house.Id ;", _connectString);
                parameter = new SqlParameter
                {
                    ParameterName = "@OID",
                    SqlDbType = SqlDbType.Int,
                    Value = 10355
                };
                AdapterOrdersId.SelectCommand.Parameters.Add(parameter);

                AdapterEmployees = new SqlDataAdapter
("SELECT Author.Id,LastName+' '+FirstName AS FullName FROM Author,Book WHERE AuthorId = @Author.Id;", _connectString);
                parameter = new SqlParameter
                {
                    ParameterName = "@Author.Id",
                    SqlDbType = SqlDbType.Int,
                    Value = 1
                };
                AdapterEmployees.SelectCommand.Parameters.Add(parameter);

              

                SqlCommandBuilder builder = new SqlCommandBuilder(AdapterCustomers);
                AdapterCustomers.Fill(DataSet, "Author");

                builder = new SqlCommandBuilder(AdapterOrders);
                AdapterOrders.Fill(DataSet, "Book");
                AdapterOrdersId.Fill(DataSet, "Book");

                AdapterEmployees.Fill(DataSet, "Author");

            }
            catch 
            {

                throw;
            }
        }
    }
}
