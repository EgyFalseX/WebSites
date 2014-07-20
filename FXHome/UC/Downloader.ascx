<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Downloader.ascx.cs" Inherits="Downloader" %>
<style type="text/css">
    .style1
    {
        width: 424px;
    }
    .style2
    {
        direction: ltr;
        text-align: center;
    }
</style>

    

<asp:Repeater ID="RepeaterMain" runat="server">
<ItemTemplate>
<table align="center" class="style1">
        <tr>
            <td bgcolor="Gray" style="text-align: center">
                <asp:Label ID="Label3" runat="server" ForeColor="White" Text="Download Name"></asp:Label>
            </td>
            
            <td style="text-align: center" bgcolor="Gray">
                <asp:Label ID="Label2" runat="server" ForeColor="White" Text="Download Link"></asp:Label>
            </td>
            
            <td bgcolor="Gray" class="style2">
                <asp:Label ID="Label1" runat="server" ForeColor="White" Text="Date"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="LblDownloadName" runat="server" Text = '<% # bind("LinkName") %>'></asp:Label>
            </td>
            
            <td style="text-align: center">
                <asp:HyperLink ID="HLDownloadLink" runat="server" Text = '<% # bind("LinkURL") %>' NavigateUrl = '<% # bind("LinkURL2") %>'></asp:HyperLink>
            </td>
            
            <td style="text-align: center">
                <asp:Label ID="LblDLDate" runat="server" Text = '<% # bind("UpdateDate") %>'></asp:Label>
            </td>
        </tr>
    </table>
</ItemTemplate>
</asp:Repeater>


