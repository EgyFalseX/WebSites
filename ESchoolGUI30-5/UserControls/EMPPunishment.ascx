<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EMPPunishment.ascx.cs" Inherits="UserControls_Algzaat" %>
<div id="mdc" runat="server" dir="rtl">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
         Caption="ÇáÌÒÇÁÇÊ" AllowPaging="True" EmptyDataText="áíÓ áß ÈíÇäÇÊ Ýí åÐÇ ÇáÓÌá" HorizontalAlign="Center" ShowFooter="True" OnPageIndexChanging="GridView1_PageIndexChanging">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:TemplateField HeaderText="ÇÓã ÇáÌÒÇÁ">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ßæÏ_ÃÓã_ÇáÌÒÇÁ") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbl_Punishment" runat="server" OnDataBinding="lbl_Punishment_DataBinding"
                        Text='<%# Bind("ßæÏ_ÃÓã_ÇáÌÒÇÁ") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:BoundField DataField="ÊÇÑíÎ_ÇáÌÒÇÁ" HeaderText="ÊÇÑíÎ ÇáÌÒÇÁ" DataFormatString="{0:dd/mm/yyyy}" HtmlEncode="False" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="ÓÈÈ_ÇáÌÒÇÁ" HeaderText="ÓÈÈ ÇáÌÒÇÁ" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="ÚÏÏ_ÇáÇíÇã" HeaderText="ÚÏÏ ÇáÃíÇã" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="ÇáÚÇã">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("code_year") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" OnDataBinding="Label1_DataBinding" Text='<%# Bind("code_year") %>'></asp:Label>
                </ItemTemplate>
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