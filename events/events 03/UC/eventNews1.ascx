<%@ Control Language="C#" AutoEventWireup="true" CodeFile="eventNews.ascx.cs" Inherits="eventNews" %>
<style type="text/css">
    .style1
    {
        width: 400px;
    }
</style>
<table class="style1" align="center">
    <tr>
        <td style="direction: rtl; text-align: right;">
            <asp:ListView ID="ListView1" runat="server" DataKeyNames="ItemID" DataSourceID="DSData"
                style="direction: rtl">
                <alternatingitemtemplate>
        <li style="">
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("ItemID", "../ViewMenu.aspx?id={0}") %>' 
              Target="_new"  Text='<%# Eval("Details") %>' />
            <br />
        </li>
    </alternatingitemtemplate>
                <edititemtemplate>
        <li style="">
            <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl='<%# Eval("ItemID", "../ViewMenu.aspx?id={0}") %>' 
               Target="_new" Text='<%# Eval("Details") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                Text="Cancel" />
        </li>
    </edititemtemplate>
                <emptydatatemplate>
        لا يوجد بيانات
    </emptydatatemplate>
                <insertitemtemplate>
        <li style="">
            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl='<%# Eval("ItemID", "../ViewMenu.aspx?id={0}") %>' 
               Target="_new" Text='<%# Eval("Details") %>' />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                Text="Insert" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                Text="Clear" />
        </li>
    </insertitemtemplate>
                <itemseparatortemplate>
<br />
    </itemseparatortemplate>
                <itemtemplate>
        <li style="">
        <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl='<%# Eval("ItemID", "../ViewMenu.aspx?id={0}") %>' 
              Target="_new"  Text='<%# Eval("Details") %>' />
            <br />
        </li>
    </itemtemplate>
                <layouttemplate>
        <ul ID="itemPlaceholderContainer" runat="server" style="">
            <li runat="server" id="itemPlaceholder" />
        </ul>
        <div style="">
        </div>
    </layouttemplate>
                <selecteditemtemplate>
        <li style="">
            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl='<%# Eval("ItemID", "../ViewMenu.aspx?id={0}") %>' 
              Target="_new"  Text='<%# Eval("Details") %>' />
            <br />
        </li>
    </selecteditemtemplate>
            </asp:ListView>
        </td>
    </tr>
</table>
<asp:AccessDataSource ID="DSData" runat="server" DataFile="../App_Data/events.mdb"
    SelectCommand="SELECT Top 5 [ItemID], [ItemName], [Itemtypeid], [LagnaId], [Itemdatestart], [Itemdateend], [ItemInfo], [ItemPic],
(SELECT LagnaName FROM CDLagna WHERE LagnaId = MenuItem.LagnaId) AS LagnaName,
(SELECT Itemtype FROM Itemtype WHERE Itemtypeid = MenuItem.Itemtypeid) AS Itemtype,
ItemName &amp; ' بفرعية ' &amp; (SELECT LagnaName FROM CDLagna WHERE LagnaId = MenuItem.LagnaId) &amp; ' من ' &amp; FORMAT(Itemdatestart, 'dd/MM/yyyy') AS Details
 FROM [MenuItem]
order by Itemdatestart desc"></asp:AccessDataSource>
