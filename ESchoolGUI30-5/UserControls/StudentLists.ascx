<%@ Control Language="C#" AutoEventWireup="true" CodeFile="StudentLists.ascx.cs" Inherits="UserControls_StudentLists" %>
<div dir="rtl" runat="server" id="lodv"><asp:GridView ID="GridView1" runat="server" 
        AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
        GridLines="None">
    <RowStyle BackColor="#EFF3FB" />
    <Columns>
        <asp:TemplateField HeaderText="العام الدراسي">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("asase_code") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" ondatabinding="Label1_DataBinding" 
                    Text='<%# Bind("asase_code") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="نظام الدراسة">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" 
                    Text='<%# Bind("nezamaldrasa_code") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("nezamaldrasa_code") %>' ondatabinding="Label2_DataBinding"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="نوع الدراسة">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("code_lan_school") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("code_lan_school") %>' ondatabinding="Label3_DataBinding"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="الصف">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("alsofof_code") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label4" runat="server" Text='<%# Bind("alsofof_code") %>' ondatabinding="Label4_DataBinding"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="الفصل">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("fasl_code") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label5" runat="server" Text='<%# Bind("fasl_code") %>' ondatabinding="Label5_DataBinding"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <EditRowStyle BackColor="#2461BF" />
    <AlternatingRowStyle BackColor="White" />
</asp:GridView></div>
