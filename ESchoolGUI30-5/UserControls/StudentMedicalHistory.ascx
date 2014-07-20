<%@ Control Language="C#" AutoEventWireup="true" CodeFile="StudentMedicalHistory.ascx.cs" Inherits="UserControls_StudentMedicalHistory" %>
<div id="mdc" runat="server" dir="rtl">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
        onselectedindexchanged="GridView1_SelectedIndexChanged">
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
            <asp:BoundField DataField="date_elksfe" DataFormatString="{0:dd/MM/yyyy}" 
                HeaderText="تاريخ الكشف" HtmlEncode="False" />
            <asp:BoundField DataField="shkwa_elmareed" HeaderText="شكوى المريض" />
            <asp:BoundField DataField="altshkees" HeaderText="التشخيص" />
            <asp:BoundField DataField="alelag" HeaderText="العلاج" />
            <asp:BoundField DataField="eltwsya_eltbaya" HeaderText="التوصية الطبية" />
            <asp:BoundField DataField="doctor" HeaderText="الطبيب المعالج" />
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
</div>