using MVCAjaxDemo.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Drawing.Imaging;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace MVCAjaxDemo.Controllers
{
    public class EmployeeController : Controller
    {
        // GET: Employee
        public ActionResult Index()
        {
           

            return View();
        }
        public JsonResult List()
        {
            HttpResponseMessage response =null;
            JsonResult result = null;
            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:7297/api/");

                response = client.GetAsync("Employee").GetAwaiter().GetResult();
            }
            if(response.IsSuccessStatusCode)
            {
                var employee=JsonConvert.DeserializeObject<List<Employee>>(response.Content.ReadAsStringAsync().Result);
                result= Json(employee, JsonRequestBehavior.AllowGet);
            }
            return result;
        }


        public JsonResult Add(Employee employee)
        {
            HttpResponseMessage response = null;
            JsonResult result = null;
            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:7297/api/Employee");
                using (HttpRequestMessage httpRequest = new HttpRequestMessage())
                {
                    httpRequest.Method= HttpMethod.Post;
                    httpRequest.Content=new StringContent(JsonConvert.SerializeObject(employee),Encoding.UTF8,"application/json");
                    response = client.SendAsync(httpRequest).GetAwaiter().GetResult();

                }
                    
            }
            if (response.IsSuccessStatusCode)
            {
                var employee1 = response.Content.ReadAsStringAsync().Result;
                result = Json(employee1, JsonRequestBehavior.AllowGet);
            }


            return result;
        }
        public JsonResult GetbyID(int ID)
        {
            HttpResponseMessage response = null;
            JsonResult result = null;
            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri("https://localhost:7297/api/");

                response = client.GetAsync($"Employee/{ID}").GetAwaiter().GetResult();
            }
            if (response.IsSuccessStatusCode)
            {
                var employee = JsonConvert.DeserializeObject<Employee>(response.Content.ReadAsStringAsync().Result);
                result = Json(employee, JsonRequestBehavior.AllowGet);
            }
            return result;
        }
        public JsonResult Update(Employee emp)
        {
            HttpResponseMessage response = null;
            JsonResult result = null;
            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri($"https://localhost:7297/api/Employee");
                using (HttpRequestMessage httpRequest = new HttpRequestMessage())
                {
                    httpRequest.Method = HttpMethod.Put;
                    httpRequest.Content = new StringContent(JsonConvert.SerializeObject(emp), Encoding.UTF8, "application/json");
                    response = client.SendAsync(httpRequest).GetAwaiter().GetResult();

                }

            }
            if (response.IsSuccessStatusCode)
            {
                var employee1 = response.Content.ReadAsStringAsync().Result;
                result = Json(employee1, JsonRequestBehavior.AllowGet);
            }


            return result;

           // return Json(JsonRequestBehavior.AllowGet);
        }
        public JsonResult Delete(int Id)
        {

            HttpResponseMessage response = null;
            JsonResult result = null;
            using (HttpClient client = new HttpClient())
            {
                client.BaseAddress = new Uri($"https://localhost:7297/api/Employee/{Id}");
                using (HttpRequestMessage httpRequest = new HttpRequestMessage())
                {
                    httpRequest.Method = HttpMethod.Delete;
                    //httpRequest.Content = new StringContent(JsonConvert.SerializeObject(emp), Encoding.UTF8, "application/json");
                    response = client.SendAsync(httpRequest).GetAwaiter().GetResult();

                }

            }
            if (response.IsSuccessStatusCode)
            {
                var employee1 = response.Content.ReadAsStringAsync().Result;
                result = Json(employee1, JsonRequestBehavior.AllowGet);
            }


            return result;
        }
    }
}
