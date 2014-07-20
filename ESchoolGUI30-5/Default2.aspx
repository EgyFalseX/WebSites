<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<%@ Register src="UserControls/InfoBar.ascx" tagname="InfoBar" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 616px;
        }
        .style3
        {
            width: 616px;
            height: 307px;
        }
        .style4
        {
            height: 307px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    
    <table class="style1">
        <tr>
            <td class="style3">
                dddddddddddddddddddddddddddddd</td>
            <td class="style4">
                dddddddddddddddd</td>
        </tr>
        <tr>
            <td class="style2" style="text-align: center; margin-left:5px;margin-right:5px;" valign="middle">
                dddddddddddddddddddddddddddddddddddddddddddddddddddddddd ddddddddddddddddd 
                dddddddd dddddddddddd ddddddddddddddddddd dddddddddddddddddd ddddddddddddddddd 
                ddd</td>
            <td>
                <uc1:InfoBar ID="InfoBar1" runat="server" /></td>
        </tr>
    </table>
    
    </form>
    </body>
</html>
