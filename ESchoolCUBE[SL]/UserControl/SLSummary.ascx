<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SLSummary.ascx.cs" Inherits="UserControl_SLSummary" %>
<style type="text/css">
    .stylesummary1
    {
        width:  163px;
    }
    .stylesummary2
    {
        width: auto;
    }
    .style1
    {
        width: 108px;
    }
</style>
<div dir="rtl">
<table class="stylesummary1" dir="rtl">
    <tr>
        <td colspan="2" style="text-align: center">
            <asp:Label ID="Label1" runat="server" Text="مجمل الاقسام و الدروس"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style1">
            <asp:Label ID="Label2" runat="server" Text="عدد الافسام"></asp:Label>
        </td>
        <td>
            <asp:Label ID="LblCatCount" runat="server" Text="00"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style1">
            <asp:Label ID="Label3" runat="server" Text="عدد الدروس"></asp:Label>
        </td>
        <td>
            <asp:Label ID="LblBookCount" runat="server" Text="00"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style1">
            <asp:Label ID="LblStatus" runat="server" ForeColor="Red" Text="Status" 
                Visible="False"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</div>