using SMTI_Teacher_Course_Management.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SMTI_Teacher_Course_Management.BLL
{
    public class CourseAssignment
    {
        public int TeacherNumber { get; set; }      
        public string CourseNumber { get; set; }   

        public void AssignCourses(CourseAssignment assignment) => TeacherCourseDB.AssignCourses(assignment);

        public static List<Course> GetCoursesByTeacher(int teacherNumber) => TeacherCourseDB.GetCoursesByTeacher(teacherNumber);

        public static List<Teacher> GetTeachersByCourse(string courseNumber) => TeacherCourseDB.GetTeachersByCourse(courseNumber);



    }
}