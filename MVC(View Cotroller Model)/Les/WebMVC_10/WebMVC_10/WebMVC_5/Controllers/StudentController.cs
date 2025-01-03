﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WebMVC_5.DbClasses;
using WebMVC_5.Models;
using WebMVC_5.Models.ViewModels;
using System.IO;

namespace WebMVC_5.Controllers
{
    public class StudentController : Controller
    {
        private UniversityContext _context = new UniversityContext();

        // GET: Student
        public async Task<ActionResult> Index()
        {
            var students = _context.Students.Include(s => s.StudentCard);
            return View(await students.ToListAsync());
        }

        // GET: Student/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Student student = await _context.Students.FindAsync(id);
            if (student == null)
            {
                return HttpNotFound();
            }
            return View(student);
        }

        // GET: Student/Create
        public ActionResult Create()
        {
            ViewBag.Groups = new SelectList(_context.Groups, "Id", "GroupName");

            ViewBag.Subjects = _context.Subjects;

            return View();
        }

        // POST: Student/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Id,LastName,FirstName,BirthDate,Email,Grant,PhotoFile,GroupId")] Student student, int[] subjects)
        {
            if (subjects != null)
            {
                foreach (Subject item in _context.Subjects.Where(s => subjects.Contains(s.Id)))
                {
                    student.Subjects.Add(item);
                }
            }

            //if (true)
            //{
            //    ModelState.AddModelError("Email", "Неприпустима електронна адреса");
            //    //ModelState.AddModelError("", "Неприпустима електронна адреса");
            //}

            if (ModelState.IsValid)
            {
                _context.Students.Add(student);
                await _context.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.Groups = new SelectList(_context.Groups, "Id", "GroupName");
            ViewBag.Subjects = _context.Subjects;

            return View(student);
        }

        public ActionResult CreateStudentModel()
        {
            ViewBag.ErrorMessage = null;

            ViewBag.Groups = new SelectList(_context.Groups, "GroupName", "GroupName");
            ViewBag.Subjects = _context.Subjects;

            return View();
        }

        [HttpPost]
        public async Task<ActionResult> CreateStudentModel([Bind(Include = "Id,LastName,FirstName,BirthDate,Email,Grant,PhotoFile,Number,NumberConfirm,Series,GroupName")]StudentModel model, int[] subjects)
        {
            if (subjects != null)
            {
                foreach (Subject item in _context.Subjects.Where(s => subjects.Contains(s.Id)))
                {
                    model.Subjects.Add(item);
                }
            }

            if (_context.StudentCards.Any(s => s.Number == model.Number && s.Series == model.Series))
            {
                ModelState.AddModelError("", "Збіг номера та серії"); // ValidationSummary
            }

            if (_context.Students.Any(s => s.Email == model.Email))
            {
                ModelState.AddModelError("Email", "Збіг електронної адреси");
            }

            //if (model.BirthDate >= DateTime.Today)
            if ((DateTime.Today - model.BirthDate).TotalDays / 365.25 < 16)
            {
                ModelState.AddModelError("BirthDate", "Несумісний вік");
            }

            //if (ModelState.IsValidField("LastName"){ }

            if (ModelState.IsValid)
            {
                try
                {
                    Group group = _context.Groups.SingleOrDefault(g => g.GroupName == model.GroupName);
                    if (group == null)
                    {
                        return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
                    }

                    if (model.Grant == 1111)
                    {
                        throw new Exception("Grant = 1111");
                    }

                    StudentCard studentCard = new StudentCard
                    {
                        Number = model.Number,
                        Series = model.Series
                    };

                    Student student = new Student
                    {
                        LastName = model.LastName,
                        FirstName = model.FirstName,
                        BirthDate = model.BirthDate,
                        Email = model.Email,
                        Grant = model.Grant,
                        PhotoFile = model.PhotoFile,
                        StudentCard = studentCard,
                        Group = group,
                        Subjects = new List<Subject>(model.Subjects)
                    };

                    //(student.Subjects as List<Subject>).AddRange(model.Subjects);

                    _context.Students.Add(student);
                    await _context.SaveChangesAsync();

                    return RedirectToAction("Index");
                }
                catch
                {
                    ViewBag.ErrorMessage = "Помилка запису у базу даних";
                }
            }

            ViewBag.Groups = new SelectList(_context.Groups, "GroupName", "GroupName");
            ViewBag.Subjects = _context.Subjects;

            return View(model);
        }

        public JsonResult RemoteSeries(string series)
        {
            try
            {
                return Json(!series.ToUpper().Contains('Z'), JsonRequestBehavior.AllowGet);
            }
            catch
            {
                return Json(false, JsonRequestBehavior.AllowGet);
            }
        }

        // GET: Student/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Student student = await _context.Students.FindAsync(id);
            if (student == null)
            {
                return HttpNotFound();
            }
            ViewBag.Id = new SelectList(_context.StudentCards, "Id", "Series", student.Id);
            return View(student);
        }

        // POST: Student/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id,LastName,FirstName,BirthDate,Email,Grant,PhotoFile")] Student student)
        {
            if (ModelState.IsValid)
            {
                _context.Entry(student).State = EntityState.Modified;
                await _context.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.Id = new SelectList(_context.StudentCards, "Id", "Series", student.Id);
            return View(student);
        }

        // GET: Student/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Student student = await _context.Students.FindAsync(id);
            if (student == null)
            {
                return HttpNotFound();
            }
            return View(student);
        }

        // POST: Student/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            Student student = await _context.Students.FindAsync(id);

            _context.StudentCards.Load();

            /*або так
            if (student.StudentCard != null)
            {
                _context.StudentCards.Remove(student.StudentCard);
            }*/

            _context.Students.Remove(student);
            await _context.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                _context.Dispose();
            }
            base.Dispose(disposing);
        }

        [HttpPost]
        public JsonResult AddStudentPhoto(string group, string lastName, string firstName)
        {
            foreach (string file in Request.Files)
            {
                var upload = Request.Files[file];
                if (upload != null)
                {
                    string fileName = Path.GetFileName(upload.FileName);
                    string directory = Server.MapPath($"~/Content/Photos/{group}");

                    if (!Directory.Exists(directory))
                    {
                        Directory.CreateDirectory(directory);
                    }

                    upload.SaveAs($"{directory}/{fileName}");

                    System.IO.File.Move($"{directory}/{fileName}", $"{directory}/{lastName}_{firstName}.jpg");
                }
            }
            return Json("Файл записано");
        }        
    }
}