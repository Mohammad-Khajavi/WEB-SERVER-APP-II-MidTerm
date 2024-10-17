using SMTI_Teacher_Course_Management.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SMTI_Teacher_Course_Management.GUI
{
    public partial class ListTeachersByCourseForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Course course = new Course();
                foreach (var c in course.GetAllCourses()) 
                {
                    ddlCourses.Items.Add(new ListItem($"{c.CourseTitle}, {c.CourseNumber}", c.CourseNumber.ToString()));
                }
            }
        }

        protected void btnShowTeachers_Click(object sender, EventArgs e)
        {
            string selectedCourseNumber = ddlCourses.SelectedValue;

            List<Teacher> teachers = CourseAssignment.GetTeachersByCourse(selectedCourseNumber);

            GridViewTeachers.DataSource = teachers;
            GridViewTeachers.DataBind();

        }

        protected void ListCoursesPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GUI/ListCoursesByTeacherForm.aspx");
        }


        protected void AssignCoursePage_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GUI/AssignCoursesForm.aspx");
        }
    }
}