using SMTI_Teacher_Course_Management.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SMTI_Teacher_Course_Management.BLL
{
    public class Course
    {
        public string CourseNumber { get; set; }    
        public string CourseTitle { get; set; }    
        public int TotalHour { get; set; }     

   
        public List<Course> GetAllCourses() =>  CourseDB.GetAllCourses();

        public Course GetCourseById(string courseNumber) => CourseDB.GetCourseById(courseNumber);

    }
}