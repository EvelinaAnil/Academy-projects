using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Runtime.Versioning;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;


using System.Globalization;
using System.Runtime.CompilerServices;
using System.Runtime.Serialization;
using System.Security;
namespace ConsoleApp_ADO_Person
{
     class Program
    {
        class PersonNationality
        {
            public int id { get; set; }
            public string Nationality { get; set; }
        };
        class Person1
        {
            public string FName { get; set; }
            public string LName { get; set; }
            public int Age { get; set; }
            public string Birthday { get; set; }

            public int IdNationality { get; set; }
            public string NameNationality { get; set; }
            public override string ToString()
            {
                return $"{FName} {LName} {Age} {Birthday} {IdNationality} {NameNationality}";
            }
        }
        class Person2
        {
            public string FName { get; set; }
            public string LName { get; set; }
            public int Age { get; set; }
            public DateTime Birthday { get; set; }

            public int IdNationality { get; set; }
            public string NameNationality { get; set; }
            public override string ToString()
            {
                return $"{FName} {LName} {Age} {Birthday} {IdNationality} {NameNationality}";
            }
        }
        class Person
        {
            public string FName { get; set; }
            public string LName { get; set; }
            public int Age { get; set; }
            public string Birthday { get; set; }


            public override string ToString()
            {
                return $"{FName} {LName} {Age} {Birthday} ";
            }
        }
        static void Main(string[] args)
        {
            List<Person> person = new List<Person>
            {
                new Person{ FName = "Roma",LName = "Kolachnik", Age = 20 ,Birthday="01/09/2002"},
                new Person{ FName = "Linda",LName = "Penelop", Age = 18,Birthday="02/02/2005"},
                new Person{ FName = "Max",LName = "Bilensk", Age = 23,Birthday="02/12/1999"},
                new Person{ FName = "Olexandr",LName = "Malovichenko", Age = 23,Birthday="11/03/1999"},
                new Person{ FName = "Mary",LName = "Smith", Age = 27,Birthday="07/09/1995"},
                new Person{ FName = "Jim",LName = "Parker", Age = 36,Birthday="09/11/1986"},
                new Person{ FName = "Wendi",LName = "Blake", Age = 33,Birthday="05/10/1989"}
            };

            //a
            foreach (var item in person.Where(s => (s.Age > 20))) //-Roma Kolachnik -Linda Penelop
            {
                Console.WriteLine(item);
            }
            Console.WriteLine("--------------");
            //b
            foreach (var item in person.Where(s => (s.Age > 18))) //-Linda Penelop
            {
                Console.WriteLine("Dear "+item.FName+" "+item.LName);
            }
            Console.WriteLine("----Уважаемый----");
            foreach (var item in person.Where(s => (s.Age > 18))) //-Linda Penelop
            {
                Console.WriteLine("Уважаемый " + item.FName + " " + item.LName);
            }
            Console.WriteLine("----Дорогой----");
            foreach (var item in person.Where(s => (s.Age > 18))) //-Linda Penelop
            {
                Console.WriteLine("Дорогой " + item.FName + " " + item.LName);
            }
            Console.WriteLine();
            Console.WriteLine();
            string p = "Dear ";
            string p1 = "Уважаемый ";
            string p2 = "Дорогой ";
            var qur = from pg in person
                      select  p+ pg;
            foreach (var item in qur)
            {
                Console.WriteLine(item);
            }
            Console.WriteLine();
            var qur1 = from pg in person
                      select  p1+pg;
            foreach (var item in qur1)
            {
                Console.WriteLine(item);
            }
            Console.WriteLine();
            var qur2 = from pg in person
                       select p2 + pg;
            foreach (var item in qur2)
            {
                Console.WriteLine(item);
            }
            Console.WriteLine("-------------------");
            //с
            List<PersonNationality> nat = new List<PersonNationality>
            {
                new PersonNationality{ id = 1, Nationality = "39PR31"},
                new PersonNationality{id = 2, Nationality = "37PR32"}
            };
            List<Person1> person1 = new List<Person1>
            {
                new Person1{ FName = "Roma",LName = "Kolachnik", Age = 20 ,Birthday="01/09/2002", IdNationality=1},
                new Person1{ FName = "Linda",LName = "Penelop", Age = 18,Birthday="02/02/2005", IdNationality=2},
                new Person1{ FName = "Max",LName = "Bilensk", Age = 23,Birthday="02/12/1999", IdNationality=2},
                new Person1{ FName = "Olexandr",LName = "Malovichenko", Age = 23,Birthday="11/03/1999", IdNationality=1},
                new Person1{ FName = "Mary",LName = "Smith", Age = 27,Birthday="07/09/1995", IdNationality=2},
                new Person1{ FName = "Jim",LName = "Parker", Age = 36,Birthday="09/11/1986", IdNationality=1},
                new Person1{ FName = "Wendi",LName = "Blake", Age = 33,Birthday="", IdNationality=2}
            };
            var personn = from n in nat
                          join st in person1 on n.id equals st.IdNationality
                          orderby n.id descending
                          select new { st.FName, st.LName,st.Age,st.Birthday, IdNationality = n.id , NameNationality=n.Nationality };
            foreach (var item in personn)
            {
                Console.WriteLine(item);
            }
            Console.WriteLine("-------------------");
            //d
            string op = " Happy Birthday!";
            var persoon = from n in nat
                          join st in person1 on n.id equals st.IdNationality
                          where (st.Birthday.Length != 0)||(st.Birthday.Length >= 10)
                          select st.FName + " " + st.LName+" "+op;
            foreach (var item in persoon)
            {
                Console.WriteLine(item);
            }
            Console.WriteLine("-------------------");
            //e
            /*
             Получить список людей группированных по четным и не четным месяцам рождения.
             Вывести сначала всех людей первой категории 
             (четные) затем второй (не четные).

             */
            Console.WriteLine("--==--=-=-=-=-=-=");
            DateTime dateTime = new DateTime();
           
            List<Person2> person2 = new List<Person2>
            {
                new Person2{ FName = "Roma",LName = "Kolachnik", Age = 20 ,Birthday= new DateTime(2002,09,01), IdNationality=1},
                new Person2{ FName = "Linda",LName = "Penelop", Age = 18,Birthday=new DateTime(2005,02,02), IdNationality=2},
                new Person2{ FName = "Max",LName = "Bilensk", Age = 23,Birthday=new DateTime(1999,12,02), IdNationality=2},
                new Person2{ FName = "Olexandr",LName = "Malovichenko", Age = 23,Birthday=new DateTime(1999,03,11), IdNationality=1},
                new Person2{ FName = "Mary",LName = "Smith", Age = 27,Birthday=new DateTime(1995,09,07), IdNationality=2},
                new Person2{ FName = "Jim",LName = "Parker", Age = 36,Birthday=new DateTime(2005,11,09), IdNationality=1},
                new Person2{ FName = "Wendi",LName = "Blake", Age = 33,Birthday=new DateTime(0), IdNationality=2}
            };
            var persn = from n in nat
                          join st in person2 on n.id equals st.IdNationality
                        where st.Birthday.Month % 2 == 0 
                          select new { st.FName, st.LName, st.Age, st.Birthday.Year, st.Birthday.Month, st.Birthday.Day, IdNationality = n.id, NameNationality = n.Nationality };
            foreach (var item in persn)
            {
                Console.WriteLine(item);
            }
            Console.WriteLine("==============");
            //f
            var persnn = from n in nat
                        join st in person2 on n.id equals st.IdNationality
                        where st.Birthday.Month % 2 != 0
                        select new { st.FName, st.LName, st.Age,st.Birthday.Year , st.Birthday.Month , st.Birthday.Day, IdNationality = n.id, NameNationality = n.Nationality };
            foreach (var item in persnn)
            {
                Console.WriteLine(item);
            }
            Console.WriteLine("--==--=-=-=-=-=-=");
            //g
            var persoonn = from n in nat
                          join st in person1 on n.id equals st.IdNationality
                           orderby st.FName+" "+ st.LName ascending
                          select new { st.FName, st.LName, st.Age, st.Birthday, IdNationality = n.id, NameNationality = n.Nationality };
            foreach (var item in persoonn)
            {
                Console.WriteLine(item);
            }

            Console.ReadKey();
        }
    }
}
