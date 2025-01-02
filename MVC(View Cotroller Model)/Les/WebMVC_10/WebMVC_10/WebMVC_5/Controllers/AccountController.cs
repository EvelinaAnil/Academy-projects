using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using WebMVC_5.DbClasses;
using WebMVC_5.Models.ViewModels;

namespace WebMVC_5.Controllers
{
    public class AccountController : Controller
    {
        private UniversityContext _context;

        public AccountController()
        {
            _context = new UniversityContext();
        }

        // GET: Account
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(UserRegister user)
        {
            // ...
            return View();
        }

        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Register(UserRegister user)
        {
            // ...
            return View();
        }

        // POST: /Account/LogOff
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Home", "University");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                _context.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}