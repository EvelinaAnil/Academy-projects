using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp_ADO_10_CodeFirst__.Models
{
     class Book
    {
        public int Id { get; set; }
        public string Titel { get; set; }
        public ICollection<Author> Authors  { get; set; }
        public ICollection<Publisher> Publishers { get; set; }
        public  Book()
        {
            Authors = new List<Author>();
            Publishers = new List<Publisher>();
        }
    }
}
