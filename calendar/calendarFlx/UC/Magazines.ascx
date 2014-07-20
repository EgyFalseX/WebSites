<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Magazines.ascx.cs" Inherits="Magazines" %>
<style type="text/css">
    .style1
    {
        width: 100px;
    }
</style>

<asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

<table align="center" class="style1">
    <tr>
        <td>
            <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" CellSpacing="0" 
                DataSourceID="AccessDataSourceMagazines" GridLines="None" Skin="Forest" 
                Width="600px" Font-Bold="True">
<MasterTableView DataKeyNames="contid" DataSourceID="AccessDataSourceMagazines">
<CommandItemSettings ExportToPdfText="Export to PDF"></CommandItemSettings>

<RowIndicatorColumn FilterControlAltText="Filter RowIndicator column">
</RowIndicatorColumn>

<ExpandCollapseColumn FilterControlAltText="Filter ExpandColumn column">
</ExpandCollapseColumn>

    <Columns>
        <telerik:GridBoundColumn DataField="addd" 
            FilterControlAltText="Filter addd column" HeaderText="Issue" ReadOnly="True" 
            SortExpression="addd" UniqueName="addd">
            <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
            <ItemStyle HorizontalAlign="Center" Font-Bold="True" />
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="subject" 
            FilterControlAltText="Filter subject column" HeaderText="Topic Title" 
            SortExpression="subject" UniqueName="subject">
            <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
            <ItemStyle HorizontalAlign="Center" Font-Bold="True" />
        </telerik:GridBoundColumn>
        <telerik:GridBoundColumn DataField="subwrit" 
            FilterControlAltText="Filter subwrit column" HeaderText="Author" 
            SortExpression="subwrit" UniqueName="subwrit">
            <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
            <ItemStyle HorizontalAlign="Center" Font-Bold="True" />
        </telerik:GridBoundColumn>
        <telerik:GridHyperLinkColumn DataNavigateUrlFormatString="../MagazineDetails.aspx?View={0}" FilterControlAltText="Filter Show column" 
            HeaderText="Show" SortExpression="Show" UniqueName="Show" 
            DataNavigateUrlFields="contid" Text="Show">
            <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
            <ItemStyle HorizontalAlign="Center" Font-Bold="True" />
        </telerik:GridHyperLinkColumn>
    </Columns>

<EditFormSettings>
<EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
</EditFormSettings>
</MasterTableView>

<FilterMenu EnableImageSprites="False"></FilterMenu>

<HeaderContextMenu CssClass="GridContextMenu GridContextMenu_Default"></HeaderContextMenu>
            </telerik:RadGrid>
            <asp:AccessDataSource ID="AccessDataSourceMagazines" runat="server" 
                DataFile="../App_Data/magazine.mdb" 
                
                SelectCommand="SELECT (Select addd From addno Where addno = addcont.addno) AS addd, [contid], [addno], [subject], [subwrit], [subjectdet], [subimage] FROM [addcont] WHERE ([addno] = ?)">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="0" Name="addno" QueryStringField="View" 
                        Type="String" />
                </SelectParameters>
            </asp:AccessDataSource>
        </td>
    </tr>
</table>

