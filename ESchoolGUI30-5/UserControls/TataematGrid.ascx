<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TataematGrid.ascx.cs" Inherits="TataematGride" %>
<asp:GridView ID="GridViewTataem" runat="server" AutoGenerateColumns="False" 
    BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
    CellPadding="3" EmptyDataText="الطالب ليس له سجل في هذا القسم" 
    GridLines="Vertical" style="direction: rtl" AllowPaging="True" 
    onpageindexchanging="GridViewTataem_PageIndexChanging">
    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
    <Columns>
        <asp:BoundField DataField="stu_code" HeaderText="م" />
        <asp:BoundField DataField="type_eltataem" HeaderText="نوع التطعيـــــم" />
        <asp:BoundField DataField="date_eltataem" DataFormatString="{0:yyyy/MM/dd}" 
            HeaderText="التاريـــــخ" />
    </Columns>
    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Right" />
    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
    <AlternatingRowStyle BackColor="#DCDCDC" />
</asp:GridView>
