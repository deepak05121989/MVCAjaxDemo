using MVCAjaxDemo.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace MVCAjaxDemo.Controllers
{
    public class HomeController : Controller
    {
        private demoDBEntities _context = new demoDBEntities();
        public ActionResult Index()
        {
            HttpResponseMessage response = null;
            JsonResult result = null;
            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:7297/api/");

                response = client.GetAsync("Employee").GetAwaiter().GetResult();
            }
            if (response.IsSuccessStatusCode)
            {
                var employee =JsonConvert.DeserializeObject<List<Employee>>(response.Content.ReadAsStringAsync().Result);
                return View(employee);
            }
            //return result;
            return View();
        }
        public async Task<PartialViewResult> Employee()
        {
            return PartialView("_employee");
        }

        public JsonResult List()
        {
            return Json(_context.Students.ToList(), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Add(Student user)
        {
            _context.Students.Add(user);
            _context.SaveChanges();
            return Json(JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetbyID(int ID)
        {
            return Json(_context.Students.FirstOrDefault(x => x.Id == ID), JsonRequestBehavior.AllowGet);
        }
        public JsonResult Update(Student user)
        {
            var data = _context.Students.FirstOrDefault(x => x.Id == user.Id);
            if (data != null)
            {
                data.Name = user.Name;
                data.State = user.State;
                data.Country = user.Country;
                data.Age = user.Age;
                _context.SaveChanges();
            }
            return Json(JsonRequestBehavior.AllowGet);
        }
        public JsonResult Delete(int ID)
        {
            var data = _context.Students.FirstOrDefault(x => x.Id == ID);
            _context.Students.Remove(data);
            _context.SaveChanges();
            return Json(JsonRequestBehavior.AllowGet);
        }
    }
}