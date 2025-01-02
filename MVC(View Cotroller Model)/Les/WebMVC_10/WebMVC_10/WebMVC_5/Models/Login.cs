using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebMVC_5.Models
{
    public class Login
    {
        [Key]
        [ForeignKey("ApplicationUser")]
        public int Id { get; set; }

        [Display(Name = "Лоґін")]
        [Required(ErrorMessage = "Поле має бути заповнено")]
        [StringLength(15, MinimumLength = 5, ErrorMessage = "від 5 до 15")]
        public string UserLogin { get; set; }

        [Display(Name = "Пароль")]
        [Required(ErrorMessage = "Поле має бути заповнено")]
        [StringLength(25, MinimumLength = 8, ErrorMessage = "від 8 до 25")]
        public string Password { get; set; }

        public virtual ApplicationUser ApplicationUser { get; set; }
    }
}