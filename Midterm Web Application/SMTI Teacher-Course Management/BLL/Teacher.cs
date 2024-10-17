using SMTI_Teacher_Course_Management.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SMTI_Teacher_Course_Management.BLL
{
    public class Teacher
    {
        public int TeacherNumber { get; set; }      
        public string FirstName { get; set; }      
        public string LastName { get; set; }       
        public string Email { get; set; }          


        public static Teacher GetTeacherById(int teacherNumber) => TeacherDB.GetTeacherById(teacherNumber);
        public List<Teacher> GetAllTeacher() => TeacherDB.GetAllTeacher();
    }
}