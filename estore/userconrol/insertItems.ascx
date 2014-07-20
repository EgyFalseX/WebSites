<%@ Control Language="C#" AutoEventWireup="true" CodeFile="insertItems.ascx.cs" Inherits="userconrol_insertItems" %>
<%@ Register src="fileupload.ascx" tagname="fileupload" tagprefix="uc1" %>
<style type="text/css">
    .style2
    {
        width: 67%;
    }
    .style3
    {
        text-align: center;
    }
    .style4
    {
        width: 335px;
    }
    .style6
    {
        width: 335px;
        direction: rtl;
    }
    .style7
    {
        direction: rtl;
        font-weight: bold;
    }
</style>
<table class="style2">
    <tr>
        <td class="style6">
            <asp:TextBox ID="TxtItem_name" runat="server"></asp:TextBox>
        </td>
        <td class="style7">
            اسم الصنف</td>
    </tr>
    <tr>
        <td class="style6">
            <asp:TextBox ID="txtItemPrice" runat="server"></asp:TextBox>
        </td>
        <td class="style7">
            السعر
        </td>
    </tr>
    <tr>
        <td class="style6">
            <asp:TextBox ID="TxtItemDesc" runat="server" Height="80px" TextMode="MultiLine"></asp:TextBox>
        </td>
        <td class="style7">
            الوصف</td>
    </tr>
    <tr>
        <td class="style6">
            <asp:DropDownList ID="DropCat" runat="server">
            </asp:DropDownList>
        </td>
        <td class="style7">
            الفئة</td>
    </tr>
    <tr>
        <td class="style6">
            <uc1:fileupload ID="fileupload1" runat="server" />
        </td>
        <td class="style7">
            الصورة</td>
    </tr>
    <tr>
        <td class="style6">
            <asp:CheckBox ID="Check_appear" runat="server" Text="يظهر" />
        </td>
        <td class="style7">
            ظهور المنتج</td>
    </tr>
    <tr>
        <td class="style4">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3" colspan="2">
            <asp:Button ID="Button1" runat="server" Height="26px" onclick="Button1_Click" 
                onclientclick="return ProgressBar()" style="font-weight: 700" Text="حفظ" />
        </td>
    </tr>
</table>
