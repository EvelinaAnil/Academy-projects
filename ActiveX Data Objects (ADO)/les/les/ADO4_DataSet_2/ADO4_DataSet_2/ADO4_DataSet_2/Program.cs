using ADO4_DataSet_2.DBClasses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Linq.Expressions;

namespace ADO4_DataSet_2
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                LibraryDB libraryDB = new LibraryDB();

                //libraryDB.AuthorAdd("Daniels", "Jack");

                // libraryDB.BookUpdate("SQL", 5);

                //libraryDB.AuthorDelete("Daniels");
                //libraryDB.AuthorDelete("Daniels");

                //libraryDB.PrintDS();

                //libraryDB.PrintRelation("Authors", "Books", "AuthorBooks");

                //libraryDB.GetAuthorByFirstChar('К'); // rus

                //вывести авторов чье ID больше 5 и меньше 15
                //      var reslult = from d in libraryDB._dataSet.Tabels["Authors"].AsEnumerable()
                ///*Field or Convert*/where d.Field<int>(d["ID"] >5)&& d.Field<int>(d["ID"] < 15)
                //                   orderby d["LastName"] ascending
                //                   select 
                //                   /*d;*/ 
                //                   new
                //                   {
                //                       FirstName = d.Field<string>("FirstName"),
                //                       LastName = d.Field<string>("LirstName")
                //                   };
                //      foreach (var item in reslult)
                //      {
                //          Console.WriteLine(item);
                //      }

                //foreach (var item in reslult)
                //{
                //    Console.WriteLine($"{item["LastName"]} {item["FirstName"]}");
                //}

                //вівести студент из груп 9А
                var result = from st in libraryDB._dataSet.Tables["Students"].AsEnumerable()
                             from gr in libraryDB._dataSet.Tables["Groups"].AsEnumerable()
                             
                             where st.Field<int>("Id_Group") == gr.Field<int>("Id")
                             && gr.Field<string>("Name") == "9А"
                             select
                             new
                             {
                                 FirstName = st.Field<string>("FirstName"),
                                 LastName = st.Field<string>("LirstName"),
                                 GroupName = gr.Field<string>("Name")
                             };
                foreach (var item in result)
                      {
                          Console.WriteLine(item);
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
