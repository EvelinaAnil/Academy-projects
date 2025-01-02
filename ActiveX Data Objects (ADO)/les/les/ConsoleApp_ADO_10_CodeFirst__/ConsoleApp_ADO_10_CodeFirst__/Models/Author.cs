using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp_ADO_10_CodeFirst__.Models
{
     class Author
    {
        public int Id { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }

        public virtual Account Account { get; set; }

        public int CountryId { get; set; } //foregin key
      //  public int CountrId { get; set; } // not foregin key
        public virtual Country Country { get; set; } // navigation property

        public ICollection<Book> Books { get; set; }

        public Author() 
        {
            Books = new List<Book>();

        }

        public override string ToString()
        {
            return $"{LastName} {FirstName}";
        }
    }
}
