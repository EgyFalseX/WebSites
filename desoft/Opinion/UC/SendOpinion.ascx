<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SendOpinion.ascx.cs" Inherits="SendOpinion" %>
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
        <td class="style3" style="text-align: right">
            <asp:TextBox ID="Txtmail" runat="server" style="direction: rtl" Width="250px"></asp:TextBox>
        </td>
        <td class="style5" style="text-align: right">
            <asp:Label ID="Label13" runat="server" Text="بريد الكتروني"></asp:Label>
        </td>
        <td class="style6" style="text-align: right">
            <asp:TextBox ID="Txtconame" runat="server" style="direction: rtl" Width="250px"></asp:TextBox>
        </td>
        <td style="text-align: right; direction: rtl">
            <asp:Label ID="Label9" runat="server" Text="الاسم"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style3" style="text-align: right" colspan="3">
            <asp:TextBox ID="Txtsefaid" runat="server" style="direction: rtl" Width="300px"></asp:TextBox>
        </td>
        <td style="text-align: right; direction: rtl">
            <asp:Label ID="Label12" runat="server" Text="عنوان الخاطرة"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="text-align: right">
            <asp:TextBox ID="Txtmassage" runat="server" Height="121px" 
                style="direction: rtl" TextMode="MultiLine" Width="500px" MaxLength="255"></asp:TextBox>
        </td>
        <td style="text-align: right; direction: rtl" valign="top">
            <asp:Label ID="Label14" runat="server" Text="النص"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="3" style="text-align: right; direction: rtl;">
            &nbsp;</td>
        <td style="text-align: right; direction: rtl" valign="top">
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="4" style="text-align: center">
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


