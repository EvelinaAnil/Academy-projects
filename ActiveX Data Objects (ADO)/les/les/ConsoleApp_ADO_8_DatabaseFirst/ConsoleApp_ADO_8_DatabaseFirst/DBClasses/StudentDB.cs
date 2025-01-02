using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp_ADO_8_DatabaseFirst.DBClasses
{
     class StudentDB
    {
        private DatabaseFirstContext _context;

        public StudentDB()
        {
            _context = new DatabaseFirstContext();

        }
        public void SubjectInsert(string name)
        {
            try
            {
                if(_context.Subjects.Any(s=>s.SubjectName== name))
                {
                    Console.WriteLine("Subkect exist!");
                }
            }
            catch
            {
                _context.Subjects.Add(new Subject{SubjectName = name});
                _context.SaveChanges();
            }
        }

        public void StudentInsert(string lname, string fname, 
            string number,List<Subject> subjects) 
        {
            try
            {
                if (_context.Students.Any(s=>s.CardNumber==number))
                {
                    Console.WriteLine("Student exist!");
                }
            }
            catch
            {
                Student student = new Student
                {
                    LastName = lname,
                    FirstName = fname,
                    CardNumber = number,

                };
                //student.Subjects = subjects;


                foreach (Subject sub in subjects)
                {
                    if (_context.Subjects.Any(s=>s.SubjectName==sub.SubjectName))
                    {
                    student.Subjects.Add(_context.Subjects.First
                        (s => s.SubjectName == sub.SubjectName));
                    }
                    else
                    {
                        student.Subjects.Add(sub);
                    }
                }

                _context.Students.Add(student);
                _context.SaveChanges();
            }
        }
        public void StudentDelete(string number)
        {
            Student student =_context.Students.FirstOrDefault(s=>s.CardNumber== number);

            if (student!=null)
            {
                _context.Students.Remove(student);
                _context.SaveChanges();
            }
            else
            {
                Console.WriteLine("Student NOT exist!");
            }
        }
        public void StudentUpdate(string number,List<Subject> subjects)
        {
            Student student = _context.Students.FirstOrDefault(s => s.CardNumber == number);

            if (student != null)
            {
                student.Subjects.Clear();
                foreach (Subject sub in subjects)
                {
                    if (_context.Subjects.Any(s => s.SubjectName == sub.SubjectName))
                    {
                        student.Subjects.Add(_context.Subjects.First
                            (s => s.SubjectName == sub.SubjectName));
                    }
                    else
                    {
                        student.Subjects.Add(sub);
                    }
                    _context.Entry(student).State = System.Data.Entity.EntityState.Modified;
                    _context.SaveChanges() ;
                }
            }
            else
            {
                Console.WriteLine("Student NOT exist!");
            }
        }
        public void Show()
        {
            foreach (Student item in _context.Students)
            {
                Console.WriteLine(item);
                foreach (Subject item1 in _context.Subjects)
                {
                    Console.WriteLine($"\t{item1.SubjectName}");
                }
                Console.WriteLine("\n--------------------------\n");
            }
        }
    }
}
