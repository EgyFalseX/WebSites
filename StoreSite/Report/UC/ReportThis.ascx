<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ReportThis.ascx.cs" Inherits="ReportThis" %>
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
        <td style="text-align: center">
                <asp:Button ID="BtnBack" runat="server" onclick="BtnBack_Click" Text="عوده" 
                    Width="100px" />
            </td>
    </tr>
    </table>
<p>
</p>
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
