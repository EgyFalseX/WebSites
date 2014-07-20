<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

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
                <asp:HyperLink ID="HyperLink1" runat="server" 
                    NavigateUrl="addata.aspx">المستخدمين</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink8" runat="server" 
                    NavigateUrl="UserMeeting.aspx">صلاحيات اللجان</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink9" runat="server" 
                    NavigateUrl="Itemtype.aspx">اكواد الفعاليات والاحداث</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink10" runat="server" 
                    NavigateUrl="MenuItem.aspx">الاحداث والفعاليات</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink7" runat="server" 
                    NavigateUrl="changepassword.aspx">تغير بيانات الدخول</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" bgcolor="Gray">
                <asp:Label ID="Label2" runat="server" ForeColor="White" Text="User"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="ViewMenuItem.aspx">الاحداث والفعاليات - مدير</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="ViewMenu.aspx">الاحداث والفعاليات</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="eventNews.aspx">الاحداث والفعاليات - نبذه مختصره</asp:HyperLink>
            </td>
        </tr>
        </table>
</asp:Content>

