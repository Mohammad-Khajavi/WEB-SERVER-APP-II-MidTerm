using SMTI_Teacher_Course_Management.BLL;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace SMTI_Teacher_Course_Management.DAL
{
    public class TeacherDB
    {
        public static List<Teacher> GetAllTeacher()
        {
            List<Teacher> teachers = new List<Teacher>();
            string query = "SELECT TeacherNumber, FirstName, LastName, Email FROM Teachers";

            using (SqlConnection conn = UtilityDB.GetDBConnection())
            {
                SqlCommand cmd = new SqlCommand(query, conn);

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
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
            }
            return teachers;
        }

        public static Teacher GetTeacherById(int teacherNumber)
        {
            Teacher teacher = null;
            string query = "SELECT TeacherNumber, FirstName, LastName, Email FROM Teachers WHERE TeacherNumber = @TeacherNumber";

            using (SqlConnection conn = UtilityDB.GetDBConnection())
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@TeacherNumber", teacherNumber);

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        teacher = new Teacher
                        {
                            TeacherNumber = (int)reader["TeacherNumber"],
                            FirstName = reader["FirstName"].ToString(),
                            LastName = reader["LastName"].ToString(),
                            Email = reader["Email"].ToString()
                        };
                    }
                }
            }

            return teacher;
        }
    }
}
