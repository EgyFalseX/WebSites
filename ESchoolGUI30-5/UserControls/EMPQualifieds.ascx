<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EMPQualifieds.ascx.cs" Inherits="UserControls_Qualifieds" %>
<div id="mdc" runat="server" dir="rtl">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
         Caption="ÇáãÄåáÇÊ" AllowPaging="True" EmptyDataText="áíÓ áß ÈíÇäÇÊ Ýí åÐÇ ÇáÓÌá" HorizontalAlign="Center" ShowFooter="True" OnPageIndexChanging="GridView1_PageIndexChanging">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="ãÓáÓá" 
                HeaderText="ã" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="ÇáãÄåá ÚäÏ ÇáÊÚííä">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ßæÏÇáãÄåá") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbl_Qualify" runat="server" OnDataBinding="lbl_Qualify_DataBinding"
                        Text='<%# Bind("ßæÏÇáãÄåá") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:BoundField DataField="ÊÇÑíÎ_ÇáãÄåá" HeaderText="ÊÇÑíÎ ÇáãÄåá" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="ÊÎÕÕ_ÇáãÄåá" HeaderText="ÊÎÕÕ ÇáãÄåá" >
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