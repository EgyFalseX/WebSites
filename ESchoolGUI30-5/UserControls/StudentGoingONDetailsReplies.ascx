<%@ Control Language="C#" AutoEventWireup="true" CodeFile="StudentGoingONDetailsReplies.ascx.cs" Inherits="UserControls_StudentGoingONDetailsReplies" %>
<%@ Register src="StudentGoingOn.ascx" tagname="StudentGoingOn" tagprefix="uc1" %>
<style type="text/css">
    .style1
    {
        width: 98px;
    }
    .style2
    {
        width: 274px;
    }
</style>
<div id="ggggo" dir="rtl" runat="server">
    <br />
    <table style="width:72%;">
        <tr>
            <td class="style1">
                <asp:Label ID="Label1" runat="server" Text="تفاصيل الملاحظة"></asp:Label>
            </td>
            <td class="style2">
    <asp:Label ID="lblDetails" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label2" runat="server" Text="رد ولي الأمر"></asp:Label>
            </td>
            <td class="style2">
    <asp:Label ID="lblReply" runat="server"></asp:Label>
    <asp:TextBox ID="txtReply" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
    <asp:Button ID="btnSaveUpdate" runat="server" Text="تعديل" 
        onclick="btnSaveUpdate_Click" />
            </td>
        </tr>
    </table>
</div>