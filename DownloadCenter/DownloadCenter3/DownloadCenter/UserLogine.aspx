<%@ Page Title="" Language="C#" MasterPageFile="masteruser.master" AutoEventWireup="true" CodeFile="UserLogine.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 647px;
        }
        .style4
        {
            font-weight: bold;
        }
        .style5
        {
            width: 400px;
            text-align: right;
        }
        .style7
        {
            text-align: center;
            width: 207px;
        }
        .style8
        {
            width: 348px;
            text-align: right;
        }
        .auto-style1 {
            width: 348px;
            text-align: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <asp:Panel ID="PnlLogin" runat="server" Visible="False">
        <table class="style2" dir="rtl" align="center" border="1">
            <tr>
                <td colspan="2" style="text-align: center">
                    <img src="images/user-group.png" style="text-align: center; height: 92px; width: 140px;" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1" align="left">
                    <asp:TextBox ID="TxtUserName" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td class="style8">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="14px" Text="User Name "></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1" align="left">
                    <asp:TextBox ID="TxtPassword" runat="server" 
                TextMode="Password" Width="150px" style="text-align: right"></asp:TextBox>
                </td>
                <td class="style8">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="False" Font-Size="14px" Text="Pasword "></asp:Label>
                </td>
            </tr>
            <tr style="font-weight: 700">
                <td colspan="2" style="text-align: center">
                    <asp:Button ID="BtnLogin" runat="server" onclick="BtnLogin_Click" Text="LogIn" 
                        Width="200px" style="font-weight: 700" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <span id="result_box" class="" lang="en"><span class="hps"><strong>Note</strong></span><span><strong>: You can</strong></span> <span class="hps"><strong>obtain the user</strong></span> <span class="hps"><strong>name and password</strong></span> <span class="hps"><strong>from the Department of</strong></span> <span class="hps"><strong>Student Affairs</strong></span> <span class="hps"><strong>at school</strong></span></span></td>
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

