<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SyudentAbsence.ascx.cs" Inherits="UserControls_SyudentAbsence" %>
<div id="abc" dir="rtl" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
        onrowdatabound="GridView1_RowDataBound" 
        onselectedindexchanged="GridView1_SelectedIndexChanged">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:TemplateField HeaderText="العام الدراسي">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("asase_code") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" AccessKey='<%# Bind("asase_code") %>' 
                        ondatabinding="Label1_DataBinding" Text='<%# Bind("asase_code") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="تفاصيل الغياب">
                <ItemTemplate>
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" ForeColor="#333333" GridLines="None">
                        <RowStyle BackColor="#EFF3FB" />
                        <Columns>
                            <asp:TemplateField HeaderText="نوع الغياب">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("eyab_code") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" ondatabinding="Label1_DataBinding1" 
                                        Text='<%# Bind("eyab_code") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="بداية الغياب">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("eyab_date_from") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" 
                                        Text='<%# Bind("eyab_date_from", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="نهاية الغياب">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("eyab_date_to") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" 
                                        Text='<%# Bind("eyab_date_to", "{0:dd/MM/yyyy}") %>'></asp:Label>
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