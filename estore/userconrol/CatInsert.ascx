<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CatInsert.ascx.cs" Inherits="userconrol_CatInsert" %>
<style type="text/css">
    .style1
    {
        width: 46%;
    }
</style>
<table class="style1">
    <tr>
        <td style="direction: rtl">
            <asp:TextBox ID="txt_CatName" runat="server"></asp:TextBox>
        </td>
        <td>
            <b>اسم الفئة</b></td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="2" style="text-align: center">
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                style="font-weight: 700" Text="حفظ" />
        </td>
    </tr>
</table>
