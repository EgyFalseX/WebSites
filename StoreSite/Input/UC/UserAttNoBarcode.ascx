<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserAttNoBarcode.ascx.cs" Inherits="UC_UserAttBarcode" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<style type="text/css">
    .style1
    {
        width: 449px;
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

    .style3
    {
    }
    .style4
    {
        text-align: center;
    }
    .style5
    {
        text-align: center;
        }
</style>

<div dir="rtl">
    <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
    </telerik:RadScriptManager>
    <table class="style1" dir="rtl" align="center">
        <tr>
            <td style="text-align: center" colspan="2">
                <asp:Button ID="BtnBack" runat="server" onclick="BtnBack_Click" Text="عوده" 
                    Width="100px" />
            </td>
        </tr>
        <tr>
            <td class="style5" style="text-align: right">
                <asp:Label ID="LblShift" runat="server" Font-Bold="True" Font-Size="14px"></asp:Label>
            </td>
            <td class="style3" style="text-align: left; direction: ltr;">
                        <asp:Label ID="LblDate" runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Black"></asp:Label>
                    </td>
        </tr>
        <tr>
            <td class="style5" style="text-align: right">
                <asp:DropDownList ID="DDLShift" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="DDLShift_SelectedIndexChanged" Width="200px">
                </asp:DropDownList>
            </td>
            <td class="style3" style="text-align: left; direction: ltr;">
                        <telerik:RadDatePicker ID="RDPDate" Runat="server" Width="200px" 
                            DateInput-EmptyMessage="ادخل تاريخ" MaxDate="3000-01-01" 
                            MinDate="1000-01-01" style="direction: rtl" Culture="en-US">
                            <Calendar>
                                <SpecialDays>
                                    <telerik:RadCalendarDay ItemStyle-CssClass="rcToday" Repeatable="Today">
                                        <ItemStyle CssClass="rcToday" />
                                    </telerik:RadCalendarDay>
                                </SpecialDays>
                            </Calendar>
                            <DateInput InvalidStyleDuration="100" 
                                DateFormat="d/M/yyyy">
                            </DateInput>
                        </telerik:RadDatePicker>
                    </td>
        </tr>
        <tr>
            <td class="style4" colspan="2">
                <asp:Panel ID="Panel1" runat="server" BackImageUrl="~/Images/Barcode.png">
                    <asp:DropDownList ID="DDLEmps" runat="server" 
    AutoPostBack="True" Width="200px" onselectedindexchanged="DDLEmps_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:Button ID="BtnAtt" runat="server" onclick="BtnAtt_Click" Text="تسجيل" 
                        Width="80px" />
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td bgcolor="Yellow" colspan="2" style="text-align: center">
                <asp:Label ID="LblState" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <p>
    </p>
    <asp:Panel ID="Pnl" runat="server" Visible="False">
    <table class="style1" dir="rtl" align="center">
        <tr>
            <td class="style4">
                <asp:Label ID="Label1" runat="server" Text="الاسم" Font-Bold="True" 
                    Font-Size="14px" ForeColor="Black"></asp:Label>
            </td>
            <td class="style3">
                <asp:TextBox ID="TxtName" runat="server" ReadOnly="True" Width="200px"></asp:TextBox>
            </td>
            <td rowspan="4" style="text-align: center; direction: ltr">
                <asp:Image ID="Pic" runat="server" Height="120px" Width="150px" 
                    ImageUrl="~/Images/userSearch.png" />
            </td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label2" runat="server" Text="نوع الحركه" Visible="False" 
                    Font-Bold="True" Font-Size="14px" ForeColor="Black"></asp:Label>
            </td>
            <td class="style3">
                <asp:TextBox ID="TxtHarakaType" runat="server" ReadOnly="True" Width="200px" 
                    Visible="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style4">
                <asp:Label ID="Label3" runat="server" Text="الوظيفه" Font-Bold="True" 
                    Font-Size="14px" ForeColor="Black"></asp:Label>
            </td>
            <td class="style3">
                <asp:TextBox ID="TxtJob" runat="server" ReadOnly="True" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style4">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
        </tr>
    </table>
    </asp:Panel>
    
</div>

