using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADO2
{
    class LibraryDB
    {
        private string _connectString;

        public LibraryDB()
        {
            _connectString = ConfigurationManager.ConnectionStrings["connectStr"].ConnectionString;
        }

        public void SelectDB(string commandText)
        {
            try
            {
                SqlConnection connection = new SqlConnection(_connectString);
                try
                {
                    //SqlCommand command = new SqlCommand(commandText, connection);
                    SqlCommand command = new SqlCommand
                    {
                        CommandText = commandText,
                        Connection = connection
                    };
                    try
                    {
                        connection.Open();

                        SqlDataReader reader = command.ExecuteReader(); //if select command
                        try
                        {
                            do
                            {
                                while (reader.Read())
                                {
                                    for (int i = 0; i < reader.FieldCount; i++)
                                    {
                                        Console.Write($"{reader.GetName(i)}: {reader.GetValue(i)}\t\t");
                                    }
                                    Console.WriteLine();
                                }
                                Console.WriteLine("\n----------------------------\n");
                            } while (reader.NextResult()); //if есть следущ. запись
                        }
                        finally
                        {
                            reader.Close();
                        }
                    }
                    finally
                    {
                        command.Dispose(); //Утилизировать
                    }
                }
                finally
                {
                    connection.Close();
                }
            }
            catch
            {
                throw;
            }
        }

        public void NonQueryDB(string commandText)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(_connectString))
                {
                    using (SqlCommand command = new SqlCommand(commandText, connection))
                    {
                        connection.Open();

                        if (command.ExecuteNonQuery() > 0) //запрос на проверку есть ли данные
                        {
                            Console.WriteLine("Commands completed successfully.");
                        }
                        else
                        {
                            throw new Exception("...");
                        }
                    }
                }
            }
            catch
            {
                throw;
            }
        }

        public int RecordCount(string table) //функц гарант возращ 1 значение = регирующие функц.
        {
            try
            {
                string text = $"SELECT COUNT(*) FROM {table};";
                using (SqlConnection connection = new SqlConnection(_connectString))
                {
                    using (SqlCommand command = new SqlCommand(text, connection))
                    {
                        connection.Open();

                        return Convert.ToInt32(command.ExecuteScalar());
                        //ExecuteScalar -> Выполняет запрос и возвращает (1 строку)
                        //первый столбец первой строки результирующего набора,
                        //возвращенного запросом.
                        //Дополнительные столбцы или строки игнорируются.

                    }

                }

            }
            catch
            {
                throw;
            }

       }


        public void StudentInsert(Student student)
        {
            /*  correct
            string name = textBox1.Text; //Jack
            string text = "SELECT * FROM Students WHERE FirstName = '{name}';";
             */

            /*  incorrect
            text';query--
            string name = textBox1.Text; //Jack';DELETE FROM Students--
            string text = "SELECT * FROM Students WHERE FirstName = '{name}';";

              string text =
$"INSERT INTO Students VALUES(@FirstName,@LastName,@IDGroup,@Term);";
             */

            // localhost\sqlexpress_2019.library.dbo     _ADD
            try
            {
  string text = $"INSERT INTO Students VALUES(@FirstName,@LastName,@IDGroup,@Term);";
                //$"INSERT INTO Students VALUES('{student.FirstName}','{student.LastName}',{student.IDGroup},{student.Term});";
                using (SqlConnection connection = new SqlConnection(_connectString))
                {
                    using (SqlCommand command = new SqlCommand(text, connection))
                    {
                        //              connection.Open();

                        //              if (command.ExecuteNonQuery() > 0) //запрос без ...
                        ////просто выполняет sql-выражение и возвращает количество измененных записей.
                        //              {
                        //                  Console.WriteLine("Commands completed successfully.");
                        //              }
                        //              else
                        //              {
                        //                  throw new Exception("...");
                        //              }

                        SqlParameter parameter = new SqlParameter//sneller
                        {
                            ParameterName = "@FirstName",
                            Value = student.FirstName,
                            SqlDbType = SqlDbType.VarChar,
                            Size = 50
                        };
                        command.Parameters.Add(parameter);
                        parameter = new SqlParameter
                        {
                            ParameterName = "@LastName",
                            Value = student.LastName,
                            SqlDbType = SqlDbType.VarChar,
                            Size = 50
                        };
                        command.Parameters.Add(parameter);
                       parameter = new SqlParameter
                        {
                            ParameterName = "@IdGroup",
                            Value = student.IDGroup,
                            SqlDbType = SqlDbType.Int,
                            Size = 50
                        };
                        command.Parameters.Add(parameter);
                        parameter = new SqlParameter
                        {
                            ParameterName = "@Term",
                            Value = student.Term,
                            SqlDbType = SqlDbType.Int,
                            Size = 50
                        };
                        command.Parameters.Add(parameter);
                        
                    }

                }

            }
            catch
            {
                throw;
            }

        }


        public string GetLastName(int id)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(_connectString))
                {
                    using (SqlCommand command = new SqlCommand("GetName",connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        SqlParameter parameter = new SqlParameter
                        {
                            ParameterName = "@Id",
                            Value = id,
                            SqlDbType = SqlDbType.Int
                        };
                        command.Parameters.Add(parameter);
                        parameter = new SqlParameter
                        {
                            ParameterName = "@Name",
                            SqlDbType = SqlDbType.VarChar,
                            Size=50,
                            Direction = ParameterDirection.Output
                            //output -> выходной (lezen)
                        };
                        command.Parameters.Add(parameter);

                        connection.Open();

                        command.ExecuteNonQuery();

                       
               return command.Parameters["@Name"].Value.ToString();

                    }
                }
            }
            catch 
            {

                throw;
            }
        }

    }
    }
