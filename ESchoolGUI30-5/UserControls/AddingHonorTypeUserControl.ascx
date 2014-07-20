<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddingHonorTypeUserControl.ascx.cs" Inherits="NewUserControl_AddingHonorTypeUserControl" %>
<style type="text/css">
    .style1
    {
        width: 494px;
    }
    .style2
    {
        width: 239px;
    }
    .style3
    {
        width: 247px;
    }
</style>
<div style="direction: rtl">
    <table class="style1">
        <tr>
            <td class="style2">
                انواع لوحة التميز</td>
            <td class="style3">
                <asp:DropDownList ID="DDLAllHonorTypes" runat="server" Width="190px">
                </asp:DropDownList>
            </td>
            <td class="style1">
                <asp:Button ID="BtnDeleteType" runat="server" onclick="BtnDeleteType_Click" 
                    Text="حــذف" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" Text="اسم النوع"></asp:Label>
            </td>
            <td class="style3">
                <asp:TextBox ID="TxtHonorTypeName" runat="server" Width="190px"></asp:TextBox>
            </td>
            <td class="style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label3" runat="server" Text="خاص بــ"></asp:Label>
            </td>
            <td class="style3">
                <asp:DropDownList ID="DDLDependent" runat="server" Height="16px" Width="190px">
                    <asp:ListItem Value="1">الطالب</asp:ListItem>
                    <asp:ListItem Value="2">المعلم</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td class="style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                <asp:Button ID="BtnAddHonorType" runat="server" onclick="BtnAddHonorType_Click" 
                    Text="اضافــه" />
            </td>
            <td class="style1">
                &nbsp;</td>
        </tr>
    </table>
</div>
<p style="direction: rtl">
    &nbsp;</p>
