﻿<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register src="userconrol/ItemView.ascx" tagname="ItemView" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 30%;
        }
        .style2
        {
            height: 195px;
        }
        .style3
        {
            height: 195px;
            width: 75px;
        }
        .style4
        {
            width: 75px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <uc1:ItemView ID="ItemView1" runat="server" />
    
    </div>
    </form>
</body>
</html>
