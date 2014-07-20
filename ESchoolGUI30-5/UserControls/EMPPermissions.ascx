<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EMPPermissions.ascx.cs" Inherits="UserControls_Permissions" %>
<div id="mdc" runat="server" dir="rtl">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
         Caption="ÇáÅÓÊÆÐÇä" AllowPaging="True" EmptyDataText="áíÓ áß ÓÌá Ýí åÐÇ ÇáÓÌá" HorizontalAlign="Center" ShowFooter="True" OnPageIndexChanging="GridView1_PageIndexChanging">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="ÊÇÑíÎ_Çáíæã" HeaderText="ÊÇÑíÎ ÇáÅÓÊÃÐÇä" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="ÓÇÚÉ_ÇáÎÑæÌ" HeaderText="ÓÇÚÉ ÇáÎÑæÌ" DataFormatString="{0:hh:mm}" HtmlEncode="False" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="äæÚ ÇáÅÓÊÃÐÇä">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("äæÚ_ÇáÇÐä") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblPK" runat="server"  Text='<%# Bind("äæÚ_ÇáÇÐä") %>' OnDataBinding="lblPK_DataBinding"></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:BoundField DataField="ãßÇä_ÇáÇÓÊÃÐÇä" HeaderText="ãßÇä  ÇáÅÐä" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="ÓÇÚÉ_ÇáÚæÏå" DataFormatString="{0:hh:mm}" HeaderText="ÓÇÚÉ ÇáÚæÏå" HtmlEncode="False" >
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