<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewDetails.ascx.cs" Inherits="ViewDetails" %>
<style type="text/css">
    .style1
    {
        width: 489px;
    }
</style>
<table align="center" style="width: 750px">
    <tr>
        <td>
            <div align="center">
                <%= LoadContain() %>
            </div>
        </td>
        <td align="right" valign="top">
            <div style="width: 250px">
                <asp:Repeater ID="RepeaterMenu" runat="server">
                    <ItemTemplate>
                        <table class="style18">
                            <tr>
                                <td>
                                    <asp:HyperLink ID="HLink" runat="server" NavigateUrl='<% # bind("SubMenuID") %>'
                                        Text='<% # bind("SubMenuTitle") %>'>[HLink]</asp:HyperLink>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </td>
    </tr>
</table>
