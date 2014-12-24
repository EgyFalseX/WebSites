<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Viewer.ascx.cs" Inherits="Viewer" %>
<style type="text/css">
    .style1
    {
        width: 291px;
        height: 135px;
    }
    .style2
    {
        width: 117px;
        height: 135px;
        text-align: center;
    }
    .style3
    {        height: 135px;
        width: 376px;
    }
</style>
             
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="DataSourceAccess">
    <ItemTemplate>
     <table align="center" style="height: 315px; width: 177px">
            <tr>
                <td class="style2" valign="top">
                    <asp:Image ID="Image1" ImageUrl='<% # bind("ItemPic") %>' runat="server" 
                        Height="135px" Width="149px" />
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <asp:HyperLink ID="HyperLink1" runat="server" Text = '<%# bind("ItemName") %>' 
                        NavigateUrl = '<%# bind("ItemID") %>' Font-Bold="True"></asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <asp:TextBox ID="TextBox1" runat="server" Text='<% # bind("ItemInfo") %>' 
                        BorderStyle="None" style="direction: rtl" 
                        TextMode="MultiLine" Font-Bold="True"></asp:TextBox>
                </td>
            </tr>
        </table>
    </ItemTemplate>
    </asp:Repeater>
<asp:AccessDataSource ID="DataSourceAccess" runat="server" 
    DataFile="../Data/FlexibleData.mdb" 
    SelectCommand="SELECT '../ViewDetails.aspx?id=' & [ItemID] AS ItemID, [ItemName], [Data_Path], [ItemInfo], [ItemPic] FROM [MenuItem]">
</asp:AccessDataSource>

