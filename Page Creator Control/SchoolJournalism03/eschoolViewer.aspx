<%@ Page Title="" Language="C#" MasterPageFile="masteruser.master" AutoEventWireup="true" CodeFile="eschoolViewer.aspx.cs" Inherits="AboutViewer" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFormLayout" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxDataView" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .auto-style1 {
            width: 22px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
            <asp:AccessDataSource ID="DSData" runat="server" 
                DataFile="Data/FlexibleData.mdb" 
                SelectCommand="SELECT * FROM [school]">
            </asp:AccessDataSource>
            <table align="center" class="auto-style1">
                <tr>
                    <td style="text-align: center">&nbsp;</td>
                </tr>
                <tr>
                    <td style="text-align: center">
                        <dx:ASPxDataView ID="ASPxDataViewMain" runat="server" AlwaysShowPager="True" 
                            DataSourceID="DSData" EmptyDataText="لا يوجد بيانات" 
                            EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" 
                            EnableTheming="True" LoadingPanelText="جاري التحميل&amp;hellip;" 
                            style="margin-bottom: 0px" Theme="PlasticBlue" Width="700px" ColumnCount="2" 
                            RowPerPage="4">
                            <ItemTemplate>
                                <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="2" 
                                    EnableTheming="True" RightToLeft="True" Theme="iOS" Font-Bold="False" 
                                    style="text-align: right" Width="308px">
                                    <Items>
                                        <dx:LayoutItem Caption="address" ColSpan="2" HorizontalAlign="Right" 
                                            ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxLabel ID="ASPxFormLayout1_E2" runat="server" Font-Size="Medium" 
                                                        Text='<%# Eval("address") %>' Theme="iOS" Font-Bold="True" 
                                                        Font-Underline="True">
                                                    </dx:ASPxLabel>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                            <CaptionSettings Location="Right" />
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="smallinfo" ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxMemo ID="ASPxFormLayout1_E9" runat="server" EnableTheming="True" 
                                                        Font-Size="Small" Height="82px" ReadOnly="True" Text='<%# Eval("smallinfo") %>' 
                                                        Theme="iOS" Width="211px" Font-Bold="True" BackColor="#E5EECF">
                                                        <Border BorderStyle="None" />
                                                    </dx:ASPxMemo>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Layout Item" RowSpan="2" ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxImage ID="ASPxFormLayout1_E1" runat="server" Height="95px" 
                                                        ImageUrl='<%# Eval("primg", "schoolPhoto/{0}") %>' Width="115px">
                                                    </dx:ASPxImage>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                        <dx:LayoutItem Caption="Layout Item" HorizontalAlign="Center" 
                                            ShowCaption="False">
                                            <LayoutItemNestedControlCollection>
                                                <dx:LayoutItemNestedControlContainer runat="server" 
                                                    SupportsDisabledAttribute="True">
                                                    <dx:ASPxHyperLink ID="ASPxFormLayout1_E3" runat="server" Font-Bold="True" 
                                                        Font-Underline="True" NavigateUrl='<%# Eval("aboutid", "schoolPageViewer.aspx?id={0}") %>' Text="المزيد ...&gt;&gt;">
                                                    </dx:ASPxHyperLink>
                                                </dx:LayoutItemNestedControlContainer>
                                            </LayoutItemNestedControlCollection>
                                        </dx:LayoutItem>
                                    </Items>
                                    <Styles>
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

