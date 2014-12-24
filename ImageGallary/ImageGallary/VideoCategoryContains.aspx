﻿<%@ Page Title="" Language="C#" MasterPageFile="masterVideo.master" AutoEventWireup="true" CodeFile="VideoCategoryContains.aspx.cs" Inherits="VideoCategoryContains" %>

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
                <dx:ASPxDataView ID="ASPxDataViewData" runat="server" Width="700px">
                    <ItemTemplate>
                        <table align="center">
                            <tr>
                                <td style="text-align: center">
                                    <dx:ASPxImage ID="ASPxImage1" runat="server" Height="128" Width="128" ImageUrl='<%# Eval("VideoLinks", "http://img.youtube.com/vi/{0}/0.jpg") %>'>
                                    </dx:ASPxImage>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center">
                                    <dx:ASPxHyperLink ID="ASPxHyperLinkVideo" Text='<%# Eval("VideoName") %>' NavigateUrl='<%# Eval("VideoLinks", "VideoPlayer.aspx?id={0}") %>' runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center">
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" ForeColor="Blue" Text='<%# Eval("vcount", "مرات المشاهدة  {0}") %>'>
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center">
                                    <!-- AddThis Button BEGIN -->
                                    <script type="text/javascript">
                                        //<!--
                                        var addthis_product = 'wpp-250';
                                        var addthis_append_data = 'true';

                                        //-->
                                    </script>
                                    <div class="addthis_container addthis_toolbox addthis_default_style" addthis:url='<%# Eval("VideoLinks", MapPath("~/ImageGallary/ImageGallary/") + "VideoPlayer.aspx?id={0}") %>'
                                        addthis:title='<%# Eval("VideoName") %>'>
                                        <a href="http://www.addthis.com/bookmark.php?v=250&amp;username=" class="addthis_button_compact">Share</a><span class="addthis_separator">|</span><a class="addthis_button_tweet"></a><a
                                            class="addthis_button_facebook_like"></a><script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#username="></script>
                                    </div>
                                    <!-- AddThis Button END -->
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </dx:ASPxDataView>
            </td>
        </tr>
    </table>
</asp:Content>

