<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 284px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <asp:Panel ID="PnlLogin" runat="server" Visible="False">
        <table class="style2" dir="rtl" align="center" border="1">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                Font-Italic="False" Font-Size="14px" Text="اسم المستخدم"></asp:Label>
                </td>
                <td style="text-align: right">
                    <asp:TextBox ID="TxtUserName" runat="server" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" 
                Font-Italic="False" Font-Size="14px" Text="كلمة المرور"></asp:Label>
                </td>
                <td style="text-align: right">
                    <asp:TextBox ID="TxtPassword" runat="server" 
                TextMode="Password" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="BtnLogin" runat="server" onclick="BtnLogin_Click" Text="دخول" 
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

