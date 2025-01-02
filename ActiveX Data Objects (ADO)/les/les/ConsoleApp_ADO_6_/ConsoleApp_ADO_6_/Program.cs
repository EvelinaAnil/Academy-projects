using System;
using System.CodeDom.Compiler;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp_ADO_6_
{


    class Student
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int GroupId { get; set; }
    }

    class Group
    {
        public int Id { get; set; }
        public string Name { get; set; }
    }


    static class ExtentionsClass
    {
        public static int WordsNumber(this string data)
        {
            if (string.IsNullOrEmpty(data))
            {
                return 0;
            }
           return
        data.Split (new char[] { ' ', ',', ':', '.' }, StringSplitOptions.RemoveEmptyEntries).Length;
            

                
        }
        public static string StrConcat(this  string data, string str) { return data + str; }
    }


    //------------------------------------
    delegate int IntDelegete(int n);
     class Program
    {
        public static int Increment(int num)
        {
            return ++num;
        }
        
        static void Main(string[] args)
        {

            //IntDelegete intDelegete = new IntDelegete(Increment);
            //IntDelegete intDelegete = Increment;
            int n = 67;
            //Console.WriteLine(intDelegete(n));

            /*  IntDelegete intDelegete = delegate (int m)
             //intDelegete += delegate (int m)
             {
                 return m + 1; 
             };
             Console.WriteLine(intDelegete(n));*/


            // delegate (int m)    {  return m + 1; };
            //          (int m) => {         m + 1; };


            //IntDelegete intDelegete =  (int m) =>  { return m + 1; };
            //IntDelegete intDelegete =  m /* m,n,f */=>  { return m += 1; };
            //IntDelegete intDelegete =  m =>   m += 1; ;

            /*
            int num = 89;
            IntDelegete intDelegete = m => m += num; ;

            Console.WriteLine(intDelegete(n));

            string text = "Eeffee eeffeee eefeeeef feefefefef";
            //int n = text.WordsNumber();

                Console.WriteLine($"Number words of string: {text.WordsNumber()}");
            string str = "HELOO";
            text.StrConcat(str);
            Console.WriteLine(text.StrConcat(str));
            */


            //--------------------LanguageOptions Integrated Query (LINQ)------------------

            //не существует отдельно // принципы в SQL взяты ,НО не SQL-подобное // запрос => ответ

            int[] array = { 5, 34, 67, 12, 94 , 42 ,35 ,72};

            //IEnumerable<int> query = from i in array
            //                         select i;
            //foreach (int item in query)
            //{
            //    Console.WriteLine(item);
            //}
            //Console.WriteLine();

            //array[0] = 23;
            //foreach (int item in query)
            //{
            //    Console.WriteLine(item);
            //}

            //-----------------------------------------------------------------------------------------

            //IEnumerable<int> query = from i in array
            //                         where i%2 ==0
            //                         orderby i  ascending //порядок по возрастанию (1 2 3 4 5)
            //                         //ascending возраст -- descending убыван
            //                         select i;
            //foreach (int item in query)
            //{
            //    Console.WriteLine(item);
            //}

            //-----------------------------------------------------------------------------------------

            /*
             //IEnumerable<IGrouping<int, int>> query = from i in array
             //                                         group i by i % 10;

             IEnumerable<IGrouping<int, int>> query = from i in array
                                                      group i by i % 10 into res
                                                      where res.Count() > 2
                                                      select res; //save information
             //(group)=> группировка по последему числу i 
             foreach (IGrouping<int,int>  item in query)
             {
                 Console.WriteLine(item.Key);
                 foreach (int val in item)
                 {
                     Console.WriteLine($"\t{val}");
                 }

             }
            */

            //-----------------------------------------------------------------------------------------

            /*
            string[] poem =
            {
                "В Swift при изучении UI (User Interface) ",
                "каждый рано или поздно приходит к необходимости ",
                "использования делегата. ",
                "Все гайды о них пишут, и вроде бы делаешь, как там написано,",
                "и вроде бы работает...."
            };
            IEnumerable<string> qw = from p in poem
                                     let words = p.Split(' ')
                                     from w in words //w - letter elke woorden
                                     where w.Count() > 5
                                     select w;
            foreach (string item in qw)
            {
                Console.WriteLine(item);
            }
            */

            //-----------------------------------------------------------------------------------------
            /*
            var number = 45;

            IEnumerable<int> query = from i in array
                                     where i % 2 == 0
                                     orderby i descending //порядок по возрастанию (1 2 3 4 5)
                                     //ascending возраст -- descending убыван

                                     select i;

            var garem = new { Nice = "Fiola", SelectGarem = 15 };
            Console.WriteLine(garem);

            Console.WriteLine(garem.Nice);
            Console.WriteLine(garem.SelectGarem);
            */
            //-----------------------------------------------------------------------------------------


            List<Group> groups = new List<Group>
            {
                new Group{Id = 1, Name = "39PR31"},
                new Group{Id = 2, Name = "37PR32"}
            };

            List<Student> students = new List<Student> {
                new Student { FirstName = "John", LastName = "Miller", GroupId = 2 },
                new Student { FirstName = "Candice", LastName = "Leman", GroupId = 1 },
                new Student { FirstName = "Joey", LastName = "Finch", GroupId = 3 },
                new Student { FirstName = "Nicole", LastName = "Taylor", GroupId = 1 }
            };

            var qur = from g in groups
                      join st in students on g.Id equals st.GroupId 
                      select new {st.LastName, st.FirstName, GroupName = g.Name};
            foreach (var item in qur)
            {
                Console.WriteLine(item);
            }

          //Student  student =students.First(s => s.LastName.Contains("il"));
          //Student  student1 =students.First(s => s.LastName.Contains("ol"));//Exe

          Student  student2 =students.FirstOrDefault(s => s.LastName.Contains("il"));
            //if (student2 != null)
            //{

            //}
            Console.WriteLine(student2?.LastName);

            Console.WriteLine();
            Console.WriteLine();

            var wer = from s  in students
                      where s.LastName.Length ==5
                      select s;
            var er = students.Where(s => s.LastName.Length == 5);
            foreach (var item in wer)
            {
                Console.WriteLine(item.LastName);
            }

            var qrt = 
                students.Where(s => s.LastName.Length ==5 )
                .Select(s => s.LastName).
                OrderByDescending(s => s);
            foreach (var item in qrt)
            {
                Console.WriteLine(item);
            }

            var qrtt =
               students.Where(s => s.LastName.Length == 5).
               OrderByDescending(s => s.LastName);
            foreach (var item in qrtt)
            {
                Console.WriteLine(item.LastName);
            }

            var qtt =
               students.Where(s => s.LastName.Length == 5).
               Max(s => s.LastName);
            foreach (var item in qtt)
            {
                Console.WriteLine(item);
            }

            Console.ReadKey();
        }
    }
}
