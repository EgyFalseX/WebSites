<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Viewer.ascx.cs" Inherits="Viewer" %>
<style type="text/css">
    .style1
    {
        width: 456px;
        height: 153px;
    }
    .style2
    {
        width: 104px;
        height: 186px;
    }
    .style3
    {
        height: 186px;
    }
</style>
<asp:Repeater ID="Repeater1" runat="server" DataSourceID="DataSourceAccess">
    <ItemTemplate>
        <table align="center" style="height: 144px; width: 497px;">
            <tr>
                <td valign="top">
                    <asp:Image ID="Image1" ImageUrl='<% # bind("ItemPic") %>' runat="server" Height="140px"
                        Width="152px" />
                </td>
                <td align="right" valign="top">
                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# bind("ItemName") %>' NavigateUrl='<%# bind("ItemID") %>'
                        Target="_new" Font-Bold="True"></asp:HyperLink>
                    <br />
                    <asp:TextBox ID="TextBox1" runat="server" Text='<% # bind("ItemInfo") %>' BorderStyle="None"
                        Height="112px" Width="325px" Style="direction: rtl; margin-right: 3px;" TextMode="MultiLine"
                        Font-Bold="True" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
        </table>
        <table align="center" style="height: 144px; width: 497px;">
            <tr>
                <td align="right" valign="top">
                    <asp:HyperLink ID="HyperLink2" runat="server" Text='<%# bind("ItemName2") %>' NavigateUrl='<%# bind("ItemID2") %>'
                        Target="_new" Font-Bold="True"></asp:HyperLink>
                    <br />
                    <asp:TextBox ID="TextBox2" runat="server" Text='<% # bind("ItemInfo2") %>' BorderStyle="None"
                        Height="112px" Width="325px" Style="direction: rtl; margin-right: 3px;" TextMode="MultiLine"
                        Font-Bold="True" ReadOnly="True"></asp:TextBox>
                </td>
                <td valign="top">
                    <asp:Image ID="Image2" ImageUrl='<% # bind("ItemPic2") %>' runat="server" Height="140px"
                        Width="152px" />
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:Repeater>
<asp:AccessDataSource ID="DataSourceAccess" runat="server" DataFile="../Data/FlexibleData.mdb"
    SelectCommand="SELECT '../ViewDetails.aspx?id=' & [ItemID] AS ItemID, '../ViewDetails.aspx?Path2nd=true&id=' & [ItemID] AS ItemID2, [ItemName], [Data_Path], [ItemInfo], [ItemPic], [ItemName2], [Data_Path2], [ItemInfo2], [ItemPic2] FROM [MenuItem] order by ItemID desc">
</asp:AccessDataSource>
