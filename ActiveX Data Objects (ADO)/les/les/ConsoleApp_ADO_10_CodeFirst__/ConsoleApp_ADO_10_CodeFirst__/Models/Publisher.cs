using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp_ADO_10_CodeFirst__.Models
{
     class Publisher
    {
        public int Id { get; set; }
        public string PublisherName { get; set; }


        public ICollection<Book> Books { get; set; }

        public Publisher() 
        {
            Books= new List<Book>();
        }
    }

}
