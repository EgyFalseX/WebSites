<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Viewer.ascx.cs" Inherits="Viewer" %>
<style type="text/css">
    .style1
    {
        width: 544px;
        height: 219px;
    }
    .style2
    {
        width: 104px;
    }
    .style3
    {
    }
</style>
  
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="DataSourceAccess">
    <ItemTemplate>
        <table align="center" class="style1">
            <tr>
                <td class="style2" valign="top">
                    <asp:Image ID="Image1" ImageUrl='<% # bind("ItemPic") %>' runat="server" 
                        Height="170px" Width="180px" />
                </td>
                <td align="right" class="style3" valign="top">
                    <asp:HyperLink ID="HyperLink1" runat="server" Text = '<% # bind("ItemName") %>' NavigateUrl = '<% # bind("ItemID") %>'>AAA</asp:HyperLink>
                    <br />
                    <br />
                    <asp:TextBox ID="TextBox1" runat="server" Text='<% # bind("ItemInfo") %>' 
                        BorderStyle="None" Height="150px" Width="350px" style="direction: rtl" 
                        TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
        </table>
    </ItemTemplate>
    </asp:Repeater>
<asp:AccessDataSource ID="DataSourceAccess" runat="server" 
    DataFile="../Data/FlexibleData.mdb" 
    SelectCommand="SELECT '../ViewDetails.aspx?id=' & [ItemID] AS ItemID, [ItemName], [Data_Path], [ItemInfo], [ItemPic] FROM [MenuItem]">
</asp:AccessDataSource>

