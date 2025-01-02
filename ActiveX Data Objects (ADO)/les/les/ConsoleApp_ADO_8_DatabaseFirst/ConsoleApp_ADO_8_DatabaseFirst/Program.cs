using ConsoleApp_ADO_8_DatabaseFirst.DBClasses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp_ADO_8_DatabaseFirst
{
     class Program
    {
        static void Main(string[] args)
        {
            StudentDB studentDB = new StudentDB();
            //studentDB.SubjectInsert("C#");

            studentDB.StudentInsert("Dark", "Jane", "AS5789",
              new  List<Subject>
                {
                new Subject { SubjectName="JavaScript"},
                new Subject { SubjectName="C#"},
            }
            );

            studentDB.StudentInsert("Doe", "Rick", "BF5789",
             new List<Subject>
               {
                new Subject { SubjectName="ADO.NET"},
                new Subject { SubjectName="WPF"},
                new Subject { SubjectName="JavaScript"},
           }
           );

            studentDB.StudentDelete("BF5789");

            studentDB.StudentUpdate("BF5789", new List<Subject>
               {
                new Subject { SubjectName="ADO.NET"},
                new Subject { SubjectName="Windows Forms"},
                new Subject { SubjectName="C++"},
           });
            studentDB.Show();





            Console.ReadKey();
        }
    }
}
