<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 284px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="PnlLogin" runat="server" Visible="False">
        <table class="style2" dir="ltr" align="center" border="1">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                Font-Italic="False" Font-Size="14px" Text="Username"></asp:Label>
                </td>
                <td style="text-align: right">
                    <asp:TextBox ID="TxtUserName" runat="server" Width="150px">admin</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" 
                Font-Italic="False" Font-Size="14px" Text="Password"></asp:Label>
                </td>
                <td style="text-align: right">
                    <asp:TextBox ID="TxtPassword" runat="server" 
                TextMode="Password" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:Button ID="BtnLogin" runat="server" onclick="BtnLogin_Click" Text="Logon" 
                        Width="200px" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:Label ID="LblState" runat="server" BackColor="Yellow" Font-Bold="False" 
                        Font-Italic="False"></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

