<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EmpAllMotabaa.ascx.cs" Inherits="UserControls_EmpshowHWforAstudent" %>
<div id="Smt" runat="server" dir="rtl">
   <center> &nbsp;</center>
</div>
<asp:GridView ID="gr_StudentMotaba" runat="server" AllowPaging="True" dir="rtl"
    ForeColor="#333333" GridLines="None" HorizontalAlign="Center"  Caption="��� ���������" EmptyDataText="��� �� ������ �� ��� �����" Width="686px" AutoGenerateColumns="False" ShowFooter="True" OnPageIndexChanging="gr_StudentMotaba_PageIndexChanging">
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <Columns>
        <asp:TemplateField HeaderText="��� ������">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("stu_code") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemTemplate>
                <asp:Label ID="lblSTName" runat="server" OnDataBinding="lblSTName_DataBinding" Text='<%# Bind("stu_code") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="add_date" HeaderText="�������" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" >
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:BoundField>
        <asp:BoundField DataField="title" HeaderText="����� ��������" HtmlEncode="False">
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:BoundField>
        <asp:BoundField DataField="notice" HeaderText="������ ������">
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:BoundField>
        <asp:TemplateField HeaderText="������">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("read_code") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            <ItemTemplate>
                <asp:Label ID="lblStatus" runat="server" OnDataBinding="lblStatus_DataBinding" Text='<%# Bind("reply_code") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="reply" HeaderText="�� ��� �����" />
    </Columns>
    <RowStyle BackColor="#EFF3FB" />
    <EditRowStyle BackColor="#2461BF" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <AlternatingRowStyle BackColor="White" />
</asp:GridView>
