<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CommunicationGrid.ascx.cs" Inherits="UC_CommunicationGrid" %>
<style type="text/css">
    .style1
    {
        width: 100px;
    }
</style>
<table align="center" class="style1">
    <tr>
        <td style="text-align: right">
                <asp:Button ID="BtnBack" runat="server" onclick="BtnBack_Click" Text="عوده" 
                    Width="100px" />
            </td>
    </tr>
    <tr>
        <td>
<asp:GridView ID="GridView1" runat="server">
</asp:GridView>
        </td>
    </tr>
</table>

