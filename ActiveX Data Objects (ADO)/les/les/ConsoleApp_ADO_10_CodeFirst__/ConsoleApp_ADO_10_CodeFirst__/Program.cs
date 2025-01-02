using ConsoleApp_ADO_10_CodeFirst__.Helpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp_ADO_10_CodeFirst__
{
     class Program
    {
        static void Main(string[] args)
        {
            try
            {
                LibraryDB db = new LibraryDB();
                db.Show();

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            Console.ReadKey();
        }
    }
}
