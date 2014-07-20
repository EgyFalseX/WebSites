<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SBBookDetials.ascx.cs" Inherits="UserControl_SBBookDetials" %>
<style type="text/css">
    .SBBookDetialsstyle1
    {
        width: 43%;
    }
    .SBBookDetialsstyle2
    {
        height: 23px;
        text-align: right;
    }
    .SBBookDetialsstyle3
    {
        width: 73px;
    }
    .SBBookDetialsstyle4
    {
        height: 23px;
        width: 73px;
    }
    .SBBookDetialsstylestyle5
    {
        width: 90px;
    }
    .SBBookDetialsstylestyle6
    {
        height: 23px;
        }
    .style1
    {
        width: 121px;
    }
</style>
<div dir="rtl">

    <table dir = "rtl" class="SBBookDetialsstyle1">
        <tr>
            <td class="style1">
                <asp:Label ID="Label1" runat="server" Text="اسم الكتاب"></asp:Label>
            </td>
            <td>
                <asp:Label ID="LblBookName" runat="server" Text="لاشيء"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label2" runat="server" Text="لغة الطباعة"></asp:Label>
            </td>
            <td>
                <asp:Label ID="LblBookLang" runat="server" Text="لاشيء"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label3" runat="server" Text="الفرع"></asp:Label>
            </td>
            <td>
                <asp:Label ID="LblBookBran" runat="server" Text="لاشيء"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label4" runat="server" Text="التخصص"></asp:Label>
            </td>
            <td>
                <asp:Label ID="LblBookDep" runat="server" Text="لاشيء"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label5" runat="server" Text="الناشر"></asp:Label>
            </td>
            <td>
                <asp:Label ID="LblBookPre" runat="server" Text="لاشيء"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label6" runat="server" Text="المؤلف"></asp:Label>
            </td>
            <td class="SBBookDetialsstyle2">
                <asp:Label ID="LblBookOwner" runat="server" Text="لاشيء"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="SBBookDetialsstylestyle6" colspan="2">
                <asp:Button ID="BtnReserve" runat="server" Text="طلب استعارة هذا الكتاب" 
                    onclick="BtnReserve_Click" />
                <br />
                <asp:Label ID="LblStatus" runat="server" Text="What's up" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>

</div>
