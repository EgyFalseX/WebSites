<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MagazineDetails.ascx.cs" Inherits="MagazineDetails" %>
<style type="text/css">
    .style1
    {
        width: 100px;
    }
</style>

<asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

<asp:AccessDataSource ID="AccessDataSourceMagDetails" runat="server" 
    DataFile="../App_Data/magazine.mdb" 
    SelectCommand="SELECT [contid], [subject], [subjectdet], [subimage], [addno] FROM [addcont] WHERE ([contid] = ?)">
    <SelectParameters>
        <asp:QueryStringParameter DefaultValue="0" Name="contid" 
            QueryStringField="View" Type="Int32" />
    </SelectParameters>
</asp:AccessDataSource>
<table align="center" class="style1">
    <tr>
        <td style="text-align: center">
            <asp:Image ID="ImgIssue" runat="server" Height="200px" Width="200px" />
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:Label ID="LblDetails" runat="server" Text="Nothing" 
                Width="600px" style="text-align: justify"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            <telerik:RadButton ID="RBBack" runat="server" Font-Bold="True" 
                onclick="RBBack_Click" Skin="Forest" Text="Back &gt;&gt;">
            </telerik:RadButton>
        </td>
    </tr>
</table>

