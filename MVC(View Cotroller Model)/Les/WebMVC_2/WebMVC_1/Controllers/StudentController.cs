using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMVC_1.Models;

namespace WebMVC_1.Controllers
{
    public class StudentController : Controller
    {
        private IEnumerable<Student> _students;

        public StudentController()
        {
            _students = new List<Student>
            {
                new Student{ Id = 5, LastName = "Johnson", FirstName = "Boris", BirthDate = new DateTime(2004, 3, 23) },
                new Student{ Id = 7, LastName = "Duda", FirstName = "Anjey", BirthDate = new DateTime(2005, 9, 17) }
            };
        }

        public ActionResult List()
        {
            return View(_students);
        }

        public ActionResult Create()
        {
            return View();
        }
        [HttpPost] // !!!
        public ActionResult xxx()
        {
            return View();
        }
    }
}