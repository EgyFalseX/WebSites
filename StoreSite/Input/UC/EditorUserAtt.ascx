<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditorUserAtt.ascx.cs" Inherits="EditorUserAtt" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<style type="text/css">
    .style1
    {
        width: 339px;
    }

.radInput_Default
{
	font:11px arial,tahoma,verdana,sans-serif;
	vertical-align:middle;
}

.radInput_Default
{
	font:11px arial,tahoma,verdana,sans-serif;
	vertical-align:middle;
}

.radEnabledCss_Default 
{
	border:1px solid #626262;
}

.radEnabledCss_Default
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
            <td>
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" Text="الموظفين"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLEmp" runat="server" Width="200px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" Text="الفتره"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLShift" runat="server" Width="200px">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" Text="بداية الحضور"></asp:Label>
            </td>
            <td>
                        <telerik:RadTimePicker ID="RTPhedor_time_Start" Runat="server" 
                            Culture="en-US" Width="200px">
<Calendar UseRowHeadersAsSelectors="True" UseColumnHeadersAsSelectors="True"></Calendar>

<DatePopupButton CssClass="" Visible="False"></DatePopupButton>

<TimeView TimeFormat="HH:mm:ss"><HeaderTemplate>
Time Picker
</HeaderTemplate>
<TimeTemplate>
<a id="A1" runat="server" href="#" onclick="return false"></a>
</TimeTemplate>
</TimeView>

<TimePopupButton CssClass="" Visible="False"></TimePopupButton>

<DateInput Width="" LabelCssClass="" InvalidStyleDuration="100"></DateInput>
                        </telerik:RadTimePicker>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" Text="نهاية الحضور"></asp:Label>
            </td>
            <td>
                        <telerik:RadTimePicker ID="RTPhedor_time_End" Runat="server" 
                            Culture="en-US" Width="200px">
<Calendar UseRowHeadersAsSelectors="True" UseColumnHeadersAsSelectors="True"></Calendar>

<DatePopupButton CssClass="" Visible="False"></DatePopupButton>

<TimeView TimeFormat="HH:mm:ss"><HeaderTemplate>
Time Picker
</HeaderTemplate>
<TimeTemplate>
<a id="A2" runat="server" href="#" onclick="return false"></a>
</TimeTemplate>
</TimeView>

<TimePopupButton CssClass="" Visible="False"></TimePopupButton>

<DateInput Width="" LabelCssClass="" InvalidStyleDuration="100"></DateInput>
                        </telerik:RadTimePicker>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" Text="بداية الانصراف"></asp:Label>
            </td>
            <td>
                        <telerik:RadTimePicker ID="RTPenseraf_time_Start" Runat="server" 
                            Culture="en-US" Width="200px">
<Calendar UseRowHeadersAsSelectors="True" UseColumnHeadersAsSelectors="True"></Calendar>

<DatePopupButton CssClass="" Visible="False"></DatePopupButton>

<TimeView TimeFormat="HH:mm:ss"><HeaderTemplate>
Time Picker
</HeaderTemplate>
<TimeTemplate>
<a id="A3" runat="server" href="#" onclick="return false"></a>
</TimeTemplate>
</TimeView>

<TimePopupButton CssClass="" Visible="False"></TimePopupButton>

<DateInput Width="" LabelCssClass="" InvalidStyleDuration="100"></DateInput>
                        </telerik:RadTimePicker>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" Text="نهاية الانصراف"></asp:Label>
            </td>
            <td>
                        <telerik:RadTimePicker ID="RTPenseraf_time_End" Runat="server" 
                            Culture="en-US" Width="200px">
<Calendar UseRowHeadersAsSelectors="True" UseColumnHeadersAsSelectors="True"></Calendar>

<DatePopupButton CssClass="" Visible="False"></DatePopupButton>

<TimeView TimeFormat="HH:mm:ss"><HeaderTemplate>
Time Picker
</HeaderTemplate>
<TimeTemplate>
<a id="A4" runat="server" href="#" onclick="return false"></a>
</TimeTemplate>
</TimeView>

<TimePopupButton CssClass="" Visible="False"></TimePopupButton>

<DateInput Width="" LabelCssClass="" InvalidStyleDuration="100"></DateInput>
                        </telerik:RadTimePicker>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                            <asp:ImageButton ID="BtnAdd" runat="server" Height="32px" 
                                ImageUrl="~/Images/Add.png" onclick="BtnAdd_Click" 
                    Width="32px" />
            </td>
        </tr>
    </table>
    <p>
    </p>
    <table align="center" class="style1" dir="rtl">
        <tr>
            <td bgcolor="Yellow" style="text-align: center">
                <asp:Label ID="LblState" runat="server" Font-Bold="True" Font-Size="14px"></asp:Label>
            </td>
        </tr>
    </table>
    <p>
    </p>
    <table align="center" class="style1" dir="rtl">
        <tr>
            <td>
                <asp:GridView ID="GridViewEmpShift" runat="server" AutoGenerateColumns="False" 
                    CellPadding="4" EnableModelValidation="True" ForeColor="#333333" 
                    GridLines="None" Width="600px">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="shift" HeaderText="الفتره">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="EmpName" HeaderText="اسم الموظف">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="hedor_time_Start" HeaderText="بداية الحضور" 
                            DataFormatString="{0:T}">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="hedor_time_End" HeaderText="نهاية الحضور" 
                            DataFormatString="{0:T}">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="enseraf_time_Start" HeaderText="بداية الانصراف" 
                            DataFormatString="{0:T}">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="enseraf_time_End" HeaderText="نهاية الانصراف" 
                            DataFormatString="{0:T}">
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="حــــذف">
                            <ItemTemplate>
                                <asp:ImageButton ID="BtnDelete" runat="server" Height="32px" 
                                    ImageUrl="~/Images/Delete.png" onclick="BtnDelete_Click" 
                                    onclientclick="javascript: return confirm('هل انت متاكد ؟')" Width="32px" />
                                <asp:HiddenField ID="HiddenFieldEmpID" runat="server" 
                                    Value='<%# bind("EmpID") %>' />
                                <asp:HiddenField ID="HiddenFieldshift_code" runat="server" 
                                    Value='<%# bind("shift_code") %>' />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
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