<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Viewer2.ascx.cs" Inherits="Viewer2" %>

<asp:DataList ID="DataList1" runat="server" DataSourceID="DataSourceAccess" 
    RepeatColumns="2" onitemdatabound="DataList1_ItemDataBound" 
    CellSpacing="5">
    <ItemStyle Wrap="True" />
    <ItemTemplate>
        <table dir="rtl">
            <tr>
                <td>
                    <asp:Image ID="Image1" runat="server" Height="126px" 
                        ImageUrl='<% # Eval("ItemPic") %>' Width="250px" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" 
                        NavigateUrl='<%# Eval("ItemID", "../ViewDetails.aspx?id={0}") %>' Target="_new" 
                        Text='<%# Eval("ItemName") %>' Width="250px"></asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Height="150px" 
                        Text='<%# Eval("ItemInfo") %>' Width="250px"></asp:Label>
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>

<asp:AccessDataSource ID="DataSourceAccess" runat="server" DataFile="../Data/FlexibleData.mdb"
    
    
    
    SelectCommand="SELECT ItemID, ItemName, Data_Path, ItemInfo, ItemPic FROM MenuItem ORDER BY ItemID DESC">
</asp:AccessDataSource>


