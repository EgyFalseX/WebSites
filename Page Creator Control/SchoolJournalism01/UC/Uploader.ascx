<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Uploader.ascx.cs" Inherits="Uploader" %>
<style type="text/css">
    .style1
    {
        width: 320px;
    }
    .style2
    {
        width: 35px;
        direction: ltr;
    }
    .style3
    {
        text-align: right;
        width: 259px;
    }
    .style4
    {
        text-align: center;
        height: 32px;
    }
</style>

<table align="center" class="style1">
    <tr>
        <td class="style3">
            <asp:TextBox ID="TxtFolder" runat="server" Width="230px">files</asp:TextBox>
        </td>
        <td class="style2">
            <asp:Label ID="Label1" runat="server" Text="المسار"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style3">
                <asp:FileUpload ID="FUFiles" runat="server"  />
            </td>
        <td class="style2">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style3">
            <asp:Button ID="BtnUpload" runat="server" onclick="BtnUpload_Click" Text="رفع" 
                Width="130px" />
        </td>
        <td class="style2">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style4" colspan="2">
            <asp:Label ID="LblPath" runat="server" Font-Bold="True" Text="..."></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style4" colspan="2">
            <a href="javascript:window.opener='x';window.close();">Close</a>
            </td>
    </tr>
</table>

