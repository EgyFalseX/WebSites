<%@ Page Title="" Language="C#" MasterPageFile="~/frsan/masteruser.master" AutoEventWireup="true" CodeFile="VoteEditor.aspx.cs" Inherits="VoteEditor" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxDataView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFormLayout" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100px;
        }
.dxflVAMSys { vertical-align: middle; }
.dxflHACSys { text-align: center; }
.dxflVATSys { vertical-align: top; }
.dxflHALSys { text-align: left; }
        .auto-style2 {
            margin-left: auto;
            margin-right: auto;
        }
        .auto-style3 {
            border-collapse: separate;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <table align="center" class="auto-style1" dir="rtl">
        <tr>
            <td style="text-align: center">&nbsp;</td>
        </tr>
        <tr>
            <td style="text-align: center">
                <dx:ASPxDataView ID="ASPxDataViewMain" runat="server" AllowPaging="False" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" RightToLeft="True" RowPerPage="1" Theme="Default">
                    <ItemTemplate>
                        <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" EnableTheming="True" Theme="iOS" Width="200px">
                            <Items>
                                <dx:LayoutItem Caption="Layout Item" HorizontalAlign="Center" ShowCaption="False" VerticalAlign="Middle">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxLabel ID="ASPxFormLayout1_E3" runat="server" Font-Size="Small" Text='<%# Eval("StudentName") %>' Theme="iOS">
                                            </dx:ASPxLabel>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Layout Item" HorizontalAlign="Center" ShowCaption="False" VerticalAlign="Middle" Height="128px">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxImage ID="ASPxFormLayout1_E2" runat="server" Height="128px" ImageUrl='<%# Eval("stid", "../desoft/database/photo/picstudent/{0}.jpg") %>' Width="128px">
                                            </dx:ASPxImage>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxProgressBar ID="ASPxFormLayout1_E4" runat="server" CustomDisplayFormat="" Font-Bold="True" Font-Size="Small" Height="1px" RightToLeft="False" Theme="iOS" Width="200px" Position='<%# Convert.ToInt32(Eval("Contribution")) %>'>
                                            </dx:ASPxProgressBar>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="الاصوات" HorizontalAlign="Center" ShowCaption="False" VerticalAlign="Middle">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxLabel ID="ASPxFormLayout1_E1" runat="server" Font-Size="Small" Text='<%# Eval("VoteCount" , "{0} صوت") %>' Theme="iOS">
                                            </dx:ASPxLabel>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                                <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxButton ID="btnVote" runat="server" CommandArgument='<%# Eval("autoid") %>' Enabled='<%# ConvertToBool(Convert.ToBoolean(Eval("EnableVote"))) %>' OnClick="btnVote_Click" Text="صوت" Theme="iOS">
                                            </dx:ASPxButton>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:ASPxFormLayout>
                    </ItemTemplate>
                    <PagerSettings ShowSeparators="True">
                        <Summary Text="صفحة {0} من {1}" />
                    </PagerSettings>
                    <PagerStyle Font-Bold="False" ItemSpacing="20px" SeparatorWidth="5px" Spacing="20px"></PagerStyle>
                    <PagerButtonStyle Font-Bold="False">
                    </PagerButtonStyle>
                </dx:ASPxDataView>
            </td>
        </tr>
    </table>
</asp:Content>

