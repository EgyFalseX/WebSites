<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EMPHierarchy.ascx.cs" Inherits="UserControls_StudentMedicalHistory" %>
<div id="mdc" runat="server" dir="rtl" style="text-align: center">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
        onselectedindexchanged="GridView1_SelectedIndexChanged" Caption="التسلسل الوظيفي" EmptyDataText="لا توجد لك بيانات في هذا السجل" OnPreRender="GridView1_PreRender" ShowFooter="True" OnPageIndexChanging="GridView1_PageIndexChanging">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:TemplateField HeaderText="الوظيفة">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("كود_المسمى_الوظيفى") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblJop" runat="server" OnDataBinding="lblJop_DataBinding" Text='<%# Bind("كود_المسمى_الوظيفى") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="التاريخ" HeaderText="التاريخ" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" />
            <asp:BoundField DataField="رقم_القرار" HeaderText="رقم القرار" />
            <asp:BoundField DataField="تاريخ_القرار" HeaderText="تاريخ القرار" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" />
            <asp:BoundField DataField="تاريخ_التنفيذ" HeaderText="تاريخ التنفيذ" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" />
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    </div>