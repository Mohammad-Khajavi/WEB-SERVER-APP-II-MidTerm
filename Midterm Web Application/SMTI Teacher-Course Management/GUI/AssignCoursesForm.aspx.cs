using SMTI_Teacher_Course_Management.BLL;
using SMTI_Teacher_Course_Management.VALIDATION;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SMTI_Teacher_Course_Management.GUI
{
    public partial class AssignCoursesForm : System.Web.UI.Page
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

                Course course = new Course();
                foreach (var c in course.GetAllCourses())
                {
                    ddlCourses.Items.Add(new ListItem($"{c.CourseTitle}, {c.CourseNumber}", c.CourseNumber));
                }
            }

        }

        protected void btnAssignCourses_Click(object sender, EventArgs e)
        {
            int selectedTeacherNumber = Convert.ToInt32(ddlTeachers.SelectedValue);

            string selectedCourseNumber = ddlCourses.SelectedValue;

            if (!CourseValidation.CanAssignMoreCourses(selectedTeacherNumber))
            {
                Response.Write("<script>alert('This teacher is already assigned to 4 courses.');</script>");
                return;
            }

            if (CourseValidation.IsTeacherAlreadyAssigned(selectedTeacherNumber, selectedCourseNumber))
            {
                Response.Write("<script>alert('This teacher is already assigned to this course.');</script>");
                return;
            }

            CourseAssignment assignment = new CourseAssignment
            {
                TeacherNumber = selectedTeacherNumber,
                CourseNumber = selectedCourseNumber
            };

            assignment.AssignCourses(assignment);

            Response.Write("<script>alert('Course assigned successfully!');</script>");

            ddlTeachers.ClearSelection();
            ddlCourses.ClearSelection();
        }

        protected void ListCoursesPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GUI/ListCoursesByTeacherForm.aspx");
        }

        protected void ListTeacherPage_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/GUI/ListTeachersByCourseForm.aspx");
        }
    }
}


