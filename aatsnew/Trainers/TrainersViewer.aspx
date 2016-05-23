<%@ Page Title="" Language="C#" MasterPageFile="masterVideo.master" AutoEventWireup="true" CodeFile="TrainersViewer.aspx.cs" Inherits="TrainersViewer" %>

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
        .auto-style4 {
            height: 18px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <table align="center" class="auto-style1">
        <tr>
            <td style="text-align: center" class="auto-style2">
                <dx:ASPxDataView ID="ASPxDataViewData" runat="server" Width="700px" AllowPaging="False" DataSourceID="DSData" ColumnCount="4" Theme="PlasticBlue">
                    <ItemTemplate>
                        <table align="center">
                            <tr>
                                <td style="background-position: center center; text-align: center; background-image: none;">
                                    <dx:ASPxImage ID="ASPxImage1" runat="server" Height="144px" Width="159px" ImageUrl='<%# Eval("ImageLink","Assets/Category/{0}") %>'>
                                        <BackgroundImage HorizontalPosition="center" VerticalPosition="center" />
                                    </dx:ASPxImage>
                                </td>
                            </tr>
                            <tr>
                                <td style="background-position: center center; text-align: center; background-image: none;" class="auto-style4">
                                    <dx:ASPxHyperLink ID="ASPxHyperLinkVideo" Text='<%# Eval("VideoFolder") %>' runat="server" Font-Bold="True" />
                                </td>
                            </tr>
                            <tr>
                                <td style="background-position: center center; text-align: center; background-image: none;">
                                    <dx:ASPxLabel ID="lblDesc" runat="server" Text='<%# Eval("Desc") %>' Font-Bold="True">
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td style="background-position: center center; text-align: center; background-image: none;">
                                    
                                    <dx:ASPxHyperLink ID="LinkButton1" Text="معلومات عن المدرب" NavigateUrl='<%# Eval("Id", "ViewDetails.aspx?Id={0}")%>' runat="server" Font-Bold="True" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <BackgroundImage Repeat="NoRepeat" />
                </dx:ASPxDataView>
            </td>
        </tr>
        <tr>
            <td style="text-align: center" class="auto-style2">
            <asp:AccessDataSource ID="DSData" runat="server" 
                DataFile="~/Trainers/Data/GallaryData.mdb" 
                SelectCommand="SELECT [Id], [VideoFolder], [ImageLink], [Desc] FROM [VideoFolder]">
            </asp:AccessDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

