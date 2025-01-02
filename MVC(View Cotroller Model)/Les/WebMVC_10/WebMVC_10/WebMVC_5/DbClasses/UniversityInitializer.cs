using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using WebMVC_5.Models;

namespace WebMVC_5.DbClasses
{
    // 
    // DropCreateDatabaseAlways
    // DropCreateDatabaseIfModelChanges
    public class UniversityInitializer : CreateDatabaseIfNotExists<UniversityContext>
    {
        protected override void Seed(UniversityContext context)
        {
            try
            {
                Student student = new Student
                {
                    LastName = "Лук'яненко",
                    FirstName = "Левко",
                    BirthDate = new DateTime(2003, 5, 23),
                    Email = "houseGr@net.eu",
                    PhotoFile = "39ПР31/Лук'яненко_Левко.jpg"
                };
                context.Students.Add(student);

                StudentCard studentCard = new StudentCard
                {
                    Id = student.Id,
                    Number = 4592,
                    Series = "FH"
                };
                context.StudentCards.Add(studentCard);

                Group group = new Group
                {
                    GroupName = "39ПР31",
                    Students = new List<Student> { student }
                };
                //group.Students.Add(student);

                context.Groups.Add(group);
                context.Groups.Add(new Group { GroupName = "ПВ217" });

                Subject subject = new Subject { SubjName = "ASP.NET" };
                subject.Students.Add(student);
                subject.Teachers.Add(
                    new Teacher
                    {
                        LastName = "Simpson",
                        FirstName = "Homer",
                        BirthDate = new DateTime(1984, 10, 18)
                    });
                context.Subjects.Add(subject);
                context.Subjects.Add(new Subject { SubjName = "JavaScript" });

                // ------------------------------------------------------------

                context.Roles.AddRange(
                    new List<Role>
                    {
                        new Role { RoleName = "Admin" },
                        new Role { RoleName = "Guest" },
                        new Role { RoleName = "Student" },
                        new Role { RoleName = "Teacher" }
                    });
                context.SaveChanges();

                ApplicationUser user = new ApplicationUser
                {
                    Email = "qwe@eu.net",
                    Role = context.Roles.Single(r => r.RoleName == "Admin")
                };
                context.ApplicationUsers.Add(user);
                //context.SaveChanges();

                context.Logins.Add(
                    new Login
                    {
                        Id = user.Id,
                        UserLogin = "qwerty",
                        Password = "12345678"
                    });

                // ------------------------------------------------------------

                context.SaveChanges();
            }
            catch
            {
                throw;
            }

            base.Seed(context);
        }
    }
}