<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="NViewDetails.aspx.cs" Inherits="ViewMenu" Title="بيانات ومعلومات" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxDataView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFormLayout" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <dx:ASPxDataView ID="ASPxDataView1" runat="server" 
    DataSourceID="DataSourceAccess" Theme="BlackGlass" Width="850px" 
        ColumnCount="1" RowPerPage="1">
        <ItemTemplate>
            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" RightToLeft="True" style="text-align: right" Theme="iOS">
                <Items>
                    <dx:LayoutItem Caption="Layout Item" Height="237px" ShowCaption="False" Width="749px">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxImage ID="ASPxFormLayout1_E1" runat="server" Height="237px" ImageUrl='<%# Eval("Itempic") %>' Width="749px">
                                </dx:ASPxImage>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="أهداف الدورة" HorizontalAlign="Right">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxLabel ID="ASPxFormLayout1_E2" runat="server" Text='<%# Eval("hadaf") %>' Theme="iOS">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="المتسهدفين" HorizontalAlign="Right">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxLabel ID="ASPxFormLayout1_E3" runat="server" Text='<%# Eval("mostahdafeen") %>' Theme="iOS">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="المحتوى" HorizontalAlign="Right">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxLabel ID="ASPxFormLayout1_E9" runat="server" Text='<%# Eval("mohtowa") %>' Theme="iOS">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="المادة التدريبية" HorizontalAlign="Right">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxLabel ID="ASPxFormLayout1_E4" runat="server" Text='<%# Eval("mada") %>' Theme="iOS">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="الشهادات" HorizontalAlign="Right">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxLabel ID="ASPxFormLayout1_E5" runat="server" Text='<%# Eval("shada") %>' Theme="iOS">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="عدد الساعات" HorizontalAlign="Right">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxLabel ID="ASPxFormLayout1_E6" runat="server" Text='<%# Eval("dhour") %>' Theme="iOS">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="سعر الدورة" HorizontalAlign="Right">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxLabel ID="ASPxFormLayout1_E8" runat="server" Text='<%# Eval("dprice") %>' Theme="iOS">
                                </dx:ASPxLabel>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Layout Item" HorizontalAlign="Center" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxHyperLink ID="ASPxFormLayout1_E7" runat="server" NavigateUrl="Apply.aspx" Text="الحجز" Theme="iOS">
                                </dx:ASPxHyperLink>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:ASPxFormLayout>
        </ItemTemplate>
    </dx:ASPxDataView>

    <asp:AccessDataSource ID="DataSourceAccess" runat="server" 
    DataFile="Data/FlexibleData.mdb" 
    SelectCommand="SELECT ItemdID, ItemID, Itempic, hadaf, mostahdafeen, mohtowa, mada, shada, dhour, dprice FROM Menudetails WHERE (ItemID = ?) ORDER BY ItemdID DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="?" QueryStringField="id" />
        </SelectParameters>
</asp:AccessDataSource>
    </asp:Content>

