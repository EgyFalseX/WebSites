<%@ Control Language="C#" AutoEventWireup="true" CodeFile="stPayments.ascx.cs" Inherits="UserControls_stPayments" %>
<div id="pdv"  runat="server" dir="rtl">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="no_kasema" HeaderText="رقم القسيمة" />
            <asp:TemplateField HeaderText="نوع التحصيل">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" 
                        Text='<%# Bind("code_type_althcel") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" ondatabinding="Label1_DataBinding" 
                        Text='<%# Bind("code_type_althcel") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="date_althcel" DataFormatString="{0:dd/MM/yyyy}" 
                HeaderText="تاريخ التحصيل" HtmlEncode="False" />
            <asp:BoundField DataField="mab_althcel" HeaderText="مبلغ التحصيل" />
            <asp:BoundField DataField="mab_alksam" HeaderText="مبلغ الخصم" />
            <asp:BoundField DataField="sbab_alksam" HeaderText="سبب الخصم" />
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
</div>