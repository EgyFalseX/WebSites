<%@ Control Language="C#" AutoEventWireup="true" CodeFile="StudentResponsible.ascx.cs" Inherits="UserControls_StudentResponsible" %>
<div id="ano" dir="rtl" runat="server">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" Height="50px" 
        Width="363px">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <RowStyle BackColor="#EFF3FB" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <Fields>
            <asp:BoundField DataField="walealkmrname" HeaderText="اسم ولي الأمر" />
            <asp:TemplateField HeaderText="صلة القرابة">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Bind("saltalkarba_code") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Bind("saltalkarba_code") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" ondatabinding="Label1_DataBinding" 
                        Text='<%# Bind("saltalkarba_code") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="الوظيفة">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("waleaalkamrjob") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("waleaalkamrjob") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("waleaalkamrjob") %>' ondatabinding="Label2_DataBinding"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="waleaalkamraddres" HeaderText="العنوان" />
            <asp:BoundField DataField="waleaalkamr_phone" HeaderText="التليفون" />
        </Fields>
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:DetailsView>
</div>