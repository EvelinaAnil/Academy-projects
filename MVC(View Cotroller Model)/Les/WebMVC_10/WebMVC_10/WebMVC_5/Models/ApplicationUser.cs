using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebMVC_5.Models
{
    public class ApplicationUser
    {
        public int Id { get; set; }

        [Display(Name = "Пошта")]
        [Required(ErrorMessage = "Поле має бути заповнено")]
        [StringLength(100)]
        [RegularExpression(@"(?<name>[\w.]+)\@(?<domain>\w+\.\w+)(\.\w+)?", ErrorMessage = "Некоректна адреса")]
        [Index(IsUnique = true)]
        public string Email { get; set; }

        public virtual Role Role { get; set; }

        public virtual Login Login { get; set; }
    }
}