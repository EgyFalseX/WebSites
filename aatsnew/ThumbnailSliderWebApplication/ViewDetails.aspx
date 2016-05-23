<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewDetails.aspx.cs" Inherits="ViewDetails" %>


<%@ Register src="UserControls/ViewDetails.ascx" tagname="ViewDetails" tagprefix="uc1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    

    
    
        <uc1:ViewDetails ID="ViewDetails1" runat="server" />
    

    
    
    </div>
    </form>
</body>
</html>
