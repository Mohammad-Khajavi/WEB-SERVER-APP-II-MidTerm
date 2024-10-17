<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListCoursesByTeacherForm.aspx.cs" Inherits="SMTI_Teacher_Course_Management.GUI.ListCoursesByTeacherForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>List Courses by Teacher</title>
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
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Button ID="btnShowCourses" runat="server" Text="Show Courses" CssClass="auto-style3" OnClick="btnShowCourses_Click" />
                </td>
            </tr>
        </table>

        <table align="center" class="auto-style1">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>Assigned Courses</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:GridView ID="GridViewCourses" runat="server" CssClass="auto-style3" Width="100%"></asp:GridView>
                </td>
            </tr>

             <td>
                <asp:Button ID="AssignCoursePage" runat="server" Text="Assign Course Page" OnClick="AssignCoursePage_Click" />
             </td>
             
             <td>
                <asp:Button ID="ListTeacherPage" runat="server" Text="List of teachers" OnClick="ListTeacherPage_Click" style="height: 26px" />
             </td>
        </table>
    </form>
</body>
</html>
