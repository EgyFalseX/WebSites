<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Reports.ascx.cs" Inherits="Reports" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>

<style type="text/css">
    .style1
    {
        width: 324px;
    }
    .style2
    {
        width: 10px;
    }
</style>

<asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
<table align="center" class="style1">
    <tr>
        <td colspan="4" style="text-align: center">
                <asp:Button ID="BtnBack" runat="server" onclick="BtnBack_Click" Text="عوده" 
                    Width="100px" />
            </td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:DropDownList ID="DDLInv" runat="server" AutoPostBack="True" 
                onselectedindexchanged="DDL_SelectedIndexChanged" Width="200px">
                <asp:ListItem> </asp:ListItem>
                <asp:ListItem Value="R_material">تقرير الاصناف</asp:ListItem>
                <asp:ListItem Value="R_materialOfCatogry">تقرير الاصناف حسب الفئه</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td style="text-align: center">
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="14px" 
                Text="مخازن"></asp:Label>
        </td>
        <td class="style2" style="text-align: center">
            <asp:DropDownList ID="DDLAcc" runat="server" AutoPostBack="True" 
                onselectedindexchanged="DDL_SelectedIndexChanged" Width="200px">
                <asp:ListItem> </asp:ListItem>
                <asp:ListItem Value="kazna_m">مصروفات الخزينه</asp:ListItem>
                <asp:ListItem Value="kazna_w">ايرادات الخزينه</asp:ListItem>
                <asp:ListItem Value="kazna_y">يومية الخزينه</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td style="text-align: center">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="14px" 
                Text="حسابات"></asp:Label>
        </td>
    </tr>
</table>
<p>
    &nbsp;</p>
<table align="center" class="style1">
    <tr>
        <td>
            <rsweb:ReportViewer ID="ReportViewerStore" runat="server" Font-Names="Verdana" 
                Font-Size="8pt" Height="" InteractiveDeviceInfos="(Collection)" 
                ProcessingMode="Remote" SizeToReportContent="True" 
                WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="">
                <ServerReport ReportServerUrl="" />
            </rsweb:ReportViewer>
        </td>
    </tr>
</table>

