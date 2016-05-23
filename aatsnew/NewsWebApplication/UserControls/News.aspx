<%@ Page Language="C#" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="UserControls.News" %>


<%@ Register src="NewsUserControl.ascx" tagname="NewsUserControl" tagprefix="uc1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
      
    
        <uc1:NewsUserControl ID="NewsUserControl1" runat="server" />
    
      
    
    </div>
    </form>
</body>
</html>
