<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .style1
        {
            width: 264px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="style1">
        <tr>
            <td style="text-align: center" bgcolor="Gray">
                <asp:Label ID="Label1" runat="server" ForeColor="White" Text="Admin"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink11" runat="server" 
                    NavigateUrl="EditUserMessagesLow.aspx?msg=3">متابعة الشكاوى </asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink13" runat="server" 
                    NavigateUrl="EditUserMessagesLow.aspx?msg=1">متابعة الاستفسارات</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink14" runat="server" 
                    NavigateUrl="EditUserMessagesLow.aspx?msg=2">متابعة الاقتراحات</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink12" runat="server" 
                    NavigateUrl="EditUserMessagesLow.aspx?msg=4">متابعة رسائل الشكر</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" bgcolor="Gray">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink21" runat="server" 
                    NavigateUrl="EditUserMessagesLowClosed.aspx?msg=3">متابعة الشكاوى - تم الرد</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink22" runat="server" 
                    NavigateUrl="EditUserMessagesLowClosed.aspx?msg=1">متابعة الاستفسارات - تم الرد</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink23" runat="server" 
                    NavigateUrl="EditUserMessagesLowClosed.aspx?msg=2">متابعة الاقتراحات - تم الرد</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink24" runat="server" 
                    NavigateUrl="EditUserMessagesLowClosed.aspx?msg=4">متابعة رسائل الشكر - تم الرد</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" bgcolor="Gray">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink7" runat="server" 
                    NavigateUrl="changepassword.aspx">تغير بيانات الدخول</asp:HyperLink>
            </td>
        </tr>
        </table>
</asp:Content>

