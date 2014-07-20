<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Login.ascx.cs" Inherits="Login" %>
<style type="text/css">
    .style1
    {
        width: 354px;
    }
    .style2
    {
        font-family: "Helvetica Neue", "Lucida Grande", "Segoe UI", Arial, Helvetica, Verdana, sans-serif;
        text-decoration: underline;
        font-size: 1em;
    }
    .style3
    {
        height: 36px;
    }
    .style4
    {
        height: 30px;
    }
</style>
<table align="center" class="style1">
    <tr>
        <td class="style3" valign="top">
            <h4>
            <asp:Label ID="Label1" runat="server" Text="UserName" CssClass="style2" 
                    Font-Bold="True"></asp:Label>
            </h4>
            <asp:TextBox ID="TxtUser" runat="server" Width="250px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style4" valign="top">
            <h4>
            <asp:Label ID="Label2" runat="server" Text="Password" CssClass="style2" 
                    Font-Bold="True"></asp:Label>
            </h4>
            <asp:TextBox ID="TxtPass" runat="server" Width="250px" TextMode="Password"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="text-align: left">
            <asp:Button ID="BtnLogin" runat="server" onclick="BtnLogin_Click" Text="Login" 
                Width="100px" Font-Bold="False" Height="34px" />
        </td>
    </tr>
    <tr>
        <td bgcolor="Yellow" style="text-align: center">
            <asp:Label ID="LblState" runat="server" style="font-weight: 700"></asp:Label>
        </td>
    </tr>
</table>

