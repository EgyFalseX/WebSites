<%@ Page Title="Slider" Language="C#"  AutoEventWireup="true" CodeFile="CPViewCourseDetailsReport.aspx.cs" Inherits="CPViewCourseDetailsReport" %>


<%@ Register src="UC/CPViewCourseDetailsReportUserControl.ascx" tagname="CPViewCourseDetailsReportUserControl" tagprefix="uc1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body dir="rtl">
    <form id="form1" runat="server">
    <div>
        

        <uc1:CPViewCourseDetailsReportUserControl ID="CPViewCourseDetailsReportUserControl1" runat="server" />
        

   </div>
    </form>
</body>
</html>
