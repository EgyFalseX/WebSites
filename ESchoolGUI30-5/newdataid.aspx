<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newdataid.aspx.cs" Inherits="newdataid" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>تفاصيــــل الخبر</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <b><label for="LblNewsTitle"> <%= ShowNewsTitle()%> </label></b>
        <br />
        <label for="LblNewsDetails"> <%= ShowNewsDetails()%> </label>
    </div>
    </form>
</body>
</html>
