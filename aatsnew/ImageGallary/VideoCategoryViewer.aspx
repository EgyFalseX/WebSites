<%@ Page Title="" Language="C#" MasterPageFile="masterVideo.master" AutoEventWireup="true" CodeFile="VideoCategoryViewer.aspx.cs" Inherits="VideoCategoryViewer" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxDataView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 843px;
            margin-right: 0px;
        }
        .auto-style2 {
            width: 782px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <table align="center" class="auto-style1">
        <tr>
            <td style="text-align: center" class="auto-style2">
                <dx:ASPxDataView ID="ASPxDataViewData" runat="server" Width="700px" AllowPaging="False" DataSourceID="DSData" ColumnCount="4">
                    <ItemTemplate>
                        <table align="center">
                            <tr>
                                <td style="text-align: center">
                                    <dx:ASPxImage ID="ASPxImage1" runat="server" Height="144px" Width="159px" ImageUrl='<%# Eval("ImageLink","Assets/Category/{0}") %>'>
                                    </dx:ASPxImage>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center">
                                    <dx:ASPxHyperLink ID="ASPxHyperLinkVideo" Text='<%# Eval("VideoFolder") %>' NavigateUrl='<%# Eval("Id", "VideoVideoViewer.aspx?Id={0}") %>' runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center">
                                    <dx:ASPxLabel ID="lblDesc" runat="server" Text='<%# Eval("Desc") %>'>
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </dx:ASPxDataView>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" class="auto-style2">
            <asp:AccessDataSource ID="DSData" runat="server" 
                DataFile="~/App_Data/GallaryData.mdb" 
                SelectCommand="SELECT [Id], [VideoFolder], [ImageLink], [Desc] FROM [VideoFolder]">
            </asp:AccessDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

