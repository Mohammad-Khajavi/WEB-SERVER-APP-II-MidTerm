<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AssignCoursesForm.aspx.cs" Inherits="SMTI_Teacher_Course_Management.GUI.AssignCoursesForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Assign Courses to Teacher</title>
    <style type="text/css">
        .auto-style1 {
            width: 50%;
        }
        .auto-style2 {
            width: 250px;
        }
        .auto-style3 {
            margin-left: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table align="center" class="auto-style1">
            <tr>
                <td class="auto-style2">Select Teacher</td>
                <td>
                    <asp:DropDownList ID="ddlTeachers" runat="server" CssClass="auto-style3"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Select Course</td>
                <td>
                    <asp:DropDownList ID="ddlCourses" runat="server" CssClass="auto-style3"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td style="text-align:center;">
                    <asp:Button ID="btnAssignCourses" runat="server" Text="Assign Course" CssClass="auto-style3" OnClick="btnAssignCourses_Click" />
                </td>
            </tr>

            <tr>
                <td>
                    <asp:Button ID="ListCoursesPage" runat="server" Text="List of course" OnClick="ListCoursesPage_Click" />
                </td>
                <td>
                    <asp:Button ID="ListTeacherPage" runat="server" Text="List of teachers" OnClick="ListTeacherPage_Click" style="height: 26px" />
                </td>

            </tr>
        </table>
    </form>
    </body>
</html>
