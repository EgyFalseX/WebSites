<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MainNewsDetails.aspx.cs" Inherits="MainNewsDetails" %>



<%@ Register src="UserControls/NewsDetailsUserControl.ascx" tagname="NewsDetailsUserControl" tagprefix="uc2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc2:NewsDetailsUserControl ID="NewsDetailsUserControl1" runat="server" />
    </div>
    </form>
</body>
</html>
