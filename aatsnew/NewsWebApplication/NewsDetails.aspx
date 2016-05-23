<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewsDetails.aspx.cs" Inherits="NewsDetails" %>



<%@ Register Src="~/NewsWebApplication/UserControls/NewsDetails1UserControl.ascx" TagPrefix="uc1" TagName="NewsDetails1UserControl" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    

    
    
        <uc1:NewsDetails1UserControl ID="NewsDetails1UserControl1" runat="server" />
    
    

    
    
    </div>
    </form>
</body>
</html>
