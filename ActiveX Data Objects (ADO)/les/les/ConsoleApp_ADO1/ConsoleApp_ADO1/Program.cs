using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Data.OleDb;

using System.Data.SqlClient; //SqlConnection
using System.Linq;
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

        string connectionString = @"Data Source=(local)\sqlexpress_2019;Initial Catalog=Universt;Integrated Security=True;Connect Timeout=20";

            try
            {    //MySalConnection
                 //        OracleConnection
                 //        using System.Data.OracleClient;
                 //    OdbcConnection
                 //    System.Data.Odbc.OdbcConnection


                using
       (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand("SELECT * FROM Students;",
                       connection))
                    {
                        connection.Open();

                        using
                            (SqlDataReader reader = command.ExecuteReader())
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
