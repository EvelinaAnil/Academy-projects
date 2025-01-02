using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleAppADO_9_ModelFirst
{
     class Program
    {
        static void Main(string[] args)
        {
            try
            {
                UserDB userDB = new UserDB();
                userDB.Show();

                userDB.AdminsShow();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }

            Console.ReadKey();
        }
    }
}
