<%@ Page Title="" Language="C#" MasterPageFile="masteruser.master" AutoEventWireup="true" CodeFile="AboutViewer.aspx.cs" Inherits="AboutViewer" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFormLayout" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxDataView" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .auto-style1 {
            width: 100px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
            <asp:AccessDataSource ID="DSData" runat="server" 
                DataFile="~/App_Data/frsan.mdb" 
                SelectCommand="SELECT * FROM [about]">
            </asp:AccessDataSource>
            <table align="center" class="auto-style1">
                <tr>
                    <td style="text-align: center">&nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <dx:ASPxDataView ID="ASPxDataViewMain" runat="server" AlwaysShowPager="True" DataSourceID="DSData" EmptyDataText="لا يوجد بيانات" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" EnableTheming="True" LoadingPanelText="جاري التحميل&amp;hellip;" style="margin-bottom: 0px" Theme="Office2010Silver" Width="700px" ColumnCount="2">
                            <ItemTemplate>
                                <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="2" EnableTheming="True" RightToLeft="True" Theme="iOS" Font-Bold="False">
                                    <Items>
                                        <dx:LayoutItem Caption="address" ColSpan="2" HorizontalAlign="Center" ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxLabel ID="ASPxFormLayout1_E2" runat="server" Font-Size="Small" Text='<%# Eval("address") %>' Theme="iOS">
                                                    </dx:ASPxLabel>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="smallinfo" ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxMemo ID="ASPxFormLayout1_E9" runat="server" EnableTheming="True" Font-Size="Small" Height="71px" ReadOnly="True" Text='<%# Eval("smallinfo") %>' Theme="iOS" Width="250px">
                                                    </dx:ASPxMemo>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Layout Item" RowSpan="2" ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxImage ID="ASPxFormLayout1_E1" runat="server" Height="96px" ImageUrl='<%# Eval("primg", "AboutPhoto/{0}") %>' Width="96px">
                                                    </dx:ASPxImage>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxHyperLink ID="ASPxFormLayout1_E10" runat="server" EnableTheming="True" Font-Size="Small" NavigateUrl='<%# Eval("aboutid", "AboutPageViewer.aspx?id={0}") %>' Text="التفاصيل" Theme="iOS">
                                                    </dx:ASPxHyperLink>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                    <Styles>
                                        <LayoutGroupBox>
                                        </LayoutGroupBox>
                                        <LayoutItem>
                                            <Caption Font-Bold="False" Font-Size="Smaller">
                                            </Caption>
                                        </LayoutItem>
                                    </Styles>
                                </dx:ASPxFormLayout>
                            </ItemTemplate>
                            <ItemStyle Font-Bold="False" />
                        </dx:ASPxDataView>
                    </td>
                </tr>
    </table>
            </asp:Content>

