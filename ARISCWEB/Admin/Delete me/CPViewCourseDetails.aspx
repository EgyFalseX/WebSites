<%@ Page Title="Slider" Language="C#"  AutoEventWireup="true" CodeFile="CPViewCourseDetails.aspx.cs" Inherits="CPViewCourseDetails" %>


<%@ Register src="UC/CPViewCourseDetailsUserControl.ascx" tagname="CPViewCourseDetailsUserControl" tagprefix="uc1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body dir="rtl">
    <form id="form1" runat="server">
    <div>
        

        <uc1:CPViewCourseDetailsUserControl ID="CPViewCourseDetailsUserControl1" runat="server" />
        

   </div>
    </form>
</body>
</html>
