<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EMPHolidays.ascx.cs" Inherits="UserControls_Holidays" %>
<div id="mdc" runat="server" dir="rtl">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
         Caption="��������" OnPreRender="GridView1_PreRender" AllowPaging="True" EmptyDataText="��� �� ������ �� ��� �����" HorizontalAlign="Center" ShowFooter="True" OnPageIndexChanging="GridView1_PageIndexChanging">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:TemplateField HeaderText="��� �������">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("���_���_�������") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbl_HolidayType" runat="server" OnDataBinding="lbl_HolidayType_DataBinding"
                        Text='<%# Bind("���_���_�������") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:BoundField DataField="�����_�������" HeaderText="����� ��� �������" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="�����_������_�������" HeaderText="����� ������ �������" HtmlEncode="False" DataFormatString="{0:dd/MM/yyyy}" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="���_������" HeaderText="��� ������" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="��� �������">
                <EditItemTemplate>
                    <asp:Label ID="Label2" runat="server"></asp:Label><asp:HiddenField ID="HiddenField2"
                        runat="server" Value='<%# Bind("���_���_�������") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                    <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# Bind("���_���_�������") %>' />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="�����">
                <EditItemTemplate>
                    &nbsp;
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                    <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Bind("code_year") %>' />
                </EditItemTemplate>
                <ItemTemplate>
                    &nbsp;
                    <asp:Label ID="Label1" runat="server" OnDataBinding="Label1_DataBinding"></asp:Label>
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