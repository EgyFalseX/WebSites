<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SLBookScreen.ascx.cs" Inherits="UserControl_SLBookScreen" %>
<div dir="rtl">
    <asp:GridView ID="GridViewBooks" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" EmptyDataText="لا يوجد كتب في هذا القســم" ForeColor="#333333" 
        GridLines="None" Width="443px" 
        onselectedindexchanging="GridViewBooks_SelectedIndexChanging">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:ImageField DataAlternateTextField="BookInfo" DataImageUrlField="BookImage" 
                HeaderText="الغــلاف">
            </asp:ImageField>
            <asp:BoundField DataField="BookName" HeaderText="اسم الدرس" />
            <asp:BoundField DataField="DownloadNo" HeaderText="مرات التحميل" />
            <asp:BoundField DataField="BookOwner" HeaderText="المؤلـــف" Visible="False" />
            <asp:CommandField HeaderText="حمل الدرس" SelectText="تحميــــــل" 
                ShowSelectButton="True" />
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
</div>