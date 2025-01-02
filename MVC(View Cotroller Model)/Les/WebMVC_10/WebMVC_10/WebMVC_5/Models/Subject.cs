using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebMVC_5.Models
{
    public class Subject
    {
        public int Id { get; set; }
        public string SubjName { get; set; }

        public virtual ICollection<Student> Students { get; set; }

        public virtual ICollection<Teacher> Teachers { get; set; }

        public Subject()
        {
            Students = new List<Student>();
            Teachers = new List<Teacher>();
        }
    }
}