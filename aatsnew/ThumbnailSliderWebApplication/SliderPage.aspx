<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SliderPage.aspx.cs" Inherits="SliderPage" %>


<%@ Register src="UserControls/SliderUserControl.ascx" tagname="SliderUserControl" tagprefix="uc1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    

    
        <uc1:SliderUserControl ID="SliderUserControl1" runat="server" />
    

    
    </div>
    </form>
</body>
</html>
