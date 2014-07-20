<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SLBookScreen.ascx.cs" Inherits="UserControl_SLBookScreen" %>
<div dir="rtl">
    <asp:GridView ID="GridViewBooks" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" EmptyDataText="لا يوجد كتب في هذا القســم" ForeColor="#333333" 
        GridLines="None">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:ImageField DataAlternateTextField="BookInfo" DataImageUrlField="BookImage" 
                HeaderText="الغــلاف">
            </asp:ImageField>
            <asp:BoundField DataField="BookName" HeaderText="اسم الكتــاب" />
            <asp:BoundField DataField="BookOwner" HeaderText="المؤلـــف" />
            <asp:HyperLinkField DataNavigateUrlFields="BookLink" Text="حفظ الكتـــاب" />
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
</div>