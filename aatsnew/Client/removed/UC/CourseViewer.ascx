<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CourseViewer.ascx.cs"
    Inherits="CourseViewer" %>
<style type="text/css">
    .style1
    {
        width: 544px;
        height: 128px;
        background-color: White;
    }
    .style4
    {
        width: 303px;
        background-color: White;
    }
    .style5
    {
        width: 178px;
    }
</style>
<table align="center" class="style4">
    <tr>
        <td style="direction: rtl; text-align: center">
            <asp:Label ID="Label1" runat="server" Font-Size="18pt" Text="الاعلان عن الدورات التدريبية"
                Font-Names="Arial"></asp:Label>
        </td>
    </tr>
</table>
       
<asp:Repeater ID="Repeater1" runat="server">
    <ItemTemplate>
    <table align="center" class="style1">
            <tr>
                <td valign="top" align="right" class="style5">
                    <asp:Image ID="Image1" ImageUrl='<% # bind("imageline1Link") %>' runat="server" Height="100px"
                        Width="140px" />
                </td>
                <td align="right" valign="top">
                    <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# bind("CourseName") %>' NavigateUrl='<%# bind("CourseIdLink") %>'
                        Font-Bold="True" Font-Names="Arial"></asp:HyperLink>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<% # bind("Courseremark") %>' BorderStyle="None"
                        Height="65px" Width="350px" Style="direction: rtl" TextMode="MultiLine" Font-Bold="True"
                        Font-Names="Arial" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:Repeater>
