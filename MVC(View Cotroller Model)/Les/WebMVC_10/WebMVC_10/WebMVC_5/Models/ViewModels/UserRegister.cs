using System.ComponentModel.DataAnnotations;

namespace WebMVC_5.Models.ViewModels
{
    public class UserRegister
    {
        [Display(Name = "Електронна адреса")]
        [Required(ErrorMessage = "Поле має бути заповнено")]
        [StringLength(100)]
        [RegularExpression(@"(?<name>[\w.]+)\@(?<domain>\w+\.\w+)(\.\w+)?", ErrorMessage = "Некоректна адреса")]
        //[Remote]
        public string Email { get; set; }

        [Display(Name = "Лоґін")]
        [Required(ErrorMessage = "Поле має бути заповнено")]
        [StringLength(15, MinimumLength = 5, ErrorMessage = "від 5 до 15")]
        public string UserLogin { get; set; }

        [Display(Name = "Пароль")]
        [Required(ErrorMessage = "Поле має бути заповнено")]
        [StringLength(25, MinimumLength = 8, ErrorMessage = "від 8 до 25")]
        public string Password { get; set; }

        [Display(Name = "Підтвердження")]
        [Required(ErrorMessage = "Поле має бути заповнено")]
        [Compare("Password", ErrorMessage = "Значення не співпадають")]
        public string ConfirmPassword { get; set; }

        [Display(Name = "Роль")]
        public string RoleName { get; set; }
    }
}