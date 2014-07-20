<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EMPAnnualReports.ascx.cs" Inherits="UserControls_AnnualReports" %>
<div id="mdc" runat="server" dir="rtl">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
         Caption="ÇáÊÞÑíÑ ÇáÓäæí" EmptyDataText="áíÓ áß ÈíÇäÇÊ Ýí åÐÇ ÇáÓÌá" HorizontalAlign="Center" AllowPaging="True" ShowFooter="True" OnPageIndexChanging="GridView1_PageIndexChanging">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:TemplateField HeaderText="ÇáÊÞÏíÑ">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ßæÏ_ÇáÊÞÏíÑ") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbl_Takder" runat="server" OnDataBinding="lbl_Takder_DataBinding"
                        Text='<%# Bind("ßæÏ_ÇáÊÞÏíÑ") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:BoundField DataField="ÓäÉ_ÇáÊÞÏíÑ" HeaderText="ÊÇÑíÎ ÇáÊÞÑíÑ" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField HeaderText="ãáÇÍÙÇÊ" >
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