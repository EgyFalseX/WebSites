<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PersonalDetails.ascx.cs" Inherits="UserControls_PersonalDetails" %>
<div dir ="rtl" id="anydiv" runat="server">
    <asp:DetailsView ID="DetailsView1" runat="server" CellPadding="4" 
        ForeColor="#333333" GridLines="None" Height="50px" Width="379px" 
        AutoGenerateRows="False" ondatabound="DetailsView1_DataBound" 
        onpageindexchanging="DetailsView1_PageIndexChanging">
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <CommandRowStyle BackColor="#D1DDF1" Font-Bold="True" />
        <RowStyle BackColor="#EFF3FB" />
        <FieldHeaderStyle BackColor="#DEE8F5" Font-Bold="True" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <Fields>
            <asp:BoundField DataField="stu_name" HeaderText="اسم الطالب" />
            <asp:BoundField DataField="addres" HeaderText="العنوان" />
            <asp:TemplateField HeaderText="محافظة الميلاد">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Bind("mohaftha_elmelad") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Bind("mohaftha_elmelad") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" ondatabinding="Label1_DataBinding" 
                        Text='<%# Bind("mohaftha_elmelad") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="تاريخ الميلاد">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Parthday") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Parthday") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" 
                        Text='<%# Bind("Parthday","{0:dd/MM/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="الجنسية">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("sex_code") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("sex_code") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" ondatabinding="Label2_DataBinding" 
                        Text='<%# Bind("sex_code") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="النوع">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("code_alnoa") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("code_alnoa") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("code_alnoa") %>' ondatabinding="Label3_DataBinding"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="الديانة">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("dyana_code") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("dyana_code") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("dyana_code") %>' ondatabinding="Label4_DataBinding" ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="stu_qawme" HeaderText="الرقم القومي" />
            <asp:TemplateField HeaderText="وظيفة الوالد">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("fatherjob") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("fatherjob") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("fatherjob") %>' ondatabinding="Label5_DataBinding" ></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:DetailsView>
</div>