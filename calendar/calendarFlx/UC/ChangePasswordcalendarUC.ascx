<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ChangePasswordcalendarUC.ascx.cs" Inherits="ChangePasswordcalendarUC" %>
<style type="text/css">
    .style1
    {
        width: 371px;
    }
</style>

<table align="center" class="style1">
    <tr>
        <td style="text-align: left">
            <asp:Label ID="Label1" runat="server" Text="Password"></asp:Label>
        </td>
        <td style="text-align: left">
            <asp:TextBox ID="Txtpass1" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="text-align: left">
            <asp:Label ID="Label2" runat="server" Text="Password Confirmation"></asp:Label>
        </td>
        <td style="text-align: left">
            <asp:TextBox ID="Txtpass2" runat="server" TextMode="Password" Width="200px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="text-align: center">
            <asp:Button ID="BtnUpdate" runat="server" onclick="BtnUpdate_Click" 
                Text="Update" Width="150px" />
        </td>
    </tr>
    <tr>
        <td bgcolor="Yellow" colspan="2" style="text-align: center">
            <asp:Label ID="LblState" runat="server" Font-Bold="True"></asp:Label>
        </td>
    </tr>
</table>

