using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.Common;
using System.Data.Odbc;
using System.Data.OleDb;
using System.Data.OracleClient;
using System.Data.SqlClient; //SqlConnection
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp_ADO1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //localhost\sqlexpress_2019
            //(local)\sqlexpress_2019

            //------------------------------------ //------------------------------------
            // string connectionString = @"Data Source=(local)\sqlexpress_2019;Initial Catalog=Universt;Integrated Security=True;Connect Timeout=20";

            //    //1
            //    //string connectionString = @"Data Source=(local)\sqlexpress_2019;Initial Catalog=Universt;Integrated Security=True;Connect Timeout=20";



            //     DbProviderFactory providerFactory =  DbProviderFactories.GetFactory
            //         ("System.Data.SqlClient");

            //     try
            //     {    //MySalConnection
            //          //        OracleConnection
            //          //        using System.Data.OracleClient;
            //          //    OdbcConnection
            //          //    System.Data.Odbc.OdbcConnection


            //         using
            //(DbConnection connection = providerFactory.CreateConnection())
            //         {
            //             connection.ConnectionString = connectionString;

            //             using (DbCommand command = providerFactory.CreateCommand())
            //             {
            //                     command.CommandText = "SELECT * FROM Students;";
            //                     command.Connection = connection;
            //                 connection.Open();

            //                 using
            //                     (DbDataReader reader = command.ExecuteReader())
            //                 {
            //                     while (reader.Read())
            //                     {
            //                         Console.WriteLine($"Id: {reader[0]}\nLast name: {reader["LastName"]}\n" +
            //                             $"First name:{reader["FirstName"]}\nDate of birth : {Convert.ToDateTime(reader["BirthDate"]).ToLongDateString()}" +
            //                             $"\nGroup Id: {reader["GroupId"]}");

            //                         // 
            //                         //         Console.WriteLine
            //                         //($"Id: {​reader[0]}​\nLast name: {​reader["LastName"]}​\nFirst name: {​reader["FirstName"]}​\nDate of birth: {​Convert.ToDateTime(reader["BirthDate"]).ToLongDateString()}​\nGroup id: {​reader["GroupId"]}​");



            //                     }
            //                 }

            //             }




            //         }

            //     }
            //     catch (Exception ex)
            //     {
            //         Console.WriteLine(ex.Message);
            //     }

            //------------------------------------ //------------------------------------
           /*3*/ SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder
            {
                DataSource = "localhost\\sqlexpress",
                InitialCatalog = "Universt",
                IntegratedSecurity = true,
                ConnectTimeout = 20
            };
            string connectionString = builder.ConnectionString;

            ////1
            ////string connectionString = @"Data Source=(local)\sqlexpress_2019;Initial Catalog=Universt;Integrated Security=True;Connect Timeout=20";



            DbProviderFactory providerFactory = DbProviderFactories.GetFactory
                ("System.Data.SqlClient");

            try
            {
                //string connectionString = ConfigurationManager.AppSettings["connectStr"];
               //2
                //string connectionString = ConfigurationManager.ConnectionStrings
                //    ["connectStr"].ConnectionString;
              
                //string provider = ConfigurationManager.AppSettings["provider"];
             

                //DbProviderFactory providerFactory = DbProviderFactories.GetFactory
                //    (provider);

                using
       (DbConnection connection = providerFactory.CreateConnection())
                {
                    connection.ConnectionString = connectionString;

                    using (DbCommand command = providerFactory.CreateCommand())
                    {
                        command.CommandText = "SELECT * FROM Students;";
                        command.Connection = connection;
                        connection.Open();

                        using
                            (DbDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Console.WriteLine($"Id: {reader[0]}\nLast name: {reader["LastName"]}\n" +
                                    $"First name:{reader["FirstName"]}\nDate of birth : {Convert.ToDateTime(reader["BirthDate"]).ToLongDateString()}" +
                                    $"\nGroup Id: {reader["GroupId"]}");

                                // 
                                //         Console.WriteLine
                                //($"Id: {​reader[0]}​\nLast name: {​reader["LastName"]}​\nFirst name: {​reader["FirstName"]}​\nDate of birth: {​Convert.ToDateTime(reader["BirthDate"]).ToLongDateString()}​\nGroup id: {​reader["GroupId"]}​");



                            }
                        }

                    }




                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            Console.ReadKey();
        }
    }
}
