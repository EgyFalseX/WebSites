<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="ViewMenu.aspx.cs" Inherits="ViewMenu" Title="بيانات ومعلومات" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxDataView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100px;
        }
        .auto-style2 {
            height: 18px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <dx:ASPxDataView ID="ASPxDataView1" runat="server" 
    DataSourceID="DataSourceAccess" Theme="iOS" Width="850px" ColumnCount="2">
        <ItemTemplate>
            <table align="center" class="auto-style1">
                <tr>
                    <td align="center">
                        <dx:ASPxImage ID="imgPhoto" runat="server" Height="160px" ImageUrl="<%# bind('ItemPic') %>" Width="200px">
                        </dx:ASPxImage>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <dx:ASPxLabel ID="lblTitle" runat="server" Text="<%# bind('ItemName') %>" Font-Bold="True" Font-Size="Medium" ForeColor="Blue" Width="200px">
                        </dx:ASPxLabel>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: justify; vertical-align: middle; line-height: normal; text-indent: inherit; white-space: normal; word-spacing: normal; letter-spacing: normal; font-weight: 700;" 
                        valign="middle">
                        <dx:ASPxLabel ID="lblDetails" runat="server" Text="<%# bind('ItemInfo') %>" 
                            Font-Bold="False" Font-Size="Medium" 
                            style="text-align: justify; direction: rtl" Font-Names="Times New Roman" 
                            ForeColor="#003300">
                        </dx:ASPxLabel>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <dx:ASPxHyperLink ID="linkDetails" runat="server" NavigateUrl="<%# bind('ItemID', 'NViewDetails.aspx?id={0}') %>" Text="التفاصيل" Font-Size="Medium" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <dx:ASPxHyperLink ID="linkApply" runat="server" NavigateUrl="<%# bind('ItemID', 'Apply.aspx?id={0}') %>" Text="للحجز" Font-Size="Medium" />
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </dx:ASPxDataView>

    <asp:AccessDataSource ID="DataSourceAccess" runat="server" 
    DataFile="Data/FlexibleData.mdb" 
    SelectCommand="SELECT ItemID, [ItemName], [Data_Path], [ItemInfo], [ItemPic] FROM [MenuItem] order by ItemID desc">
</asp:AccessDataSource>
    </asp:Content>

