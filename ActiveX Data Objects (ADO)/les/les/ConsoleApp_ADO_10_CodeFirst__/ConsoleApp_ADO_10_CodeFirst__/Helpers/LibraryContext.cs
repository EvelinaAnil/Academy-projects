using ConsoleApp_ADO_10_CodeFirst__.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp_ADO_10_CodeFirst__.Helpers
{
     class LibraryContext :DbContext
    {
        public LibraryContext () : base ("LibraryCodeFirst")
        {

        }
        
        public DbSet<Account> Accounts { get; set; }
        public DbSet<Author> Authors { get; set; }
        public DbSet<Book> Books { get; set; }
        public DbSet<Country> Countries { get; set; }
        public DbSet<Publisher> Publishers { get; set; }

    }
}
