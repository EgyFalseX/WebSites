<%@ Page Title="Slider" Language="C#"  AutoEventWireup="true" CodeFile="CPViewCourse.aspx.cs" Inherits="CPViewCourse" %>

<%@ Register src="UC/CPViewCourseUserControl.ascx" tagname="CPViewCourseUserControl" tagprefix="uc1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body dir="rtl">
    <form id="form1" runat="server">
    <div>
        


        <uc1:CPViewCourseUserControl ID="CPViewCourseUserControl1" runat="server" />
        

   </div>
    </form>
</body>
</html>
