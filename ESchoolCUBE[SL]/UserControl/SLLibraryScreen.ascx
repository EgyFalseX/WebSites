<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SLLibraryScreen.ascx.cs" Inherits="UserControl_SLLibraryScreen" %>
<style type="text/css">
    .SLLibraryScreenstyle1
    {
        width: 15px;
        height: 203px;
    }
    .SLLibraryScreenstyle2
    {
        text-align: center;
    }
    .SLLibraryScreenstyle3
    {
        text-align: right;
        width: 61px;
    }
    .SLLibraryScreenstyle4
    {
        width: 73px;
    }
</style>

<div dir ="rtl" style="text-align: center">
    
    <asp:DataList ID="DataListCats" runat="server" RepeatColumns="3" Width="735px">
    <ItemTemplate>
<table dir="rtl" class="SLLibraryScreenstyle1">
    <tr>
        <td colspan="4" style="text-align: center">
            <asp:Image ID="ImgPic" ImageUrl='<% # bind("CatImage") %>' runat="server" 
                Height="143px" Width="128px" />
        </td>
    </tr>
    <tr>
        <td class="SLLibraryScreenstyle2" colspan="4">
            <asp:HyperLink ID="HLName" runat="server" Text = '<% # bind("CatName") %>' NavigateUrl='<%# bind("CatID") %>'></asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td class="SLLibraryScreenstyle2">
            <asp:Label ID="Label5" runat="server" Text="الدروس" style="font-weight: 700"></asp:Label>
        </td>
        <td class="SLLibraryScreenstyle3">
            <asp:Label ID="LblBooksCount" runat="server" Text='<% # bind("BooksCount") %>'></asp:Label>
        </td>
        <td class="SLLibraryScreenstyle4" style="text-align: right">
            <asp:Label ID="Label7" runat="server" Text="الزيارات" style="font-weight: 700"></asp:Label>
        </td>
        <td style="text-align: right">
            <asp:Label ID="LblVisitCount" runat="server" Text='<% # bind("VisitCounter") %>'></asp:Label>
        </td>
    </tr>
</table>
    </ItemTemplate>
    </asp:DataList>

</div>
