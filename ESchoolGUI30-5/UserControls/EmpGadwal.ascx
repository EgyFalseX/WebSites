<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EmpGadwal.ascx.cs" Inherits="UserControls_EmpGadwal" %>
<div id="EG" dir="rtl" runat="server">
<asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"
    OnRowDataBound="GridView1_RowDataBound">
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <RowStyle BackColor="#EFF3FB" />
    <EditRowStyle BackColor="#2461BF" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <AlternatingRowStyle BackColor="White" />
</asp:GridView></div>
