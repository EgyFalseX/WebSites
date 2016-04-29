<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>


<%@ Register src="LoginUserControl.ascx" tagname="LoginUserControl" tagprefix="uc1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Panel ID="Panel1" runat="server">
            <uc1:LoginUserControl ID="LoginUserControl1" runat="server" />
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
