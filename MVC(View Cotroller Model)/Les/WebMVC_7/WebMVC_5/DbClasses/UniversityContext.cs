using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using WebMVC_5.Models;

namespace WebMVC_5.DbClasses
{
    public class UniversityContext:DbContext
    {
        public UniversityContext():base("University39")
        {
        }

        public virtual DbSet<Group> Groups { get; set; }
        public virtual DbSet<Student> Students { get; set; }
        public virtual DbSet<StudentCard> StudentCards { get; set; }
        public virtual DbSet<Subject> Subjects { get; set; }
        public virtual DbSet<Teacher> Teachers { get; set; }
    }
}