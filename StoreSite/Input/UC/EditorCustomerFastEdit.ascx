<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditorCustomerFastEdit.ascx.cs" Inherits="EditorCustomerFastEdit" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<style type="text/css">
    .style1
    {
        width: 413px;
    }
    .style2
    {
    }
</style>
<div dir="rtl">
<telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
    <table class="style1" dir="rtl" align="center">
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="BtnBack" runat="server" onclick="BtnBack_Click" Text="عوده" 
                    Width="100px" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" Text="اسم العميل"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtName" runat="server" Width="200px"></asp:TextBox>
                </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:CheckBox ID="CBAll" runat="server" Checked="True" Font-Bold="True" 
                    Text="كل العملاء" />
                </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:Button ID="BtnSearch" runat="server" onclick="BtnSearch_Click" Text="بحث" 
                    Width="100px" />
                </td>
        </tr>
        <tr>
            <td bgcolor="Yellow" colspan="2" style="text-align: center">
                <asp:Label ID="LblState" runat="server" Font-Bold="True" Font-Size="14px"></asp:Label>
            </td>
        </tr>
        </table>
    <p>
    </p>
    <table class="style1" dir="rtl" align="center">
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:GridView ID="GridViewCus" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" EnableModelValidation="True" ForeColor="#333333" 
                    GridLines="None" Width="500px" ShowFooter="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="اسم العميل">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text="<%# Bind('Customer') %>"></asp:Label>
                                <asp:HiddenField ID="HiddenFieldCustomerId" runat="server" 
                                    Value="<%# bind('CustomerId') %>" />
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:Button ID="BtnSave" runat="server" Font-Bold="True" Font-Size="14px" 
                                    onclick="BtnSave_Click" Text="حفظ" Width="100px" />
                            </FooterTemplate>
                            <FooterStyle HorizontalAlign="Center" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="التليفون">
                            <ItemTemplate>
                                <asp:TextBox ID="TxtCustomer_phone" runat="server" 
                                    Text="<%# bind('Customer_phone') %>"></asp:TextBox>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="الموبيل1">
                            <ItemTemplate>
                                <asp:TextBox ID="TxtCustomermobil1" runat="server" 
                                    Text="<%# Bind('Customermobil1') %>"></asp:TextBox>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="الموبيل2">
                            <ItemTemplate>
                                <asp:TextBox ID="TxtCustomermobil2" runat="server" 
                                    Text="<%# Bind('Customermobil2') %>"></asp:TextBox>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</div>