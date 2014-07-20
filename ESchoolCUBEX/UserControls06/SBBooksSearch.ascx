<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SBBooksSearch.ascx.cs" Inherits="UserControl_SBBooksSearch" %>

<%@ Register src="SBBookDetials.ascx" tagname="SBBookDetials" tagprefix="uc1" %>

<style type="text/css">
    .SBBooksSearchstyle1 {
        width: 56%;
        height: 485px;
    }
    .SBBooksSearchstyle2
    {        text-align: center;
    }
    .SBBooksSearchstyle3
    {
        width: 139px;
    }
    .SBBookDetialsstyle1
    {
        width: 27%;
    }
    .SBBookDetialsstylestyle5
    {
        width: 90px;
    }
    .SBBookDetialsstyle2
    {
        height: 23px;
        text-align: right;
    }
    .SBBookDetialsstylestyle6
    {
        height: 23px;
        width: 90px;
    }
    .style1
    {
        width: 293px;
    }
</style>
<div dir="rtl">

    <table dir="rtl" class="SBBooksSearchstyle1">
        <tr>
            <td class="SBBooksSearchstyle3">
                <asp:RadioButtonList ID="RBLBookSearch" runat="server">
                    <asp:ListItem Selected="True" Value="1">اسم الكتاب</asp:ListItem>
                    <asp:ListItem Value="2">رقم الكتاب</asp:ListItem>
                    <asp:ListItem Value="3">مؤلف الكتاب</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td valign ="top">
                <asp:TextBox ID="TxtSearchText" runat="server" Width="240px" TabIndex="1"></asp:TextBox>
                <asp:CheckBox ID="CBAllBooks" runat="server" 
                    oncheckedchanged="CBAllBooks_CheckedChanged" Text="عرض الكل" 
                    TabIndex="2" />
                <br />
                <asp:Button ID="BtnSearch" runat="server" Text="بحـــث" Width="50px" 
                    onclick="BtnSearch_Click" TabIndex="3" />
                <asp:Label ID="LblError" runat="server" ForeColor="Red" Text="كلمة البحث فارغة" 
                    Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td valign="top" class="SBBooksSearchstyle3">
                <asp:Label ID="Label1" runat="server" Text="النتائج"></asp:Label>
            </td>
            <td >
                <asp:ListBox ID="LBBooksResult" runat="server" Height="176px" Width="240px" 
                    AutoPostBack="True" 
                    onselectedindexchanged="LBBooksResult_SelectedIndexChanged" TabIndex="4">
                </asp:ListBox>
            </td>
        </tr>
        <tr>
            <td class="SBBooksSearchstyle2" colspan="2">
                <uc1:SBBookDetials ID="SBBookDetials1" runat="server" />
            </td>
        </tr>
        </table>

</div>

