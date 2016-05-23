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
    </style>
</head>
<body dir="rtl">
    <form id="form1" runat="server">
    <div>
        

                 <table align="center" class="auto-style1">
                     <tr>
                         <td style="text-align: center">
                             <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="CPNews.aspx">الي الرئيسية</asp:HyperLink>
                         </td>
                     </tr>
                     <tr>
                         <td>
        

                 <uc1:CreatePages ID="CreatePages1" runat="server" />
        

                         </td>
                     </tr>
                 </table>
        

                 </div>
    </form>
</body>
</html>
<%--    </asp:Panel>
</asp:Content>--%>
