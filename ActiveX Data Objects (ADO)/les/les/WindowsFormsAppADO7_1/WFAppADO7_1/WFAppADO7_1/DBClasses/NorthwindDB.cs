﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WFAppADO7_1.DBClasses
{
    internal class NorthwindDB
    {
        private string _connectionString;

        public DataSet DataSet  { get; }

        public SqlDataAdapter AdapterCustomers { get; }
        public SqlDataAdapter AdapterOrders { get; }
        public SqlDataAdapter AdapterOrdersId { get; }
        public SqlDataAdapter AdapterEmployees { get; }
        public SqlDataAdapter AdapterOrderDetails { get; }


        public NorthwindDB()
        {
            try
            {
                DataSet = new DataSet();

                _connectionString = ConfigurationManager.ConnectionStrings
                    ["mainDB"].ConnectionString;

                using(SqlConnection connection  = new SqlConnection(_connectionString))
                {
                    //-----AdapterCustomers
                    AdapterCustomers = new SqlDataAdapter("SELECT CustomerID, CompanyName FROM Customers;", _connectionString);

                    //-----AdapterOrders
                    AdapterOrders = new SqlDataAdapter("SELECT OrderID, OrderDate, RequiredDate, ShippedDate FROM Orders WHERE CustomerID = @ID ORDER BY OrderDate;", _connectionString);

                    SqlParameter parameter = new SqlParameter
                    {
                        ParameterName = "@ID",
                        SqlDbType = SqlDbType.NChar,
                        Size = 5,
                        Value = "AROUT"
                    };
                    AdapterOrders.SelectCommand.Parameters.Add(parameter);

                    //---------AdapterOrdersId
                    AdapterOrdersId = new SqlDataAdapter("SELECT OrderID, CustomerID, EmployeeID, OrderDate, RequiredDate,ShippedDate, ShipVia, Freight, ShipName, ShipAddress, ShipCity, ShipRegion,ShipPostalCode, ShipCountry FROM Orders WHERE OrderID = @OID;", _connectionString);
                    parameter = new SqlParameter
                    {
                        ParameterName = "@OID",
                        SqlDbType = SqlDbType.Int,
                        Value = 10355
                    };
                    AdapterOrdersId.SelectCommand.Parameters.Add(parameter);


                    // -----------AdapterEmployees
                    AdapterEmployees = new SqlDataAdapter("SELECT EmployeeID,LastName+' '+FirstName AS FullName FROM Employees WHERE EmployeeID = @EmployeeID;", _connectionString);
                    parameter = new SqlParameter
                    {
                        ParameterName = "@EmployeeID",
                        SqlDbType = SqlDbType.Int,
                        Value = 1
                    };
                    AdapterEmployees.SelectCommand.Parameters.Add(parameter);

                    //-------AdapterOrderDetails
                    AdapterOrderDetails = new SqlDataAdapter("SELECT OrderID, ProductID, UnitPrice, Quantity, Discount FROM [Order Details] WHERE OrderID = @OrderID", _connectionString);
                    parameter = new SqlParameter
                    {
                        ParameterName = "@OrderID",
                        SqlDbType = SqlDbType.Int,
                        Value = 1
                    };
                    AdapterOrderDetails.SelectCommand.Parameters.Add(parameter);


                    SqlCommandBuilder builder = new SqlCommandBuilder(AdapterCustomers);
                    AdapterCustomers.Fill(DataSet, "Customers");

                    builder = new SqlCommandBuilder(AdapterOrders);
                    AdapterOrders.Fill(DataSet, "Orders");

                    AdapterOrdersId.Fill(DataSet, "OrdersID");
                    AdapterEmployees.Fill(DataSet, "Employees");
                    AdapterOrderDetails.Fill(DataSet, "OrderDetails");
                }
            }
            catch (Exception)
            {

                throw;
            }
        }


    }
}
