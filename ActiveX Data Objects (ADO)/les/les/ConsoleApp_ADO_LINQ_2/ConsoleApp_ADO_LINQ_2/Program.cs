using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleCS
{
    enum Professions
    {
        Doctor, Programmer, Tester, Engineer, Teacher
    }
    class Student
    {
        public string Name { get; set; }
        public int Age { get; set; }
        public bool IsMarried { get; set; }
        public byte[] Marks { get; set; }
        public Professions Profession { get; set; }

        //public double GetAverage()
        //{
        //    return Marks.Average(m => m);
        //}

        public override string ToString()
        {
            return $"{Name} {Age} {Profession} {IsMarried} {Math.Round(Marks.Average(m => m), 2)}";
        }
    }

    class Program
    {
      
        static void Main(string[] args)
        {

            List<Student> students = new List<Student>
            {
                new Student{ Name = "Nastya", Age = 30, IsMarried = true, Profession = Professions.Teacher, Marks = new byte[]{10,8,7,11,3,8,11,12}},
                new Student{ Name = "Nastya", Age = 30, IsMarried = true, Profession = Professions.Teacher, Marks = new byte[]{10,8,7,11,3,8,11,12}},
                new Student{ Name = "Nastya", Age = 30, IsMarried = true, Profession = Professions.Teacher, Marks = new byte[]{10,8,7,11,3,8,11,12}},
                new Student {Name = "Ira", Age = 18, IsMarried = false, Profession = Professions.Doctor, Marks = new byte[]{6,8,7,2,3,8,6,3}},
                new Student { Name = "Dima", Age = 34, IsMarried = true, Profession = Professions.Programmer, Marks = new byte[]{10,12,12,11,12,12,11,12}},
                new Student { Name = "Timur", Age = 25, IsMarried = false, Profession = Professions.Tester, Marks = new byte[]{7,8,7,7,7,8,7,7}},
                new Student { Name = "Kolya", Age = 23, IsMarried = true, Profession = Professions.Doctor, Marks = new byte[]{5,5,5,3,3,5,5,5}},
                new Student { Name = "Oleg", Age = 31, IsMarried = true, Profession = Professions.Tester, Marks = new byte[]{9,9,12,10,12,11,9,9}}, //Oleg
                new Student { Name = "Sergey", Age = 29, IsMarried = true, Profession = Professions.Programmer, Marks = new byte[]{11,11,11,11,11,8,11,11}}
            };

            foreach (var item in students)
            {
                Console.WriteLine(item);
            }
            //выбрать всех по имени Dima
            Console.WriteLine();
            foreach (var item in students.Where(s => s.Name == "Dima"))
            {;
                Console.WriteLine(item);
            }
            //выбрать всех студентов в возрасти оt 24 до 30
            foreach (var item in students.Where(s => (s.Age>=24)&&(s.Age<30)))
            {
                ;
                Console.WriteLine(item);
            }
            Console.WriteLine();
            //выбрать всех, у кого оценки не ниже 9 баллов
            //по профессии тестировщик и отсортировать в обратном порядке по имени
            foreach (var item in students.
            Where(s => s.Profession == Professions.Tester
            && s.Marks.All(m => m>=9))
            .OrderByDescending(s=>s.Name))
            {
                
                Console.WriteLine(item);
            }
            Console.WriteLine();
            //--- все ли? /никто ли?
            Console.WriteLine( students.All
                (s=> s.Profession == Professions.Tester));//fals
            Console.WriteLine( students.Any
                (s=> s.Profession == Professions.Tester));//true
            //---

            //students.Where(s =>
            //(s.Marks) &&
            //(s.Profession = Professions.Tester)))

            Console.WriteLine();
            Console.WriteLine("-------------------------------------------");
            List<Student> students1 = new List<Student>
            {
                new Student{ Name = "Roma", Age = 30, IsMarried = true, Profession = Professions.Teacher, Marks = new byte[]{10,8,7,11,3,8,11,12}},
                new Student {Name = "Garic", Age = 18, IsMarried = false, Profession = Professions.Doctor, Marks = new byte[]{6,8,7,2,3,8,6,3}},
                new Student { Name = "Lyosha", Age = 34, IsMarried = true, Profession = Professions.Programmer, Marks = new byte[]{10,12,12,11,12,12,11,12}},
                new Student { Name = "Timur", Age = 25, IsMarried = false, Profession = Professions.Tester, Marks = new byte[]{7,8,7,7,7,8,7,7}},
                new Student { Name = "Tom", Age = 23, IsMarried = true, Profession = Professions.Doctor, Marks = new byte[]{5,5,5,3,3,5,5,5}},
                new Student { Name = "Oleg", Age = 31, IsMarried = true, Profession = Professions.Tester, Marks = new byte[]{9,9,9,7,9,8,9,9}},
                new Student { Name = "Sergey", Age = 29, IsMarried = true, Profession = Professions.Programmer, Marks = new byte[]{11,11,11,11,11,8,11,11}}
            };
            
            Console.WriteLine();
            /*обьединение 2-ух последовательностей*/
            var concat = students.Concat(students1);
              foreach (var item in concat)
            {
                Console.WriteLine(item);
            }
            Console.WriteLine("---");
            /*возвращает либо общее количество
             элементов последовательности */
            Console.WriteLine($"All: { concat.Count()}");

            /*либо число элементов,
            удовлетворяющих заданному условию
            */
            Console.WriteLine($"All: {concat.Count(s=> s.Name =="Oleg")}");
            Console.WriteLine("---------");
            //убирает все последуюшие повторения
            IEqualityComparer<Student> comparer = new StudentComparer();
            foreach (var item in concat.Distinct(comparer))
            {
                Console.WriteLine(item);
            }
            Console.WriteLine("-------------");

           Student student = new Student { Name = "Sergey", Age = 29, IsMarried = true, Profession = Professions.Programmer, Marks = new byte[] { 11, 11, 11, 11, 11, 8, 11, 11 } };
            Console.WriteLine(concat.Contains(student, new StudentComparer()));
            Console.WriteLine("-------------------");

            try
            {
 Console.WriteLine(concat.ElementAt(4));//if exist ok else  no show
            }
            catch 
            {

                
            }
            Console.WriteLine("----------------------");
            /*Возвращает элемент по указанному индексу
           в последовательности или значение по умолчанию,
            если индекс вне допустимого диапазона*/
            Console.WriteLine(concat.ElementAtOrDefault(21));
            //null ->no show
            Console.WriteLine(concat.ElementAtOrDefault(10));
          Student stud=  concat.ElementAtOrDefault(7);
            if (stud!=null)
            {
                Console.WriteLine(stud);
            }
            Console.WriteLine(concat.ElementAtOrDefault(3)?.ToString());
            Console.WriteLine("---------------------------------");
            /*Возвращает первый элемент последовательности, 
              удовлетворяющий указанному условию*/
             try { Console.WriteLine(concat.First(
                 s=> s.Age==35)); } 
            catch { }

            /*Возвращает первый элемент последовательности
             или значение по умолчанию, если последовательность
             не содержит элементов*/
            Console.WriteLine("--------------------------");
            Student stude = concat.FirstOrDefault(s => s.Age == 31);
            if (stude != null)
            {
                Console.WriteLine(stude);
            }
            Console.WriteLine(concat.FirstOrDefault(s => s.Age == 18));

            /*единственный элемент*/
            Console.WriteLine("-----------------");
            try
            {
concat.SingleOrDefault(/*s=> s.Age==18*/).Age = 18; 

            }
            catch 
            {

               
            }
            
            Console.ReadKey();
        }
    }

    internal class StudentComparer : IEqualityComparer<Student>
    {
        public StudentComparer()
        {

        }

        bool IEqualityComparer<Student>.Equals(Student x, Student y)
        {
          return x.ToString().Equals(y.ToString());
        }

        int IEqualityComparer<Student>.GetHashCode(Student obj)
        {
           return obj.ToString().GetHashCode(); 
        }
    }
}