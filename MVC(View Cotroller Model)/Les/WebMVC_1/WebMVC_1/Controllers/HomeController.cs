﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebMVC_1.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Start()
        {
            return View();
        }
    }
}