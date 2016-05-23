<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Viewer.ascx.cs" Inherits="Viewer" %>
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
    }
    .auto-style2 {
        height: 64px;
        width: 376px;
    }
    .auto-style3 {
        width: 98px;
        height: 64px;
    }
</style>
     
    <body >
     
        </table>   
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="DataSourceAccess">
    <ItemTemplate>
         <table align="center" style="height: 60px">
            <tr>
                
                <td align="right" class="auto-style2" valign="top" style="border: thin solid #000080">
                    <asp:HyperLink ID="HyperLink1" runat="server" Text = '<%# bind("ItemName") %>' 
                        NavigateUrl = '<%# bind("ItemID", "../ViewDetails.aspx?id={0}") %>' Font-Bold="True" style="text-align: center"></asp:HyperLink>
                    <br />
                   
                    <asp:TextBox ID="TextBox1" runat="server" Text='<% # bind("ItemInfo") %>' 
                        BorderStyle="None" Height="40px" Width="726px" BackColor="" style="direction: rtl" 
                        TextMode="MultiLine" Font-Bold="True" ReadOnly="True" 
                        ViewStateMode="Enabled" Font-Names="Times New Roman" Font-Size="Large"></asp:TextBox>
                    <br />
                     <asp:HyperLink ID="HyperLink3" runat="server" Text = "احجز الان" 
                        NavigateUrl = '<%# bind("ItemID", "../Reservation.aspx?id={0}") %>' Font-Bold="True" style="text-align: center"></asp:HyperLink>
                <td class="auto-style3" valign="top" style="border: thin solid #000080">
                    <asp:Image ID="Image1" ImageUrl='<% # bind("ItemPic", "files/{0}") %>' runat="server" 
                        Height="74px" Width="97px" />
                </td>
           </table>
    </ItemTemplate>
    </asp:Repeater>
<asp:AccessDataSource ID="DataSourceAccess" runat="server" 
    DataFile="~/App_Data/AATSWEB.mdb" 
    SelectCommand="SELECT [ItemID], [ItemName], [Show_Hide], [Data_Path], [ItemInfo], [ItemPic], [ItemNamee], [ItemInfoe], [Data_Pathe] FROM [MenuItem] WHERE ([Show_Hide] = ?)">
    <SelectParameters>
        <asp:Parameter DefaultValue="True" Name="Show_Hide" Type="Boolean" />
    </SelectParameters>
</asp:AccessDataSource>

