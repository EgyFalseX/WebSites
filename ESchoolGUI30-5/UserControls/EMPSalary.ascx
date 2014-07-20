<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EMPSalary.ascx.cs" Inherits="UserControls_Salary" %>
<div id="salary" runat="server" dir="rtl">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
         Caption="ÇáãÑÊÈ" AllowPaging="True" EmptyDataText="áíÓ áß ÈíÇäÇÊ Ýí åÐÇ ÇáÓÌá" HorizontalAlign="Center" ShowFooter="True" OnPageIndexChanging="GridView1_PageIndexChanging" Width="657px">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:TemplateField HeaderText="ÇáÔåÑ">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("manth_code") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbl_month" runat="server" OnDataBinding="lbl_month_DataBinding" Text='<%# Bind("manth_code") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:BoundField DataField="ÇáÓäå_ÇáãÇáíå" HeaderText="ÇáÓäå ÇáãÇáíå" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="ÊÇÑíÎ_ÇáãÑÊÈ_ÇáÇÓÇÓì" HeaderText="ÊÇÑíÎ ÇáãÑÊÈ ÇáÇÓÇÓì" HtmlEncode="False" DataFormatString="{0:dd/MM/yyyy}" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="ÇíÇã_ÇáÍÖæÑ" HeaderText="ÇíÇã ÇáÍÖæÑ" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="ÇáãÑÊÈ_ÇáÇÓÇÓì" HeaderText="ÇáãÑÊÈ ÇáÇÓÇÓì" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="ÌãáÉ_ÇáÇÓÊÍÞÇÞÇÊ" HeaderText="ÌãáÉ ÇáÇÓÊÍÞÇÞÇÊ" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="ÌãáÉ_ÇáÇÓÊÞØÇÚÇÊ" HeaderText="ÌãáÉ ÇáÇÓÊÞØÇÚÇÊ" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="ÇáÕÇÝì" HeaderText="ÇáÕÇÝì" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
</div>