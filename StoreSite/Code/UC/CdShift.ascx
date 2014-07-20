<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CdShift.ascx.cs" Inherits="UC_EditorSupplier" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<style type="text/css">
    .style1
    {
        width: 432px;
    }
    .style2
    {
    }

.radInput_Default
{
	font:11px arial,tahoma,verdana,sans-serif;
	vertical-align:middle;
}

.radReadOnlyCss_Default
{
	color:gray;
	background:#eee;
	border:1px solid #aeaeae;
}

.radReadOnlyCss_Default
{
	font:11px arial,tahoma,verdana,sans-serif;
	padding:2px 0 2px 1px;
	color:#333;
}

</style>
<div dir="rtl">
<telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
    <table align="center" class="style1" dir="rtl">
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="BtnBack" runat="server" onclick="BtnBack_Click" Text="عوده" 
                    Width="100px" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="14px" 
                    Text="اسم الفتره" ForeColor="Black"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtName" runat="server" Width="200px" MaxLength="15"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="14px" 
                    Text="بداية الفتره" ForeColor="Black"></asp:Label>
            </td>
            <td>
                        <telerik:RadTimePicker ID="RadTimePickerAddStart" Runat="server" 
                            Culture="en-US" Width="200px">
<Calendar UseRowHeadersAsSelectors="True" UseColumnHeadersAsSelectors="True"></Calendar>

<DatePopupButton CssClass="" Visible="False"></DatePopupButton>

<TimeView TimeFormat="HH:mm:ss"><HeaderTemplate>
Time Picker
</HeaderTemplate>
<TimeTemplate>
<a runat="server" href="#" onclick="return false"></a>
</TimeTemplate>
</TimeView>

<TimePopupButton CssClass="" Visible="False"></TimePopupButton>

<DateInput Width="" LabelCssClass="" InvalidStyleDuration="100"></DateInput>
                        </telerik:RadTimePicker>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="14px" 
                    Text="نهاية الفتره" ForeColor="Black"></asp:Label>
            </td>
            <td>
                <telerik:RadTimePicker ID="RadTimePickerAddEnd" Runat="server" Culture="en-US" 
                    Width="200px">
                <Calendar UseRowHeadersAsSelectors="True" UseColumnHeadersAsSelectors="True"></Calendar>
                <DatePopupButton CssClass="" Visible="False"></DatePopupButton>
                <TimeView TimeFormat="HH:mm:ss"><HeaderTemplate>
                Time Picker
                </HeaderTemplate>
                <TimeTemplate>
                <a runat="server" href="#" onclick="return false"></a>
                </TimeTemplate>
                </TimeView>
                <TimePopupButton CssClass="" Visible="False"></TimePopupButton>
                <DateInput Width="" LabelCssClass="" InvalidStyleDuration="100"></DateInput>
                </telerik:RadTimePicker>
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                            <asp:ImageButton ID="BtnAdd" runat="server" Height="32px" 
                                ImageUrl="~/Images/Add.png" onclick="BtnAdd_Click" 
                    Width="32px" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td bgcolor="Yellow" style="text-align: center">
                <asp:Label ID="LblState" runat="server" Font-Bold="True" Font-Size="14px"></asp:Label>
            </td>
        </tr>
    </table>
    <p>
    </p>
    <table align="center" class="style1" dir="rtl">
        <tr>
            <td class="style2">
                <asp:GridView ID="GridViewHarakaType" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" EnableModelValidation="True" Font-Bold="True" Font-Size="14px" 
                    ForeColor="#333333" GridLines="None" Width="417px" 
                    EmptyDataText="لا يوجد انواع" TabIndex="2">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="اسم نوع الحركه">
                            <ItemTemplate>
                                <asp:TextBox ID="TxtEditItem" runat="server" MaxLength="15" 
                                    Text='<%# Bind("shift") %>' Width="100px"></asp:TextBox>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="بداية الفتره">
                            <ItemTemplate>
                                <asp:TextBox ID="TxtStart" runat="server" Text='<%# bind("shift_Start") %>' 
                                    Width="100px"></asp:TextBox>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="نهاية الفتره">
                            <ItemTemplate>
                                <asp:TextBox ID="TxtEnd" runat="server" Text='<%# bind("shift_End") %>' 
                                    Width="100px"></asp:TextBox>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="تعديل">
                            <ItemTemplate>
                                <asp:ImageButton ID="BtnUpdate" runat="server" Height="32px" 
                                    ImageUrl="~/Images/Update.png" onclick="BtnUpdate_Click" 
                                    onclientclick="javascript: return confirm('هل انت متاكد ؟')" Width="32px" />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="حــذف">
                            <ItemTemplate>
                                <asp:ImageButton ID="BtnDelete" runat="server" Height="32px" 
                                    ImageUrl="~/Images/Delete.png" onclick="BtnDelete_Click" 
                                    onclientclick="javascript: return confirm('هل انت متاكد ؟')" Width="32px" />
                                <asp:HiddenField ID="HiddenFieldshift_code" runat="server" 
                                    Value='<%# bind("shift_code") %>' />
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
    </table>
</div>