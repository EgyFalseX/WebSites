<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Viewer.ascx.cs" Inherits="Viewer" %>
<style type="text/css">
    .style1
    {
        width: 523px;
        height: 135px;
    }
    .style2
    {
        width: 117px;
        height: 135px;
    }
    .style3
    {        height: 135px;
        width: 376px;
        direction: rtl;
    }
</style>
        
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="DataSourceAccess">
    <ItemTemplate>
    <table align="center" class="style1">
            <tr>
                <td class="style2" valign="top">
                    <asp:Image ID="Image1" ImageUrl='<% # bind("ItemPic") %>' runat="server" 
                        Height="135px" Width="149px" />
                </td>
                <td align="right" class="style3" valign="top">
                    <asp:HyperLink ID="HyperLink1" runat="server" Text = '<%# bind("ItemName") %>' 
                        NavigateUrl = '<%# bind("ItemID") %>' Font-Bold="True"></asp:HyperLink>
                    <br />
                        <asp:Label ID="Label3" runat="server" Text = "نبذة مختصره : " 
                        Font-Bold="True" Font-Overline="False" Font-Underline="True"></asp:Label>
                    <br />
                    
                    <asp:TextBox ID="TextBox1" ReadOnly=true runat="server" Text='<% # bind("ItemInfo") %>' 
                        BorderStyle="None" Height="65px" Width="374px" style="direction: rtl" 
                        TextMode="MultiLine" Font-Bold="True"></asp:TextBox>
                        <asp:Label ID="Label2" runat="server" Text = "تاريخ الاصدار : " 
                        Font-Bold="True" Font-Overline="False" Font-Underline="True"></asp:Label>
                        <asp:Label ID="Label1" runat="server" Text = '<%# bind("ReleaseDate") %>' 
                        Font-Bold="True"></asp:Label>
                </td>
            </tr>
        </table>  
    </ItemTemplate>
    </asp:Repeater>
<asp:AccessDataSource ID="DataSourceAccess" runat="server" 
    DataFile="../Data/FlexibleData.mdb" 
    
    SelectCommand="SELECT '../ViewDetails.aspx?id=' &amp; [ItemID] AS ItemID, [ItemName], [Data_Path], [ItemInfo], [ItemPic], Format(ReleaseDate, 'd/M/yyyy') AS ReleaseDate FROM [MenuItem]">
</asp:AccessDataSource>

