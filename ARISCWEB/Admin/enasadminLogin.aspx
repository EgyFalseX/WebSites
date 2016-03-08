<%@ Page Language="C#" AutoEventWireup="true" CodeFile="enasadminLogin.aspx.cs" Inherits="enasadminLogin" %>

<%@ Register src="UC/enasadminLoginUserControl.ascx" tagname="enasadminLoginUserControl" tagprefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Panel ID="Panel1" runat="server">
            <uc1:enasadminLoginUserControl ID="LoginUserControl1" runat="server" />
         
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
