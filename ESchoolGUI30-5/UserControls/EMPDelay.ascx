<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EMPDelay.ascx.cs" Inherits="UserControls_Delay" %>
<div id="mdc" runat="server" dir="rtl" style="text-align: center">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
         Caption="ÇáÊÃÎíÑ" AllowPaging="True" EmptyDataText="áíÓ áß ÈíÇäÇÊ Ýí åÐÇ ÇáÓÌá" HorizontalAlign="Center" ShowFooter="True" OnPageIndexChanging="GridView1_PageIndexChanging">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="ÊÇÑíÎ_Çáíæã" HeaderText="ÊÇÑíÎ ÇáÊÃÎíÑ" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="ÓÇÚÉ_ÇáÍÖæÑ" HeaderText="ÓÇÚÉ ÇáÍÖæÑ" DataFormatString="{0:hh:mm}" HtmlEncode="False" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="ÇáÓÇÚÉ ÇáãÞÑÑÉ ááÍÖæÑ">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ÇáÓÇÚÉ_ÇáãÞÑÑå_ááÍÖæÑ") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ÇáÓÇÚÉ_ÇáãÞÑÑå_ááÍÖæÑ", "{0:hh:mm}") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:BoundField DataField="ÓÈÈ_ÇáÊÃÎíÑ" HeaderText="ÓÈÈ ÇáÊÃÎíÑ" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="ÇáÚÇã">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("code_year") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblYear" runat="server" OnDataBinding="lblYear_DataBinding" Text='<%# Bind("code_year") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
</div>