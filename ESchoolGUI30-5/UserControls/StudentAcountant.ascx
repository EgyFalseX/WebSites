<%@ Control Language="C#" AutoEventWireup="true" CodeFile="StudentAcountant.ascx.cs" Inherits="UserControls_StudentAcountant" %>
<div id="andys" runat="server" dir="rtl">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" Height="50px" 
        onpageindexchanging="DetailsView1_PageIndexChanging" Width="125px">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <RowStyle BackColor="#EFF3FB" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <Fields>
            <asp:BoundField DataField="amsafofat" HeaderText="المصروفات المقررة" HtmlEncode="False" />
        </Fields>
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:DetailsView>
</div>