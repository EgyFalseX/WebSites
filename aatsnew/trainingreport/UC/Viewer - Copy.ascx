<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Viewer.ascx.cs" Inherits="Viewer" %>
<asp:Repeater ID="Repeater1" runat="server" DataSourceID="DataSourceAccess">
    <ItemTemplate>
        <table align="center" style="height: 114px; width: 600px; background-image: url('p_resize.jpg');">
            <tr>
                <td valign="top">
                    <asp:Image ID="Image1" ImageUrl='<% # bind("ItemPic") %>' runat="server" Height="102px"
                        Width="126px" BorderColor="#33CCFF" BorderStyle="Solid" />
                </td>
                <td align="right" valign="top">
                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# bind("ItemName") %>' NavigateUrl='<%# bind("ItemID") %>'
                        Target="_new" Font-Bold="True"></asp:HyperLink>
                    <br />
                    <asp:TextBox ID="TextBox1" runat="server" Text='<% # bind("ItemInfo") %>' BorderStyle="None"
                        Height="77px" Width="447px" Style="direction: rtl; margin-right: 3px;" TextMode="MultiLine"
                        Font-Bold="True" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:Repeater>
<asp:AccessDataSource ID="DataSourceAccess" runat="server" DataFile="../App_Data/DataDB.mdb"
    SelectCommand="SELECT 'http://fayoumteachers.com/schoolnews/ViewDetails.aspx?id=' & [ItemID] AS ItemID, 'http://fayoumteachers.com/schoolnews/ViewDetails.aspx?Path2nd=true&id=' & [ItemID] AS ItemID2, [ItemName], [Data_Path], [ItemInfo], [ItemPic], [ItemName2], [Data_Path2], [ItemInfo2], [ItemPic2] FROM [MenuItem] order by ItemID desc">
</asp:AccessDataSource>
