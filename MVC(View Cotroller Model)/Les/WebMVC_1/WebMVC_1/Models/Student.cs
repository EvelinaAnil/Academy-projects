using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebMVC_1.Models
{
    public class Student
    {
        public int Id { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public DateTime BirthDate { get; set; }

        public override string ToString()
        {
            return $"{Id} {LastName} {FirstName} {BirthDate.ToLongDateString()}";
        }
    }
}