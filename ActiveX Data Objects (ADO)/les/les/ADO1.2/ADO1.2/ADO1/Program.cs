using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADO1
{
    // localhost\sqlexpress_2019
    // (local)\sqlexpress_2019
    class Program
    {
        static void Main(string[] args)
        {
            /*string connectionString = @"Data Source=(local)\sqlexpress_2019;Initial Catalog=Universt;Integrated Security=True;Connect Timeout=20";

            DbProviderFactory providerFactory = DbProviderFactories.GetFactory("System.Data.SqlClient");

            try
            {
                using (DbConnection connection = providerFactory.CreateConnection())
                {
                    connection.ConnectionString = connectionString;

                    using (DbCommand command = providerFactory.CreateCommand())
                    {
                        command.CommandText = "SELECT * FROM Students;";
                        command.Connection = connection;

                        connection.Open();

                        using (DbDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Console.WriteLine($"Id: {reader[0]}\nLast name: {reader["LastName"]}\nFirst name: {reader["FirstName"]}\nDate of birth: {Convert.ToDateTime(reader["BirthDate"]).ToLongDateString()}\nGroup id: {reader["GroupId"]}\n");
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }*/

            SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder
            {
                DataSource = "localhost\\sqlexpress",
                InitialCatalog = "Universt",
                IntegratedSecurity = true,
                ConnectTimeout = 20
            };

            string connectionString = builder.ConnectionString;

            DbProviderFactory providerFactory = DbProviderFactories.GetFactory("System.Data.SqlClient");

            try
            {
                using (DbConnection connection = providerFactory.CreateConnection())
                {
                    connection.ConnectionString = connectionString;

                    using (DbCommand command = providerFactory.CreateCommand())
                    {
                        command.CommandText = "SELECT * FROM Students;";
                        command.Connection = connection;

                        connection.Open();

                        using (DbDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Console.WriteLine($"Id: {reader[0]}\nLast name: {reader["LastName"]}\nFirst name: {reader["FirstName"]}\nDate of birth: {Convert.ToDateTime(reader["BirthDate"]).ToLongDateString()}\nGroup id: {reader["GroupId"]}\n");
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            /*try
            {
                //string connectionString = ConfigurationManager.AppSettings["connectStr"];

                string connectionString = ConfigurationManager.ConnectionStrings["connectStr"].ConnectionString;

                string provider = ConfigurationManager.AppSettings["provider"];

                DbProviderFactory providerFactory = DbProviderFactories.GetFactory(provider);

                using (DbConnection connection = providerFactory.CreateConnection())
                {
                    connection.ConnectionString = connectionString;

                    using (DbCommand command = providerFactory.CreateCommand())
                    {
                        command.CommandText = "SELECT * FROM Students;";
                        command.Connection = connection;

                        connection.Open();

                        using (DbDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Console.WriteLine($"Id: {reader[0]}\nLast name: {reader["LastName"]}\nFirst name: {reader["FirstName"]}\nDate of birth: {Convert.ToDateTime(reader["BirthDate"]).ToLongDateString()}\nGroup id: {reader["GroupId"]}\n");
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }*/


            Console.ReadKey();
        }
    }
}
