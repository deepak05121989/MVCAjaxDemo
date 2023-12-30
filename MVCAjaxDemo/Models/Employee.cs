using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVCAjaxDemo.Models
{
    //public class Root
    //{
    //    public int employeeId { get; set; }
    //    public string employeeName { get; set; }
    //    public string employeeEmail { get; set; }
    //    public double employeeSalary { get; set; }
    //    public object employeeMobile { get; set; }
    //}
    public class Employee
    {
        [Key]
        public int EmployeeId { get; set; }
        [Required]
        public string EmployeeName { get; set; }
        [Required]
        public string EmployeeEmail { get; set; }
        [Required]
        public double EmployeeSalary { get; set; }
        [Required]
        public long EmployeeMobile { get; set; }
    }
}