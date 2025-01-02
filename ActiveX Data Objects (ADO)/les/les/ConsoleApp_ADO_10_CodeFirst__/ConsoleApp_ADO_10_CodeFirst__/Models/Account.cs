using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace ConsoleApp_ADO_10_CodeFirst__.Models
{
     class Account
    {
        [Key]
        [ForeignKey("Author")]
        public int Id { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
        public virtual Author Author { get; set; }
    }
}
