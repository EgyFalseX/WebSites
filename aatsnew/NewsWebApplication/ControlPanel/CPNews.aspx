<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeFile="CPNews.aspx.cs" Inherits="CPNews" %>
<%@ Register src="CPNewsUserControl.ascx" tagname="CPNewsUserControl" tagprefix="uc1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Panel ID="Panel1" runat="server">
        <uc1:CPNewsUserControl ID="CPNewsUserControl1" runat="server" />
    </asp:Panel>
            </div>
    </form>
</body>
</html>
