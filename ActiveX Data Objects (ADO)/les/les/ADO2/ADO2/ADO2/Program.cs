using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ADO2
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                LibraryDB libraryDB = new LibraryDB();

                //libraryDB.SelectDB("SELECT Students.Id AS StudId, FirstName, LastName, [Name], Term FROM Students JOIN Groups ON Groups.Id = Id_Group;SELECT * FROM Teachers;");

                //int id = 4;
                //libraryDB.NonQueryDB($"UPDATE Students SET LastName='Петрова' WHERE Id={id}");
                //libraryDB.SelectDB("SELECT FirstName, LastName FROM Students;");

                //Console.WriteLine($"Count: {libraryDB.RecordCount("Groups")}");



                //Student student = new Student()
                //{
                //    FirstName="Nicole",
                //    LastName="Taylor",
                //    IDGroup=4,
                //    Term=3
                //};
                //libraryDB.StudentInsert(student);
                libraryDB.SelectDB("SELECT * FROM Students;");

                int id = 8;
                Console.WriteLine($"The last name author by id equals {id}: " +
                    $"{libraryDB.GetLastName(id)}");
                


            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            Console.ReadKey();
        }
    }
}
