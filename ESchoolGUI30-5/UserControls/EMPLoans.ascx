<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EMPLoans.ascx.cs" Inherits="UserControls_Loans" %>
<div id="mdc" runat="server" dir="rtl">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" 
         Caption="ÇáÅÚÇÑÇÊ" AllowPaging="True" EmptyDataText="áíÓ áß ÈíÇäÇÊ Ýí åÐÇ ÇáÓÌá" HorizontalAlign="Center" ShowFooter="True" OnPageIndexChanging="GridView1_PageIndexChanging">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:TemplateField HeaderText="äæÚ ÇáÅÚÇÑÉ">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ßæÏ_äæÚ_ÇáÇÚÇÑÉ") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbl_LoanType" runat="server" OnDataBinding="lbl_LoanType_DataBinding"
                        Text='<%# Bind("ßæÏ_äæÚ_ÇáÇÚÇÑÉ") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:BoundField DataField="ÊÇÑíÎ_ÇáÇÚÇÑÉ" HeaderText="ÊÇÑíÎ ÇáÅÚÇÑÉ" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="False" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:BoundField DataField="ÑÞã_ÇáÞÑÇÑ" HeaderText="ÑÞã ÇáÞÑÇÑ" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="ÌåÉ ÇáÅÚÇÑÉ">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ßæÏ_ÌåÉ_ÇáÇÚÇÑÉ") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lbl_GEara" runat="server" OnDataBinding="lbl_GEara_DataBinding" Text='<%# Bind("ßæÏ_ÌåÉ_ÇáÇÚÇÑÉ") %>'></asp:Label>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:TemplateField>
            <asp:BoundField DataField="ÊÇÑíÎ_ÇäÊåÇÁ_ÇáÇÚÇÑå" DataFormatString="{0:dd/MM/yyyy}"
                HeaderText="ÊÇÑíÎ ÅäÊåÇÁ ÇáÇÚÇÑå" HtmlEncode="False" >
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="ÇáÚÇã">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("code_year") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemTemplate>
                    <asp:Label ID="lbl_LoanYear" runat="server" OnDataBinding="lbl_LoanYear_DataBinding"
                        Text='<%# Bind("code_year") %>'></asp:Label>
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