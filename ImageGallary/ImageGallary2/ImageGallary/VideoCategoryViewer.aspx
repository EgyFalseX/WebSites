<%@ Page Title="" Language="C#" MasterPageFile="masterVideo.master" AutoEventWireup="true" CodeFile="VideoCategoryViewer.aspx.cs" Inherits="VideoCategoryViewer" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxDataView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <table align="center" class="auto-style1">
        <tr>
            <td style="text-align: center">
                <dx:ASPxDataView ID="ASPxDataViewData" runat="server" Width="700px" AllowPaging="False" DataSourceID="DSData">
                    <ItemTemplate>
                        <table align="center">
                            <tr>
                                <td style="text-align: center">
                                    <dx:ASPxImage ID="ASPxImage1" runat="server" Height="128px" Width="128px" ImageUrl='~/ImageGallary/images/FolderIcon.png'>
                                    </dx:ASPxImage>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center">
                                    <dx:ASPxHyperLink ID="ASPxHyperLinkVideo" Text='<%# Eval("VideoFolder") %>' NavigateUrl='<%# Eval("Id", "VideoVideoViewer.aspx?Id={0}") %>' runat="server" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </dx:ASPxDataView>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
            <asp:AccessDataSource ID="DSData" runat="server" 
                DataFile="~/App_Data/GallaryData.mdb" 
                SelectCommand="SELECT [Id], [VideoFolder] FROM [VideoFolder]">
            </asp:AccessDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

