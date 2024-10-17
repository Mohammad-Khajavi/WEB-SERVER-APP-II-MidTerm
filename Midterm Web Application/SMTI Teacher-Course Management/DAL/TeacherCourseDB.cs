using SMTI_Teacher_Course_Management.BLL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SMTI_Teacher_Course_Management.DAL
{
    public class TeacherCourseDB
    {
        public static void AssignCourses(CourseAssignment assignment)
        {
            string query = "INSERT INTO TeacherCourses (TeacherNumber, CourseNumber) VALUES (@TeacherNumber, @CourseNumber)";

            using (SqlConnection conn = UtilityDB.GetDBConnection())
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@TeacherNumber", assignment.TeacherNumber);
                cmd.Parameters.AddWithValue("@CourseNumber", assignment.CourseNumber);

                cmd.ExecuteNonQuery();
            }
        }

        public static List<Course> GetCoursesByTeacher(int teacherNumber)
        {
            List<Course> courses = new List<Course>();
            string query = "SELECT c.CourseNumber, c.CourseTitle, c.TotalHour FROM Courses c " +
                           "JOIN TeacherCourses tc ON c.CourseNumber = tc.CourseNumber " +
                           "WHERE tc.TeacherNumber = @TeacherNumber";

            using (SqlConnection conn = UtilityDB.GetDBConnection())
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@TeacherNumber", teacherNumber);
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


        public static List<Teacher> GetTeachersByCourse(string courseNumber)
        {
            List<Teacher> teachers = new List<Teacher>();
            string query = "SELECT t.TeacherNumber, t.FirstName, t.LastName, t.Email FROM Teachers t " +
                           "JOIN TeacherCourses tc ON t.TeacherNumber = tc.TeacherNumber " +
                           "WHERE tc.CourseNumber = @CourseNumber";

            using (SqlConnection conn = UtilityDB.GetDBConnection())
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@CourseNumber", courseNumber);
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    teachers.Add(new Teacher
                    {
                        TeacherNumber = (int)reader["TeacherNumber"],
                        FirstName = reader["FirstName"].ToString(),
                        LastName = reader["LastName"].ToString(),
                        Email = reader["Email"].ToString()
                    });
                }
            }

            return teachers;
        }

    }


    
}