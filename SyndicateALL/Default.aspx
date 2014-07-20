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
                <asp:Label ID="Label1" runat="server" ForeColor="White" Text="Admin[Code]"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink7" runat="server" 
                    NavigateUrl="Admin/CDGovEditor.aspx">المحافظات</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink26" runat="server" 
                    NavigateUrl="Admin/CDSyndicateEditor.aspx">النقابات</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink28" runat="server" 
                    NavigateUrl="Admin/CDSubCommitteEditor">اللجان النقابية</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" bgcolor="Gray">
                <asp:Label ID="Label3" runat="server" ForeColor="White" Text="Admin[Data]"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink27" runat="server" 
                    NavigateUrl="Admin/TBLSyndicateData.aspx">ادخال بيانات النقابات</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink29" runat="server" 
                    NavigateUrl="Admin/CDSubCommitteData.aspx">بيانات اللجان النقابية</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" bgcolor="Gray">
                <asp:Label ID="Label4" runat="server" ForeColor="White" Text="Admin[Privilege]"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink30" runat="server" 
                    NavigateUrl="Admin/RolesEditor.aspx">المجموعات</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink31" runat="server" 
                    NavigateUrl="Admin/UsersEditor.aspx">المستخدمون</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink32" runat="server" 
                    NavigateUrl="Admin/UserRolesEditor.aspx">مجموعات المستخدمين</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink8" runat="server" 
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
                <asp:HyperLink ID="HyperLink25" runat="server" 
                    NavigateUrl="DescionViewer.aspx">القرارات</asp:HyperLink>
            </td>
        </tr>
    </table>
</asp:Content>

