using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleAppADO_9_ModelFirst
{
     class UserDB
    {
        private UserModelContainer _modelContainer;

        public UserDB()
        {
            try
            {
                _modelContainer = new UserModelContainer();

                if (_modelContainer.DepartmentSet.Count()==0)
                {
                    InsertData();
                }
                else
                {
                    Console.WriteLine("Records exist!");
                }

            }
            catch 
            {

                throw;
            }
        }

        private void InsertData()
        {
            _modelContainer.UserSet.Add(
                new User
                {
                    LastName = "Williams",
                    FirstName = "Robert",
                    BirthDate = new DateTime(1994, 5, 12),
                    Department = new Department { DeptName = "MainOffice" }
                });

            Department department = new Department { DeptName = "Office" };

            _modelContainer.UserSet.Add(
                new User
                {
                    LastName = "Simpson",
                    FirstName = "Homer",
                    BirthDate = new DateTime(1992, 8, 23),
                    Email="hs@net.eu",
                    Department =department,

                });
                        _modelContainer.UserSet.Add(
                new Admin
                {
                    LastName = "THE KILLER",
                    FirstName = "Jack",
                    BirthDate = new DateTime(1998, 11, 1),
                    Email="admin@net.eu",
                    Department =department,
                    Level=12,

                });
            _modelContainer.SaveChanges();

            Console.WriteLine("Records Saved!");
        }
        public void Show()
        {
            foreach (var dept in _modelContainer.DepartmentSet)
            {
                Console.WriteLine(dept.DeptName);

                foreach (var user in dept.Users)
                {
                    Console.WriteLine($"\t{user}");
                }
            }
        }
   
    public void AdminsShow()
        {
            foreach (var item in _modelContainer.UserSet.OfType<Admin>())
            {
                Console.WriteLine(item);
            }
        }

    }
}
