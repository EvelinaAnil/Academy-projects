using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp_ADO_2._0
{
    internal class Program
    {
        static void Main(string[] args)
        {
            try
            {
                LibraryDB libraryDB = new LibraryDB();


            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            Console.ReadKey();
        }
    }
}
