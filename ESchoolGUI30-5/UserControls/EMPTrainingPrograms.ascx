<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EMPTrainingPrograms.ascx.cs" Inherits="UserControls_TrainingPrograms" %>
<div id="mdc" runat="server" dir="rtl">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" Caption="ÇáÈÑÇãÌ ÇáÊÏÑíÈíÉ" OnPreRender="GridView1_PreRender" AllowPaging="True" EmptyDataText="áíÓ áß ÈíÇäÇÊ Ýí åÐÇ ÇáÓÌá" HorizontalAlign="Center" ShowFooter="True" OnPageIndexChanging="GridView1_PageIndexChanging">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:TemplateField HeaderText="ÇáÈÑäÇãÌ">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ßæÏ_ÇáÈÑäÇãÌ") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbl_ProgName" runat="server" OnDataBinding="lbl_ProgName_DataBinding"
                        Text='<%# Bind("ßæÏ_ÇáÈÑäÇãÌ") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:BoundField DataField="ÊÇÑíÎ_ÇáÈÑäÇãÌ" HeaderText="ÇáÊÇÑíÎ" DataFormatString="{0:dd/mm/yyyy}" HtmlEncode="False" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="ÇáÊÞÏíÑ">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ßæÏ_ÇáÊÞÏíÑ") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbl_Takder" runat="server" OnDataBinding="lbl_Takder_DataBinding"
                        Text='<%# Bind("ßæÏ_ÇáÊÞÏíÑ") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ãßÇä ÇáÊÏÑíÈ">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("[place code]") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbl_TPlace" runat="server" OnDataBinding="lbl_TPlace_DataBinding"
                        Text='<%# Bind("[place code]") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ÇáÚÇã">
                <EditItemTemplate>
                    &nbsp;<asp:Label ID="Label1" runat="server"></asp:Label>
                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("code_year") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    &nbsp;<asp:Label ID="Label1" runat="server"></asp:Label>
                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("code_year") %>' />
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