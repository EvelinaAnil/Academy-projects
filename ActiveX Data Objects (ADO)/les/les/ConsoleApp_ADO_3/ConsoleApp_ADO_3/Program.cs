using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp_ADO_3
{
    internal class Program
    {
        static void Main(string[] args)
        {
                try
            {
                DatabaseClass.CreateDatabase("script.sql");

                DatabaseClass databaseClass = new DatabaseClass();

             //  databaseClass.SETCriticalDebtor(2);
                databaseClass.SetCriticalDebtor(2);
                databaseClass.SelectDB
          ("SLECT * FROM Students;SELECT * FROM CriticalDebtors;");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            Console.ReadKey();
        }
    }
}
