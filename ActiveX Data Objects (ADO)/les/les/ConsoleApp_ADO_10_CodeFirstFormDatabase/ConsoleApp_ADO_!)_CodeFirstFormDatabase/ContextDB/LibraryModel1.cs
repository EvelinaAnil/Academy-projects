using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;
using ConsoleApp_ADO____CodeFirstFormDatabase.Models;
namespace ConsoleApp_ADO____CodeFirstFormDatabase.Models
{
    public partial class LibraryModel1 : DbContext
    {
        public LibraryModel1()
            : base("name=LibraryModel1")
        {
        }

        public virtual DbSet<Author> Authors { get; set; }
        public virtual DbSet<Book> Books { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Department> Departments { get; set; }
        public virtual DbSet<Faculty> Faculties { get; set; }
        public virtual DbSet<Group> Groups { get; set; }
        public virtual DbSet<Lib> Libs { get; set; }
        public virtual DbSet<Press> Presses { get; set; }
        public virtual DbSet<S_Cards> S_Cards { get; set; }
        public virtual DbSet<Student> Students { get; set; }
        public virtual DbSet<T_Cards> T_Cards { get; set; }
        public virtual DbSet<Teacher> Teachers { get; set; }
        public virtual DbSet<Theme> Themes { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Author>()
                .Property(e => e.FirstName)
                .IsUnicode(false);

            modelBuilder.Entity<Author>()
                .Property(e => e.LastName)
                .IsUnicode(false);

            modelBuilder.Entity<Author>()
                .HasMany(e => e.Books)
                .WithRequired(e => e.Author)
                .HasForeignKey(e => e.Id_Author);

            modelBuilder.Entity<Book>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<Book>()
                .Property(e => e.Comment)
                .IsUnicode(false);

            modelBuilder.Entity<Book>()
                .HasMany(e => e.S_Cards)
                .WithRequired(e => e.Book)
                .HasForeignKey(e => e.Id_Book);

            modelBuilder.Entity<Book>()
                .HasMany(e => e.T_Cards)
                .WithRequired(e => e.Book)
                .HasForeignKey(e => e.Id_Book);

            modelBuilder.Entity<Category>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<Category>()
                .HasMany(e => e.Books)
                .WithRequired(e => e.Category)
                .HasForeignKey(e => e.Id_Category);

            modelBuilder.Entity<Department>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<Department>()
                .HasMany(e => e.Teachers)
                .WithRequired(e => e.Department)
                .HasForeignKey(e => e.Id_Dep);

            modelBuilder.Entity<Faculty>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<Faculty>()
                .HasMany(e => e.Groups)
                .WithRequired(e => e.Faculty)
                .HasForeignKey(e => e.Id_Faculty);

            modelBuilder.Entity<Group>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<Group>()
                .HasMany(e => e.Students)
                .WithRequired(e => e.Group)
                .HasForeignKey(e => e.Id_Group);

            modelBuilder.Entity<Lib>()
                .Property(e => e.FirstName)
                .IsUnicode(false);

            modelBuilder.Entity<Lib>()
                .Property(e => e.LastName)
                .IsUnicode(false);

            modelBuilder.Entity<Lib>()
                .HasMany(e => e.S_Cards)
                .WithRequired(e => e.Lib)
                .HasForeignKey(e => e.Id_Lib);

            modelBuilder.Entity<Lib>()
                .HasMany(e => e.T_Cards)
                .WithRequired(e => e.Lib)
                .HasForeignKey(e => e.Id_Lib);

            modelBuilder.Entity<Press>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<Press>()
                .HasMany(e => e.Books)
                .WithRequired(e => e.Press)
                .HasForeignKey(e => e.Id_Press);

            modelBuilder.Entity<Student>()
                .Property(e => e.FirstName)
                .IsUnicode(false);

            modelBuilder.Entity<Student>()
                .Property(e => e.LastName)
                .IsUnicode(false);

            modelBuilder.Entity<Student>()
                .HasMany(e => e.S_Cards)
                .WithRequired(e => e.Student)
                .HasForeignKey(e => e.Id_Student);

            modelBuilder.Entity<Teacher>()
                .Property(e => e.FirstName)
                .IsUnicode(false);

            modelBuilder.Entity<Teacher>()
                .Property(e => e.LastName)
                .IsUnicode(false);

            modelBuilder.Entity<Teacher>()
                .HasMany(e => e.T_Cards)
                .WithRequired(e => e.Teacher)
                .HasForeignKey(e => e.Id_Teacher);

            modelBuilder.Entity<Theme>()
                .Property(e => e.Name)
                .IsUnicode(false);

            modelBuilder.Entity<Theme>()
                .HasMany(e => e.Books)
                .WithRequired(e => e.Theme)
                .HasForeignKey(e => e.Id_Themes);
        }
    }
}
