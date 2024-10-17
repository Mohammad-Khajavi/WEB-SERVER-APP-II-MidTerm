using SMTI_Teacher_Course_Management.BLL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SMTI_Teacher_Course_Management.DAL
{
    public class CourseDB
    {
        public static List<Course> GetAllCourses()
        {
            List<Course> courses = new List<Course>();
            string query = "SELECT CourseNumber, CourseTitle, TotalHour FROM Courses";

            using (SqlConnection conn = UtilityDB.GetDBConnection())
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    courses.Add(new Course
                    {
                        CourseNumber = reader["CourseNumber"].ToString(),
                        CourseTitle = reader["CourseTitle"].ToString(),
                        TotalHour = (int)reader["TotalHour"]
                    });
                }
            }

            return courses;
        }

        public static Course GetCourseById(string courseNumber)
        {
            Course course = null;
            string query = "SELECT * FROM Courses WHERE CourseNumber = @CourseNumber";

            using (SqlConnection conn = UtilityDB.GetDBConnection())
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@CourseNumber", courseNumber);
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    course = new Course
                    {
                        CourseNumber = reader["CourseNumber"].ToString(),
                        CourseTitle = reader["CourseTitle"].ToString(),
                        TotalHour =(int)reader["TotalHour"]

                    };
                }
            }

            return course;
        }

    }
}