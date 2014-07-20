<%@ Control Language="C#" AutoEventWireup="true" CodeFile="stPayments.ascx.cs" Inherits="UserControls_stPayments" %>
<style type="text/css">
    .paymstyle1
    {
        width: 505px;
    }
    .paymstyle2
    {        text-align: right;
    }
    .paymstyle3
    {
        height: 6px;
    }
    .paymst
    {
        text-align: left;
    }
</style>
<div id="pdv"  runat="server" dir="rtl">
    <table cellpadding="0" cellspacing="0" class="paymstyle1">
        <tr>
            <td class="paymstyle2">
                <asp:Label ID="Label3" runat="server" style="font-weight: 700" 
                    Text="المصروفات المقررة :"></asp:Label>
            </td>
            <td style="text-align: center">
                <asp:Label ID="lblmasrofat" runat="server" 
                    style="font-weight: 700; color: #000099"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="paymstyle3" colspan="2">
                <hr /></td>
        </tr>
        <tr>
            <td class="paymstyle2">
                <asp:Label ID="Label4" runat="server" style="font-weight: 700" 
                    Text="دفعات السداد والخصم"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="paymst" colspan="2">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" 
        Width="392px">
        <RowStyle BackColor="#EFF3FB" />
        <Columns>
            <asp:BoundField DataField="date_althcel" DataFormatString="{0:dd/MM/yyyy}" 
                HeaderText="تاريخ التحصيل" HtmlEncode="False" FooterText="الاجمالى" />
            <asp:TemplateField HeaderText="مبلغ التحصيل">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("mab_althcel") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("mab_althcel") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:Label ID="lbl_payed" runat="server" Text='<%# getpayed() %>' ></asp:Label>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="مبلغ الخصم">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("mab_alksam") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Label ID="lbldiscount" runat="server" Text='<%# getdiscount() %>'></asp:Label>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("mab_alksam") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="sbab_alksam" HeaderText="سبب الخصم" />
            
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerTemplate>
          
        </PagerTemplate>
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#2461BF" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="paymstyle2" colspan="2">
               <hr /></td>
        </tr>
        <tr>
            <td class="paymstyle2">
                <asp:Label ID="Label5" runat="server" style="font-weight: 700" 
                    Text="الباقى :"></asp:Label>
            </td>
            <td style="text-align: center">
                <asp:Label ID="lblrest" runat="server" style="font-weight: 700; color: #000099"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="paymstyle2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</div>