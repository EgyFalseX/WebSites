<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SBReadedBooks.ascx.cs" Inherits="UserControl_SBReadedBooks" %>
<%@ Register src="SBBookDetials.ascx" tagname="SBBookDetials" tagprefix="uc1" %>
<style type="text/css">
    .SBReadedBooksstyle1
    {
            direction: ltr;
    }
    .SBReadedBooksstyle2
    {
        width: 141px;
    }
    .SBReadedBooksstyle3
    {
        height: 55px;
    }
</style>
<div dir="rtl">
<table dir="rtl" class="SBReadedBooksstyle1">
    <tr>
        <td class="SBReadedBooksstyle2">
<asp:GridView ID="GridViewReadedBooks" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" ForeColor="#333333" GridLines="None" 
                style="direction: rtl" Width="476px" 
                EmptyDataText="لا يوجد كتب هنــــــــا">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField HeaderText="الرقم العام" DataField="number" />
            <asp:BoundField HeaderText="اسم الكتاب" DataField="name_book" />
            <asp:BoundField HeaderText="تاريخ القراءه" DataField="date" />
            <asp:ButtonField Text="تفاصيل الكتاب" />
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
        </td>
    </tr>
    <tr>
        <td valign="top" align="right" class="SBReadedBooksstyle3">
            <asp:Panel ID="PanelBookDetials" runat="server" Width="446px">
                <uc1:SBBookDetials ID="SBBookDetials1" runat="server" Visible="False" />
            </asp:Panel>
        </td>
    </tr>
</table>
</div>