<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SelectLagna.ascx.cs" Inherits="SelectLagna" %>
<style type="text/css">
    .style1
    {
        width: 265px;
    }
    .style2
    {
        height: 230px;
    }
</style>

<table align="center" class="style1">
    <tr>
        <td class="style2">
        </td>
        <td class="style2">
        </td>
    </tr>
    <tr>
        <td>
            <asp:DropDownList ID="DDLLagna" runat="server" DataSourceID="AccessDSCDLagna" 
                DataTextField="LagnaName" DataValueField="LagnaId" Width="180px" 
                style="direction: rtl">
            </asp:DropDownList>
        </td>
        <td>
            <asp:Label ID="Label1" runat="server" Text="اختر لجنــــه"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:Button ID="btnOK" runat="server" onclick="btnOK_Click" Text="عرض" 
                Width="100px" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
</table>
                <asp:AccessDataSource ID="AccessDSCDLagna" runat="server" 
                    DataFile="../Data/FlexibleData.mdb" 
                    SelectCommand="SELECT [LagnaId], [LagnaName] FROM [CDLagna]">
                </asp:AccessDataSource>
            
