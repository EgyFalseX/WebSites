<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Viewere.ascx.cs" Inherits="Viewer" %>
<style type="text/css">
    .style1
    {
        width: 836px;
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
        text-align: left;
    }
</style>
          
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="DataSourceAccess">
    <ItemTemplate>
        <table align="center" style="height: 125px; background-color: #FFFFFF;" class="style1">
            <tr>
                <td class="style2" valign="top">
                    <asp:Image ID="Image1" ImageUrl='<% # bind("ItemPic", "files/{0}") %>' runat="server" 
                        Height="117px" Width="151px" />
                </td>
                <td align="right" class="style3" valign="top">
                    <asp:HyperLink ID="HyperLink1" runat="server" Text = '<%# bind("ItemNamee") %>' 
                        NavigateUrl = '<%# bind("ItemID") %>' Font-Bold="True" style="text-align: left"></asp:HyperLink>
                    <br />
                   
                    <asp:TextBox ID="TextBox1" runat="server" Text='<% # bind("ItemInfoe") %>' 
                        BorderStyle="None" Height="83px" Width="596px" BackColor="" style="direction: rtl; text-align: left;" 
                        TextMode="MultiLine" Font-Bold="True" ReadOnly="True" 
                        ViewStateMode="Enabled"></asp:TextBox>
                               </table>
    </ItemTemplate>
    </asp:Repeater>
<asp:AccessDataSource ID="DataSourceAccess" runat="server" 
    DataFile="../Data/FlexibleData.mdb" 
    SelectCommand="SELECT '../ViewDetailse.aspx?id=' & [ItemID] AS ItemID, [ItemNamee], [Data_Pathe], [ItemInfoe], [ItemPic] FROM [MenuItem]">
</asp:AccessDataSource>

