<%@ Control Language="C#" AutoEventWireup="true" CodeFile="StudentCourses.ascx.cs" Inherits="UserControls_StudentCourses" %>
<div id="andv" dir="rtl" runat="server">
    <br />
    <asp:CheckBox ID="CheckBox1" runat="server" Text="جدول يوم" TextAlign="Right" 
        AutoPostBack="True" oncheckedchanged="CheckBox1_CheckedChanged" />
&nbsp;
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Visible="false" 
        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
    </asp:DropDownList>
    <br />
<asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
    GridLines="None" onrowdatabound="GridView1_RowDataBound" Visible="true" 
       >
    <RowStyle BackColor="#EFF3FB" />
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#2461BF" />
    <AlternatingRowStyle BackColor="White" />
</asp:GridView></div>
