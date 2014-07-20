<%@ Control Language="C#" AutoEventWireup="true" CodeFile="QryWared.ascx.cs" Inherits="QryWared" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<style type="text/css">
    .style1
    {
        width: 285px;
    }
    .style2
    {
    }
</style>
<div dir="rtl">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table align="center" class="style1" dir="rtl">
        <tr>
            <td class="style2" colspan="2">
                <asp:Button ID="BtnBack" runat="server" onclick="BtnBack_Click" Text="عوده" 
                    Width="100px" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" Text="المورد"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLSup" runat="server" Width="200px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" Text="من تاريخ"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtDateStart" runat="server" Width="200px"></asp:TextBox>
                <cc1:CalendarExtender ID="TxtDateStart_CalendarExtender" runat="server" 
                    Enabled="True" Format="dd MMMM yyyy" TargetControlID="TxtDateStart">
                </cc1:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" Text="الي تاريخ"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtDateEnd" runat="server" Width="200px"></asp:TextBox>
                <cc1:CalendarExtender ID="TxtDateEnd_CalendarExtender" runat="server" 
                    Enabled="True" Format="dd MMMM yyyy" TargetControlID="TxtDateEnd">
                </cc1:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <asp:Button ID="BtnSearch" runat="server" Font-Bold="True" Font-Italic="False" 
                    onclick="BtnSearch_Click" Text="بحث" Width="100px" />
            </td>
        </tr>
        <tr>
            <td bgcolor="Yellow" colspan="2" style="text-align: center">
                <asp:Label ID="LblState" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black"></asp:Label>
            </td>
        </tr>
    </table>
    <p style="text-align: center">
        &nbsp;</p>
    <table align="center" class="style1" dir="rtl">
        <tr>
            <td style="text-align: center">
                <asp:GridView ID="GridViewResult" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" CellPadding="4" EnableModelValidation="True" 
                    ForeColor="#333333" GridLines="None" 
                    onpageindexchanging="GridViewResult_PageIndexChanging" ShowFooter="True" 
                    Width="600px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="Supplier" HeaderText="المورد" />
                        <asp:BoundField DataField="InvIDIn" HeaderText="رقم الفاتوره" />
                        <asp:BoundField DataField="DateIn" DataFormatString="{0:dd MMMM yyyy}" 
                            HeaderText="التاريخ" />
                        <asp:BoundField DataField="Material" FooterText="المجموع" 
                            HeaderText="اسم الصنف" />
                        <asp:BoundField DataField="UnitPriceIn" HeaderText="سعر" />
                        <asp:BoundField DataField="InQty" HeaderText="كميه" />
                        <asp:TemplateField HeaderText="مجموع">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Total") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Total") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                  <%# GetTotal() %>
                            </FooterTemplate>
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
    </table>
</div>