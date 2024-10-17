using SMTI_Teacher_Course_Management.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SMTI_Teacher_Course_Management.GUI
{
    public partial class ListCoursesByTeacherForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Teacher teacher = new Teacher();
                foreach (var t in teacher.GetAllTeacher())
                {
                    ddlTeachers.Items.Add(new ListItem($"{t.TeacherNumber}, {t.FirstName} {t.LastName}", t.TeacherNumber.ToString()));
                }
            }
        }

        protected void btnShowCourses_Click(object sender, EventArgs e)
        {
            int selectedTeacherNumber = Convert.ToInt32(ddlTeachers.SelectedValue);

            List<Course> courses = CourseAssignment.GetCoursesByTeacher(selectedTeacherNumber);

            GridViewCourses.DataSource = courses;
            GridViewCourses.DataBind();

        }

        protected void ListTeacherPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GUI/ListTeachersByCourseForm.aspx");
        }

        protected void AssignCoursePage_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GUI/AssignCoursesForm.aspx");

        }
    }
}