<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Viewer.ascx.cs" Inherits="Viewer" %>
<style type="text/css">
    .style4
    {
        width: 156px;
    }
</style>

<asp:Repeater ID="Repeater1" runat="server" DataSourceID="DataSourceAccess">
    <ItemTemplate>
        <table align="center" style="height: 144px; width: 700px;">
            <tr>
                <td valign="top" class="style4">
                    <asp:Image ID="Image1" ImageUrl='<% # bind("ItemPic") %>' runat="server" Height="140px"
                        Width="152px" />
                </td>
                <td align="right" valign="top">
                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# bind("ItemName") %>' NavigateUrl='<%# bind("ItemID") %>'
                        Target="_new" Font-Bold="True"></asp:HyperLink>
                    <br />
                    <asp:TextBox ID="TextBox1" runat="server" Text='<% # bind("ItemInfo") %>' BorderStyle="None"
                        Height="112px" Width="526px" Style="direction: rtl; margin-right: 3px;" TextMode="MultiLine"
                        Font-Bold="True" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:Repeater>
<asp:AccessDataSource ID="DataSourceAccess" runat="server" DataFile="../Data/FlexibleData.mdb"
    
    
    SelectCommand="SELECT '../ViewDetails.aspx?id=' &amp; ItemID AS ItemID, '../ViewDetails.aspx?Path2nd=true&amp;id=' &amp; ItemID AS ItemID2, ItemName, Data_Path, ItemInfo, ItemPic, (SELECT LagnaName FROM CDLagna WHERE LagnaId = MenuItem.LagnaId) AS LagnaName FROM MenuItem WHERE LagnaId = ? ORDER BY ItemID DESC">
    <SelectParameters>
        <asp:QueryStringParameter Name="?" QueryStringField="LagnaID" />
    </SelectParameters>
</asp:AccessDataSource>
