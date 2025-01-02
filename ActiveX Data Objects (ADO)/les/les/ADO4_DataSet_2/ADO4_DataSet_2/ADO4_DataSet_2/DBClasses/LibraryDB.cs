using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADO4_DataSet_2.DBClasses
{
    class LibraryDB
    {
        private string _connectionString;
        private DataSet _dataSet { get; }

        private SqlDataAdapter _adapterAuthors;
        private SqlDataAdapter _adapterBooks;

        public LibraryDB()
        {
            try
            {
                _connectionString = ConfigurationManager.ConnectionStrings["library"].ConnectionString;

                _dataSet = new DataSet();

                _adapterAuthors = new SqlDataAdapter("SELECT Id, FirstName, LastName FROM Authors;", _connectionString);
                _adapterBooks = new SqlDataAdapter("SELECT Id, Name, Pages, Id_Author, Quantity FROM Books;", _connectionString);

                SqlCommandBuilder commandBuilder = new SqlCommandBuilder(_adapterAuthors);
                _adapterAuthors.Fill(_dataSet, "Authors");
                
                commandBuilder = new SqlCommandBuilder(_adapterBooks);
                _adapterBooks.Fill(_dataSet, "Books");

                DataRelation dataRelation = new DataRelation(
                    "AuthorBooks",
                    _dataSet.Tables["Authors"].Columns["Id"],
                    _dataSet.Tables["Books"].Columns["Id_Author"]
                    );
                _dataSet.Relations.Add(dataRelation);

                SqlDataAdapter adapterStudents = new SqlDataAdapter(("SELECT * FROM Students;"), _connectionString);
                adapterStudents.Fill(_dataSet, "Students");

                SqlDataAdapter adapterGroups = new SqlDataAdapter(("SELECT * FROM Groups;"), _connectionString);
                adapterGroups.Fill(_dataSet, "Groups");
            }
            catch
            {
                throw;
            }
        }

        public void PrintDS()
        {
            foreach (DataTable table in _dataSet.Tables)
            {
                Console.WriteLine($"\n\t\t\t{table.TableName}");

                foreach (DataColumn column in table.Columns)
                {
                    Console.Write($"{column.Caption}\t\t");
                }
                Console.WriteLine("\n------------------------------------------\n");

                foreach (DataRow row in table.Rows)
                {
                    foreach (object item in row.ItemArray)
                    {
                        Console.Write($"{item}\t\t");
                    }
                    Console.WriteLine();
                }
            }
        }

        public void AuthorAdd(string lName, string fName)
        {
            try
            {
                DataRow dataRow = _dataSet.Tables["Authors"].NewRow();
                dataRow["LastName"] = lName;
                dataRow["FirstName"] = fName;
                _dataSet.Tables["Authors"].Rows.Add(dataRow);

                _adapterAuthors.Update(new DataRow[] { dataRow });

                Console.WriteLine("Insert OK!");
            }
            catch
            {
                throw;
            }
        }

        public void BookUpdate(string name ,int n)
        {
            try
            {
                //DataRow dataRow = _dataSet.Tables["Books"].Rows.Cast<DataRow>()
                //    .FirstOrDefault(r => r["Name"].ToString() == name);
                
                DataRow dataRow = _dataSet.Tables["Books"].Rows.Cast<DataRow>()
                    .FirstOrDefault(r => r.Field<string>("Name").ToString() == name);
                
                //DataRow dataRow = _dataSet.Tables["Books"].Rows.Cast<DataRow>()
                //   .FirstOrDefault(r => Convert.ToInt32(r("Quantity")) == n);
                //DataRow dataRow = _dataSet.Tables["Books"].Rows.Cast<DataRow>()
                //   .FirstOrDefault(r => r.Field<int>("Quantity") == n);
                if (dataRow != null) 
                {
                    dataRow["Quantity"] = n;
                    _adapterBooks.Update(_dataSet , "Books");

                    Console.WriteLine("Update Succsess!");
                }
            }
            catch 
            {

                throw;
            }
        }

        public void AuthorDelete(string name)
        {
            try
            {
                DataRow dataRow = _dataSet.Tables["Authors"].Rows.Cast<DataRow>()
                    .FirstOrDefault(r => r.Field<string>("LastName") == name);

                if (dataRow != null)
                { /*1 exampl*/
                    //_dataSet.Tables["Authors"].Rows.Remove(dataRow);
                    // _adapterAuthors.Update(_dataSet, "Authors");


                    /*2 exampl Beste!!*/
                    int index = _dataSet.Tables["Authors"].Rows.IndexOf(dataRow);
                    if (index > -1)
                    {

                    }
                    _dataSet.Tables["Authors"].Rows[index].Delete();
                    _adapterAuthors.Update(_dataSet, "Authors");

                    Console.WriteLine("Delete Succsess!");
                }
            }
            catch 
            {

                throw;
            }
        }

        public void PrintRelation(string parentTable, string childTable, string relationName)
        {
            foreach (DataRow row in _dataSet.Tables[parentTable].Rows)
            {
                Console.WriteLine($"{row.Field<string>("LastName")} {row["FirstName"]}");

                foreach (DataRow item in row.GetChildRows(relationName))
                {
                    for (int i = 0; i < _dataSet.Tables[childTable].Columns.Count; i++)
                    {
                        Console.Write($"{item[i]}\t");
                    }
                    Console.WriteLine();
                }
                Console.WriteLine();
            }
        }

        public void GetAuthorByFirstChar(char ch)
        {
            foreach (DataRow row in _dataSet.Tables["Authors"].Select($"LastName LIKE '{ch}%'"))
            {
                Console.WriteLine($"{row.Field<string>("LastName")} {row.Field<string>("FirstName")}");
            }
        }
        public void Query(char ch)
        {
            //var result = from d in 
        }
    }
}
