<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style1
        {
            width: 264px;
        }
        .style2
        {
            width: 587px;
            height: 148px;
        }
        .style3
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <table align="center" class="style1">
        <tr>
            <td style="text-align: center" bgcolor="Gray">
                <asp:Label ID="Label1" runat="server" ForeColor="White" Text="Admin"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="TreeEditor.aspx">Edit Mode</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="changepassword.aspx">Change Username/Password</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" bgcolor="Gray">
                <asp:Label ID="Label2" runat="server" ForeColor="White" Text="User"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="TreeViewer.aspx">View Mode</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                &nbsp;</td>
        </tr>
        </table>
    <br />
    <table align="center" class="style3">
        <tr>
            <td style="text-align: center">
                <img src="images/imagesProduct.jpg" height="314" /></td>
        </tr>
    </table>
    <br />
</asp:Content>
