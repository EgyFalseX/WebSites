<%@ Page Language="C#" AutoEventWireup="true" CodeFile="library.aspx.cs" Inherits="library" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<%@ Register src="UserControls/SLLibraryScreen.ascx" tagname="SLLibraryScreen" tagprefix="uc1" %>

<%@ Register src="UserControls/SLBookScreen.ascx" tagname="SLBookScreen" tagprefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style3
        {
            height: 674px;
                text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
    </telerik:RadScriptManager>
    <div dir="rtl">
    <table dir ="rtl" class="style1">
        <tr>
            <td valign ="top" class="style3">
                <uc1:SLLibraryScreen ID="SLLibraryScreen1" runat="server" />
                <br />
                <uc2:SLBookScreen ID="SLBookScreen1" runat="server" />
            </td>
        </tr>
    </table>
    
    </div>
    </form>
    
</body>
</html>
