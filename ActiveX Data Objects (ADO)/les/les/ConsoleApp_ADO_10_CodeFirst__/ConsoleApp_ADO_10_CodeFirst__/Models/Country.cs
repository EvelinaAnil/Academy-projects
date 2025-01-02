using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp_ADO_10_CodeFirst__.Models
{
     class Country
    {
        public int Id { get; set; }
        public string CountryName { get; set; }

        public ICollection<Author> Authors{ get; set; }

        public Country()
        {
            Authors = new List<Author>();
        }
    }
}
