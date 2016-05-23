<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CourseViewer.ascx.cs" Inherits="CourseViewer" %>
<style type="text/css">
    .style1
    {
        width: 544px;
        height: 219px;
    }
    .style2
    {
        width: 104px;
        height: 186px;
    }
    .style3
    {        height: 186px;
    }
    .style4
    {
        width: 303px;
    }
</style>
      
    <table align="center" class="style4">
        <tr>
            <td style="direction: rtl; text-align: center">
                <asp:Label ID="Label1" runat="server" Font-Size="18pt" 
                    Text="الاعلان عن الدورات التدريبية-اضغط على اسم الدورة للحجز"></asp:Label>
            </td>
        </tr>
</table>
      
    <asp:Repeater ID="Repeater1" runat="server">
    <ItemTemplate>
            <table align="center" class="style1">
            <tr>
                <td class="style2" valign="top">
                    <asp:Image ID="Image1" ImageUrl='<% # bind("imageline1Link") %>' runat="server" 
                        Height="170px" Width="180px" />
                </td>
                <td align="right" class="style3" valign="top">
                    <asp:HyperLink ID="HyperLink1" runat="server" Text = '<%# bind("CourseName") %>' 
                        NavigateUrl = '<%# bind("CourseIdLink") %>' Font-Bold="True"></asp:HyperLink>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<% # bind("Courseremark") %>' 
                        BorderStyle="None" Height="150px" Width="350px" style="direction: rtl" 
                        TextMode="MultiLine" Font-Bold="True"></asp:TextBox>
                </td>
            </tr>
        </table>
    </ItemTemplate>
    </asp:Repeater>


