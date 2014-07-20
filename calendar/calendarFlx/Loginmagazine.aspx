<%@ Page Title="" Language="C#" MasterPageFile="Magazine.master" AutoEventWireup="true" CodeFile="Loginmagazine.aspx.cs" Inherits="Loginmagazine" %>

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
        <table class="style2" dir="rtl" align="center" border="1">
            <tr>
                <td style="text-align: left">
                    <asp:TextBox ID="TxtUserName" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td style="text-align: left">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="False" 
                        Font-Size="14px" Text="UserName"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: left">
                    <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password" Width="150px"></asp:TextBox>
                </td>
                <td style="text-align: left">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="False" 
                        Font-Size="14px" Text="Password"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:CheckBox ID="CBPass" runat="server" Text="Login Into Password Changer" 
                        TextAlign="Left" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:Button ID="BtnLogin" runat="server" onclick="BtnLogin_Click" Text="Enter" 
                        Width="200px" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="LblState" runat="server" BackColor="Yellow" Font-Bold="False" 
                        Font-Italic="False"></asp:Label>
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>

