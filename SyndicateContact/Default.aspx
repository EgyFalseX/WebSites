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
                    NavigateUrl="UserInfo.aspx">المستخدمين</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink8" runat="server" 
                    NavigateUrl="UserAppilty.aspx">الصلاحيات</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink9" runat="server" 
                    NavigateUrl="CDLagnaEdarat.aspx">ادارات النقابات</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" bgcolor="Gray">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink11" runat="server" 
                    NavigateUrl="EditUserMessages.aspx?msg=3">متابعة الشكاوى </asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink13" runat="server" 
                    NavigateUrl="EditUserMessages.aspx?msg=1">متابعة الاستفسارات</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink14" runat="server" 
                    NavigateUrl="EditUserMessages.aspx?msg=2">متابعة الاقتراحات</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink12" runat="server" 
                    NavigateUrl="EditUserMessages.aspx?msg=4">متابعة رسائل الشكر</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" bgcolor="Gray">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink21" runat="server" 
                    NavigateUrl="EditUserMessagesClosed.aspx?msg=3">متابعة الشكاوى - تم الرد</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink22" runat="server" 
                    NavigateUrl="EditUserMessagesClosed.aspx?msg=1">متابعة الاستفسارات - تم الرد</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink23" runat="server" 
                    NavigateUrl="EditUserMessagesClosed.aspx?msg=2">متابعة الاقتراحات - تم الرد</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink24" runat="server" 
                    NavigateUrl="EditUserMessagesClosed.aspx?msg=4">متابعة رسائل الشكر - تم الرد</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" bgcolor="Gray">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink15" runat="server" 
                    NavigateUrl="ViewUserMessages.aspx?msg=3">عرض الشكاوى </asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink16" runat="server" 
                    NavigateUrl="ViewUserMessages.aspx?msg=1">عرض الاستفسارات</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink17" runat="server" 
                    NavigateUrl="ViewUserMessages.aspx?msg=2">عرض الاقتراحات</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink18" runat="server" 
                    NavigateUrl="ViewUserMessages.aspx?msg=4">عرض رسائل الشكر</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" bgcolor="Gray">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink19" runat="server" 
                    NavigateUrl="ViewAllMessages.aspx">عرض الرسائل</asp:HyperLink>
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
        <tr>
            <td style="text-align: center" bgcolor="Gray">
                <asp:Label ID="Label2" runat="server" ForeColor="White" Text="User"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="ChooseContype.aspx">ارسال رساله</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="ViewMessage.aspx">بحث عن رساله</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink20" runat="server" 
                    NavigateUrl="ViewAllMessagesUser.aspx?id=1">عرض رسائل الاستفسارات</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink25" runat="server" 
                    NavigateUrl="ViewAllMessagesUser.aspx?id=2">عرض رسائل الاقتراحات</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink26" runat="server" 
                    NavigateUrl="ViewAllMessagesUser.aspx?id=3">عرض رسائل الشكاوي</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink27" runat="server" 
                    NavigateUrl="ViewAllMessagesUser.aspx?id=4">عرض رسائل الشكر</asp:HyperLink>
            </td>
        </tr>
    </table>
</asp:Content>

