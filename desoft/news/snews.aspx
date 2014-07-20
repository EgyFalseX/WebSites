<%@ Page Language="C#" AutoEventWireup="true" CodeFile="snews.aspx.cs" Inherits="snews" %>

<%@ Register src="UC/Viewer.ascx" tagname="Viewer" tagprefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center; height: 921px; width: 549px">
    
        <uc1:Viewer ID="Viewer1" runat="server" />
    
    </div>
    </form>
</body>
</html>
