using System.Collections.Generic;
using System.Web.Mvc;
using Practical_7.Models;

namespace Practical_7.Controllers
{
    public class FeedbackController : Controller
    {
        // ---------- Student Feedback ----------

        [HttpGet]
        public ActionResult StudentFeedback()
        {
            LoadStudentLists();
            return View(new StudentFeedbackModel());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult StudentFeedback(StudentFeedbackModel model)
        {
            if (ModelState.IsValid)
            {
                // TODO: persist feedback (e.g., Entity Framework / ADO.NET)
                TempData["Message"] = "Thank you, " + model.Name + "! Your student feedback has been submitted.";
                return RedirectToAction("Success");
            }

            LoadStudentLists();
            return View(model);
        }

        // ---------- Teacher Feedback ----------

        [HttpGet]
        public ActionResult TeacherFeedback()
        {
            LoadTeacherLists();
            return View(new TeacherFeedbackModel());
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult TeacherFeedback(TeacherFeedbackModel model)
        {
            if (ModelState.IsValid)
            {
                // TODO: persist feedback
                TempData["Message"] = "Thank you, " + model.Name + "! Your teacher feedback has been submitted.";
                return RedirectToAction("Success");
            }

            LoadTeacherLists();
            return View(model);
        }

        // ---------- Success ----------

        public ActionResult Success()
        {
            // Guard against direct navigation with no submission
            if (TempData["Message"] == null)
            {
                return RedirectToAction("Index", "Home");
            }
            ViewBag.Message = TempData["Message"];
            return View();
        }

        // ---------- Helpers ----------

        private void LoadStudentLists()
        {
            ViewBag.Courses = new SelectList(new List<string>
            {
                "Computer Science", "Information Technology", "Electronics",
                "Mechanical Engineering", "Business Administration"
            });
            ViewBag.Ratings = RatingList();
        }

        private void LoadTeacherLists()
        {
            ViewBag.Departments = new SelectList(new List<string>
            {
                "Computer Science", "Mathematics", "Physics",
                "English", "Management"
            });
            ViewBag.Ratings = RatingList();
        }

        private static SelectList RatingList()
        {
            return new SelectList(new[]
            {
                new { Value = 5, Text = "5 - Excellent" },
                new { Value = 4, Text = "4 - Very Good" },
                new { Value = 3, Text = "3 - Good" },
                new { Value = 2, Text = "2 - Fair" },
                new { Value = 1, Text = "1 - Poor" }
            }, "Value", "Text");
        }
    }
}
