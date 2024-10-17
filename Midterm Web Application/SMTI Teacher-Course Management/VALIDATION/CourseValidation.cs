using SMTI_Teacher_Course_Management.BLL;
using SMTI_Teacher_Course_Management.DAL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SMTI_Teacher_Course_Management.VALIDATION
{
    public class CourseValidation
    {
        public static bool CanAssignMoreCourses(int teacherNumber)
        {
            List<Course> coursesAssigned = CourseAssignment.GetCoursesByTeacher(teacherNumber);

            if (coursesAssigned.Count >= 4)
            {
                return false;
            }

            return true;
        }

        public static bool IsTeacherAlreadyAssigned(int teacherNumber, string courseNumber)
        {
            bool isAssigned = false;
            string query = "SELECT COUNT(*) FROM TeacherCourses WHERE TeacherNumber = @TeacherNumber AND CourseNumber = @CourseNumber";

            using (SqlConnection conn = UtilityDB.GetDBConnection())
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@TeacherNumber", teacherNumber);
                cmd.Parameters.AddWithValue("@CourseNumber", courseNumber);

                int count = (int)cmd.ExecuteScalar();  
                isAssigned = count > 0;
            }

            return isAssigned;
        }
    }
}