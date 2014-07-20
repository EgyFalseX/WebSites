<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SBBorrow.ascx.cs" Inherits="UserControl_SBBorrow" %>
<%@ Register src="SBBookDetials.ascx" tagname="SBBookDetials" tagprefix="uc1" %>
<style type="text/css">
    .SBBorrowstyle1
    {
            direction: ltr;
    }
    .SBBorrowstyle1style2
    {
        width: 141px;
    }
    .SBBorrowstyle1style3
    {
        height: 55px;
    }
</style>
<div dir="rtl">
<table dir="rtl" class="SBBorrowstyle1">
    <tr>
        <td class="SBBorrowstyle1style2">
<asp:GridView ID="GridViewBooks" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" ForeColor="#333333" GridLines="None" 
                style="direction: rtl" Width="484px" 
                EmptyDataText="لا يوجد كتب هنــــــــا">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField HeaderText="الرقم العام" />
            <asp:BoundField HeaderText="اسم الكتاب" />
            <asp:BoundField HeaderText="تاريخ الاستعاره" />
            <asp:BoundField HeaderText="تاريخ الارجاع" />
            <asp:BoundField HeaderText="التاريخ الفعلي" />
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
        <td valign="top" align="right" class="SBBorrowstyle1style3">
            <asp:Panel ID="PanelBookDetials" runat="server" Width="429px">
                <uc1:SBBookDetials ID="SBBookDetials1" runat="server" Visible="False" />
            </asp:Panel>
        </td>
    </tr>
</table>
</div>
    
        


    
        
