<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditorSerial.ascx.cs" Inherits="UC_EditorSerial" %>
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
                    ForeColor="Black" Text="الفواتير"></asp:Label>
            </td>
            <td>
                <telerik:RadComboBox ID="RadComboBoxBillz" Runat="server" Skin="Sunset" 
                    LoadingMessage="تحميل..." Width="257px" 
                    onselectedindexchanged="RadComboBoxBillz_SelectedIndexChanged" 
                    AutoPostBack="True" MarkFirstMatch="True">
                </telerik:RadComboBox>
                </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" Text="الاصناف"></asp:Label>
            </td>
            <td>
                <telerik:RadComboBox ID="RadComboBoxItems" Runat="server" Skin="Sunset" 
                    LoadingMessage="تحميل..." Width="257px" 
                    onselectedindexchanged="RadComboBoxItems_SelectedIndexChanged" 
                    AutoPostBack="True" MarkFirstMatch="True">
                </telerik:RadComboBox>
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
                <asp:GridView ID="GridViewSerial" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" EnableModelValidation="True" ForeColor="#333333" 
                    GridLines="None" Width="500px" ShowFooter="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="InnerSerial" HeaderText="السريال الخاص">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="سريال المصنع">
                            <ItemTemplate>
                                <asp:TextBox ID="TxtFactorySerial" runat="server" 
                                    Text="<%# bind('FactorySerial') %>"></asp:TextBox>
                                <asp:HiddenField ID="HiddenFieldSerId" runat="server" 
                                    Value="<%# bind('SerId') %>" />
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:Button ID="BtnSave" runat="server" Font-Bold="True" Font-Size="14px" 
                                    onclick="BtnSave_Click" Text="حفظ" Width="100px" />
                            </FooterTemplate>
                            <FooterStyle HorizontalAlign="Center" />
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