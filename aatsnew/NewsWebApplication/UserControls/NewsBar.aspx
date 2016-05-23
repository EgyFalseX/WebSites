<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewsBar.aspx.cs" Inherits="ArabTeacher.UserControls.NewsBar" %>

<%@ Register src="NewsBarJQEnUserControl.ascx" tagname="NewsBarJQEnUserControl" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <uc1:NewsBarJQEnUserControl ID="NewsBarJQEnUserControl1" runat="server" />
    
    </div>
    </form>
</body>
</html>
