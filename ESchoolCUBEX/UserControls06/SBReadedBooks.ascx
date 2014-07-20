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
        text-align: right;
    }
    .SBReadedBooksstyle3
    {
        height: 55px;
    }
</style>
<div dir="rtl">
    <asp:GridView ID="GridViewReadedBooks" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" ForeColor="#333333" GridLines="None" 
                style="direction: rtl; text-align: right;" Width="600px" 
                EmptyDataText="لا يوجد كتب هنــــــــا" 
        onselectedindexchanged="GridViewReadedBooks_SelectedIndexChanged">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField HeaderText="الرقم العام" DataField="number" />
            <asp:BoundField HeaderText="اسم الكتاب" DataField="name_book" />
            <asp:BoundField HeaderText="تاريخ القراءه" DataField="date" />
            <asp:CommandField SelectText="تفاصيل الكتاب" ShowSelectButton="True" />
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
     </asp:GridView>
     <asp:Panel ID="PanelBookDetials" runat="server" Width="446px" 
        style="text-align: right" Visible="False">
                <uc1:SBBookDetials ID="SBBookDetials1" runat="server" Visible="True" />
            </asp:Panel>
</div>