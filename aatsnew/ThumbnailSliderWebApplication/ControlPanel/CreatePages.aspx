<%@ Page Title="Slider" Language="C#"  AutoEventWireup="true" CodeFile="CreatePages.aspx.cs" Inherits="CreatePages" %>

<%@ Register src="CreatePages.ascx" tagname="CreatePages" tagprefix="uc1" %>

<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server">--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100px;
        }
        .auto-style2 {
            width: 94px;
            text-align: center;
        }
    </style>
</head>
<body dir="rtl">
    <form id="form1" runat="server">
    <div>
        

                 <table align="center" class="auto-style1">
                     <tr>
                         <td class="auto-style2">
                             <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="CPSlider.aspx">الي الرئيسية</asp:HyperLink>
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style2">&nbsp;</td>
                     </tr>
                 </table>
        

                 <uc1:CreatePages ID="CreatePages1" runat="server" />
        

                 </div>
    </form>
</body>
</html>
<%--    </asp:Panel>
</asp:Content>--%>
