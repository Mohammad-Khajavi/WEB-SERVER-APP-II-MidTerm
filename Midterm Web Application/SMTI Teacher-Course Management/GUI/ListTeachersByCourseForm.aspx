<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListTeachersByCourseForm.aspx.cs" Inherits="SMTI_Teacher_Course_Management.GUI.ListTeachersByCourseForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>List Teachers by Course</title>
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
                <td class="auto-style2">Select Course</td>
                <td>
                    <asp:DropDownList ID="ddlCourses" runat="server" CssClass="auto-style3"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>
                    <asp:Button ID="btnShowTeachers" runat="server" Text="Show Teachers" CssClass="auto-style3" OnClick="btnShowTeachers_Click" />
                </td>
            </tr>
        </table>

        <table align="center" class="auto-style1">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>Assigned Teachers</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:GridView ID="GridViewTeachers" runat="server" CssClass="auto-style3" Width="100%"></asp:GridView>
                </td>
            </tr>

             <td>
                <asp:Button ID="ListCoursesPage" runat="server" Text="List of course" OnClick="ListCoursesPage_Click" />
             </td>
 
             <td>
                <asp:Button ID="AssignCoursePage" runat="server" Text="Assign Course Page" OnClick="AssignCoursePage_Click" style="height: 26px" />
            </td>
        </table>
    </form>
</body>
</html>
