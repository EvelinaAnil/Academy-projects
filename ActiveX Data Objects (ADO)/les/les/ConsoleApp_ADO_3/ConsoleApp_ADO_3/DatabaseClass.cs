using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;


namespace ConsoleApp_ADO_3
{
    class DatabaseClass
    {
        private string _connectionString;
        public DatabaseClass()
        {
            _connectionString = ConfigurationManager.ConnectionStrings["connectStr"].ConnectionString;

        }

        public static void CreateDatabase(string filename) 
        {
            string dbName = "Universt";
            string createDB = "Use master;" +
            $"IF(SELECT name FROM master.sys.databases WHERE name like '{dbName}') is null  " +
            "begin " +
           $" create database...; " +
            $"end" +
            $"else" +
            $"ROLLBACK";

            try
            {
                using (SqlConnection connection = new SqlConnection
                    (ConfigurationManager.ConnectionStrings["master"].ConnectionString))
                {
                    using (SqlCommand command = new SqlCommand(createDB, connection))
                    {
                        connection.Open();
                       command.ExecuteNonQuery();
                    }
                }

                using (SqlConnection connection = new SqlConnection
                    (ConfigurationManager.ConnectionStrings["connectStr"].ConnectionString))
                {
                    using (SqlCommand command = new SqlCommand(File.ReadAllText(fileName,
                        Encoding.Default), connection))
                    {
                        connection.Open();
                        if (command.ExecuteNonQuery() <=0)
                        {
                            throw new Exception(".........");
                        }
                        Console.WriteLine("Commands completed successfuly!");
                    }
                }
            }
            catch ( Exception ex)
            {
                if (!ex.Message.Contains("ROLLBACK"))
                {
                    throw;
                }
               
            }


        }

        public void SelectDB(string commandText)
        {
            try
            {
                SqlConnection connection = new SqlConnection(_connectionString);
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

        public void SetCriticalDebtor(int id)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(_connectionString))
                {
                    SqlCommand insertCommand = new SqlCommand($"INSERT INTO CriticalDebtors SELECT * FROM Students WHERE Id = {id};", connection);

                    SqlCommand removeCommand = new SqlCommand($"DELETE FROM Students WHERE Id = {id};", connection);

                    SqlTransaction transaction = null;
                    try
                    {
                        connection.Open();

                        transaction = connection.BeginTransaction(/*System.Data.IsolationLevel.RepeatableRead*/);

                        insertCommand.Transaction = transaction;
                        removeCommand.Transaction = transaction;

                        if (insertCommand.ExecuteNonQuery() > 0)
                        {
                            removeCommand.ExecuteNonQuery();

                            transaction.Commit();

                            Console.WriteLine("Commands completed successfuly!");
                        }
                    }
                    catch
                    {
                        transaction.Rollback();

                        throw;
                    }
                    finally
                    {
                        insertCommand.Dispose();
                        removeCommand.Dispose();
                        transaction.Dispose();
                    }
                }
            }
            catch
            {
                throw;
            }
        }
    }
    //public void SETCriticalDebtor(int id)
    //{
    //    try
    //    {
    //        using (SqlConnection connection = new SqlConnection(_connectionString))
    //        {
    //            SqlCommand insertcommand = new SqlCommand
    //                ($"INSERT INTO CriticalDebtors  SELECT * FROM Students WHERE Id = {id};", connection);
    //            // INSERT CriticalDebtors SELECT* FROM Students WHERE Id ={id}

    //            SqlCommand removecommand = new SqlCommand
    //                    ($"DELETE FROM Students WHERE Id= {id};", connection);

    //            SqlTransaction transaction = null;
    //            try
    //            { connection.Open();
    //                transaction = connection.BeginTransaction
    //                    (/*IsolationLevel.RepeatableRead*/);


    //                insertcommand.Transaction = transaction;
    //                removecommand.Transaction = transaction;

    //               if(insertcommand.ExecuteNonQuery() > 0)
    //                { 
    //                    removecommand.ExecuteNonQuery();

    //                    transaction.Commit(); //зафиксировать
    //                    Console.WriteLine ("......");
    //                    Console.WriteLine("Commands completed succsessfuly!");
    //                }






    //            }
    //            catch
    //            {
    //                transaction.Rollback();
    //                //откат транзакции


    //                throw;
    //            }
    //            finally
    //            {
    //                insertcommand.Dispose();
    //                removecommand.Dispose();
    //                transaction.Dispose();

    //            }

    //        }
    //        }
    //    catch
    //    {

    //        throw;
    //    }

    //}
}

