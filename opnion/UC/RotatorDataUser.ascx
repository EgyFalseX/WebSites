<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RotatorDataUser.ascx.cs" Inherits="RotatorDataUser" %>
<style type="text/css">
    .style3
    {
    }
    .style5
    {
        width: 95px;
    }
    .style6
    {
        width: 276px;
    }
    </style>

<p>
</p>
<table align="center" style="width: 781px" border="2">
    <tr>
        <td class="style3" style="text-align: center" colspan="4">
            <asp:Label ID="LblCaption" runat="server" Font-Bold="True" Font-Size="14pt" 
                ForeColor="#666666"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style3" style="text-align: right" bgcolor="#CCD9EB">
            <asp:TextBox ID="Txtmail" runat="server" style="direction: rtl" Width="250px"></asp:TextBox>
        </td>
        <td class="style5" style="text-align: right" bgcolor="#2A5A8E">
            <asp:Label ID="Label13" runat="server" Text="الايميل" ForeColor="White"></asp:Label>
        </td>
        <td class="style6" style="text-align: right" bgcolor="#CCD9EB">
            <asp:TextBox ID="Txtname" runat="server" style="direction: rtl" Width="250px"></asp:TextBox>
        </td>
        <td style="text-align: right; direction: rtl" bgcolor="#2A5A8E">
            <asp:Label ID="Label9" runat="server" Text="الاسم" ForeColor="White"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="text-align: right" bgcolor="#CCD9EB">
            <asp:TextBox ID="Txtmassage" runat="server" Height="121px" 
                style="direction: rtl" TextMode="MultiLine" Width="500px" MaxLength="255"></asp:TextBox>
        </td>
        <td style="text-align: right; direction: rtl" valign="top" bgcolor="#2A5A8E">
            <asp:Label ID="Label14" runat="server" Text="التعليق" ForeColor="White"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="4" style="text-align: center" bgcolor="#CCD9EB">
            <asp:Button ID="BtnClear" runat="server" onclick="BtnClear_Click" Text="مسح" 
                Width="100px" />
            <asp:Button ID="BtnSend" runat="server" onclick="BtnSend_Click" Text="ارسال" 
                Width="100px" />
        </td>
    </tr>
    <tr>
        <td bgcolor="Yellow" colspan="4" style="text-align: center">
            <asp:Label ID="LblState" runat="server" Font-Size="13pt"></asp:Label>
        </td>
    </tr>
</table>


