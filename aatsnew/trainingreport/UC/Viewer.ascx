<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Viewer.ascx.cs" Inherits="Viewer" %>
<style type="text/css">
    .style1
    {
        width: 560px;
        height: 112px;
    }
    .style2
    {
        width: 117px;
        height: 80px;
    }
    .style3
    {        height: 100px;
        width: 376px;
    }
</style>
       
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="DataSourceAccess">
    <ItemTemplate>
        <table align="center" style="height: 90px" class="style1">
            <tr>
                <td class="style2" valign="top">
                    <asp:Image ID="Image1" ImageUrl='<% # bind("ItemPic", "files/{0}") %>' runat="server" 
                        Height="94px" Width="102px" />
                </td>
                <td align="right" class="style3" valign="top">
                    <asp:HyperLink ID="HyperLink1" runat="server" Text = '<%# bind("ItemName") %>' 
                        NavigateUrl = '<%# bind("ItemID") %>' Font-Bold="True"></asp:HyperLink>
                    <br />
                   
                    <asp:TextBox ID="TextBox1" runat="server" Text='<% # bind("ItemInfo") %>' 
                        BorderStyle="None" Height="61px" Width="445px" style="direction: rtl" 
                        TextMode="MultiLine" Font-Bold="True"></asp:TextBox>
                
          
        </table>   
    </ItemTemplate>
    </asp:Repeater>
<asp:AccessDataSource ID="DataSourceAccess" runat="server" 
    DataFile="../Data/FlexibleData.mdb" 
    SelectCommand="SELECT '../ViewDetails.aspx?id=' & [ItemID] AS ItemID, [ItemName], [Data_Path], [ItemInfo], [ItemPic] FROM [MenuItem]">
</asp:AccessDataSource>

