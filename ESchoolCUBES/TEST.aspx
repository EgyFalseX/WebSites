<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TEST.aspx.cs" Inherits="TEST" %>

<%@ Register src="UserControls/SBBooksSearch.ascx" tagname="SBBooksSearch" tagprefix="uc1" %>
<%@ Register src="UserControls06/QAMenu.ascx" tagname="QAMenu" tagprefix="uc2" %>
<%@ Register src="UserControls06/QAMenuEditor.ascx" tagname="QAMenuEditor" tagprefix="uc3" %>
<%@ Register src="UserControls06/QACreatePage.ascx" tagname="QACreatePage" tagprefix="uc4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="direction: ltr">
    
    
        <uc1:SBBooksSearch ID="SBBooksSearch1" runat="server" />
    
    
    </div>
    </form>
</body>
</html>
