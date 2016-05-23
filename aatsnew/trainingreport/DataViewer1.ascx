<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DataViewer.ascx.cs"
    Inherits="DataViewer" %>
<style type="text/css">
    .style1
    {
        width: 646px;
        height: 264px;
    }
    .style2
    {
        width: 216px;
    }
    .style4
    {
        height: 26px;
    }
</style>
<telerik:RadScriptManager ID="ScriptManager1" runat="server" 
    EnableTheming="True">
</telerik:RadScriptManager>
<telerik:RadRotator ID="RadRotator1" runat="server" Width="661px"
    Height="357px" DataSourceID="DSData" FrameDuration="5000" Skin="Default" 
    style="text-align: center" PauseOnMouseOver="False">
    <ItemTemplate>
        <table class="style1">
            <tr>
                <td class="style2" rowspan="2" align="left" valign="top">
                    <asp:Image ID="Image2" runat="server" Height="260px" 
                        ImageUrl='<%# Eval("ImageLink") %>' Width="412px" />
                </td>
                <td align="right" class="style4" valign="top">
                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
                        NavigateUrl='<%# Eval("Link") %>' Text='<%# Eval("Caption") %>' 
                        Font-Size="14pt"></asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td align="left" valign="top" style="text-align: right">
                    <asp:Label ID="Label2" runat="server" Font-Bold="False" 
                        Text='<%# Eval("Contain") %>' Font-Size="12pt"></asp:Label>
                </td>
            </tr>
        </table>
    </ItemTemplate>
</telerik:RadRotator>
<asp:AccessDataSource ID="DSData" runat="server" 
    DataFile="App_Data/DataDB.mdb" 
    SelectCommand="SELECT [ID], [Caption], [Contain], [ImageLink], [Link] FROM [RotatorData] WHERE viewpage = TRUE">
</asp:AccessDataSource>

