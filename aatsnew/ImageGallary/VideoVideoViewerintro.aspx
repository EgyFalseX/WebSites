<%@ Page Title="" Language="C#" MasterPageFile="masterVideointro.master" AutoEventWireup="true" CodeFile="VideoVideoViewerintro.aspx.cs" Inherits="VideoVideoViewer" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxDataView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 147px;
            height: 113px;
        }
        .auto-style3 {
            width: 98px;
            text-align: center;
        }
        .auto-style4 {
            height: 48px;
        }
        .auto-style5 {
            height: 26px;
        }
        .auto-style6 {
            width: 333px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    <table align="center" style="height: 141px; width: 525px">
        <tr>
            <td valign="top" class="auto-style6">
                <table align="center" class="auto-style1">
                                <tr>
                                    <td class="auto-style4">
                                        <asp:ScriptManager ID="ScriptManager1" runat="server" />
                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div style="text-align: center">
                                                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                                </div>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center" class="auto-style5">
                                        <asp:Label ID="lblDesc" runat="server" Font-Bold="True" Font-Size="X-Large" ForeColor="Blue"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center; direction: rtl;">
                                        <asp:Label ID="lblvcount" runat="server" Font-Bold="True" ForeColor="Blue"></asp:Label>
                                    </td>
                                </tr>
                            </table>
            </td>
            <td>
                <dx:ASPxDataView ID="ASPxDataViewData" runat="server" Width="200px" Height="5px" RowPerPage="1" EnableTheming="True" ItemSpacing="0px" ColumnCount="2" Theme="Aqua"  ViewStateMode="Disabled">
                    <ItemTemplate>
                        <table align="center" >
                            <tr>
                                <td  height="9">
                                    <dx:ASPxImage ID="ASPxImage1" runat="server" Height="95px" Width="123px" ImageUrl='<%# Eval("VideoLinks", "http://img.youtube.com/vi/{0}/0.jpg") %>'>
                                    </dx:ASPxImage>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center" class="auto-style3" height="9">
                                    <dx:ASPxHyperLink ID="ASPxHyperLinkVideo" Text='<%# Eval("VideoName") %>' NavigateUrl='<%# String.Format("VideoVideoViewerintro.aspx?id={0}&vid={1}", DataBinder.Eval(Container.DataItem, "VideoFolder"), DataBinder.Eval(Container.DataItem, "VideoLinks")) %>' runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3" height="9">
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" ForeColor="Blue" Text='<%# Eval("vcount", "مرات المشاهدة  {0}") %>'>
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <ContentStyle>
                        <Border BorderStyle="None" />
                        <BorderLeft BorderStyle="None" />
                        <BorderTop BorderStyle="None" />
                        <BorderRight BorderStyle="None" />
                        <BorderBottom BorderStyle="None" />
                    </ContentStyle>
                    <PagerStyle>
                    <Border BorderStyle="None" />
                    </PagerStyle>
                    <EmptyDataStyle>
                        <Border BorderStyle="None" />
                        <BorderLeft BorderStyle="None" />
                        <BorderTop BorderStyle="None" />
                        <BorderRight BorderStyle="None" />
                        <BorderBottom BorderStyle="None" />
                    </EmptyDataStyle>
                    <Border BorderStyle="None" />
                    <BorderLeft BorderStyle="None" />
                    <BorderTop BorderStyle="None" />
                    <BorderRight BorderStyle="None" />
                    <BorderBottom BorderStyle="None" />
                </dx:ASPxDataView>
            </td>
        </tr>
    </table>
</asp:Content>

