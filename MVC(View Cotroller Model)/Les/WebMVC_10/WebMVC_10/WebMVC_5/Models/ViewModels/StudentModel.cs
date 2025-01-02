using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace WebMVC_5.Models.ViewModels
{
    public class StudentModel
    {
        public int Id { get; set; }

        [Display(Name = "Прізвище")]
        [Required(ErrorMessage = "Поле має бути заповнено")]
        [StringLength(30, MinimumLength = 2, ErrorMessage = "від 2 до 30")]
        [RegularExpression("[А-ЯІЇҐЄ][^ЭЫЪЁ]{1}[а-яіїґє'][^ыэъё]{1,29}", ErrorMessage = "Некоректно")]
        public string LastName { get; set; }

        [Display(Name = "Ім'я")]
        [Required(ErrorMessage = "Поле має бути заповнено")]
        [StringLength(20, MinimumLength = 2, ErrorMessage = "від 2 до 20")]
        [RegularExpression("[А-ЯІЇҐЄ][^ЭЫЪЁ]{1}[а-яіїґє'][^ыэъё]{1,29}", ErrorMessage = "Некоректно")]
        public string FirstName { get; set; }

        [Display(Name = "Дата народження")]
        [Required(ErrorMessage = "Поле має бути заповнено")]
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd-MM-yyyy}", ApplyFormatInEditMode = true)]
        public DateTime BirthDate { get; set; }

        [Display(Name = "Пошта")]
        [Required(ErrorMessage = "Поле має бути заповнено")]
        [StringLength(100)]
        [RegularExpression(@"(?<name>[\w.]+)\@(?<domain>\w+\.\w+)(\.\w+)?", ErrorMessage = "Некоректна адреса")]
        [Index(IsUnique = true)]
        public string Email { get; set; }

        [Display(Name = "Стипендія")]
        [Range(1000, 5000, ErrorMessage = "від 1000 до 5000")]
        public double? Grant { get; set; }

        [Display(Name = "Фото")]
        public string PhotoFile { get; set; }

        public List<Subject> Subjects { get; set; } = new List<Subject>();

        // ----------------------------------------------------------------

        [Display(Name = "Номер")]
        [Range(1000, 9999, ErrorMessage = "від 1000 до 9999")]
        public int Number { get; set; }

        [Display(Name = "Підтвердження")]
        [Compare("Number", ErrorMessage = "Значення не збігаються")]
        public int NumberConfirm { get; set; }

        [Display(Name = "Серія")]
        [System.Web.Mvc.Remote("RemoteSeries", "Student", ErrorMessage = "Неприпустимо")]
        public string Series { get; set; }

        // ----------------------------------------------------------------

        [Display(Name = "Група")]
        [Required(ErrorMessage = "Поле має бути заповнено")]
        [StringLength(20)]
        //[RegularExpression("^[А-Я0-9][^ЭЫЪЁ]{1,19}$", ErrorMessage = "Некоректно")]
        [RegularExpression("[А-Я0-9]{1,19}", ErrorMessage = "Некоректно")]
        [Index(IsUnique = true)]
        public string GroupName { get; set; }
    }
}