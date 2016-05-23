<%@ Page Title="" Language="C#" MasterPageFile="masterpage.master" AutoEventWireup="true" CodeFile="SubjectViewer.aspx.cs" Inherits="SubjectViewer" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>


<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxDataView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFormLayout" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
<body>

<table align="center">
    <tr>
        <td dir="ltr" style="text-align: center">
            <dx:ASPxDataView ID="ASPxDataView1" runat="server" DataSourceID="DSData" 
                EnableTheming="True" Theme="Default">
                <ItemTemplate>
                    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="2" 
                        EnableTheming="True" RightToLeft="True" Theme="Office2010Black" Width="192px">
                        <Items>
                            <dx:LayoutItem Caption="الموضوع" ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxLabel ID="ASPxFormLayout1_E1" runat="server" Text='<%# Eval("address") %>' Font-Bold="True" Font-Size="Small">
                                        </dx:ASPxLabel>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionSettings Location="Top" VerticalAlign="Middle" />
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="الصورة" ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxImage ID="ASPxFormLayout1_E3" runat="server" Height="93px" ImageUrl='<%# Eval("primg", "schoolPhoto/{0}") %>' Width="99px">
                                        </dx:ASPxImage>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="معلومات" ColSpan="2">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxMemo ID="ASPxFormLayout1_E2" runat="server" Height="71px" 
                                            ReadOnly="True" Text='<%# Eval("smallinfo") %>' Width="184px">
                                            <Border BorderStyle="None" />
                                        </dx:ASPxMemo>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionSettings Location="Top" />
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="التفاصيل" ColSpan="2" ShowCaption="False" HorizontalAlign="Center">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxHyperLink ID="ASPxFormLayout1_E4" runat="server" NavigateUrl='<%# Eval("aboutid", "ViewDetails.aspx?id={0}") %>' Text="عرض التقرير" Font-Bold="True">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:ASPxFormLayout>
                </ItemTemplate>
                <Paddings Padding="1px" />
                <ItemStyle>
                <Paddings Padding="1px" />
                </ItemStyle>
            </dx:ASPxDataView>
        </td>
    </tr>
    <tr>
        <td>
            <asp:AccessDataSource ID="DSData" runat="server" 
                DataFile="App_Data/DataDB.mdb" 
                
                
                
                SelectCommand="SELECT [aboutid], [address], [smallinfo], [primg] FROM [school] ORDER BY [aboutid] DESC">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DScdmonth" runat="server" 
                DataFile="App_Data/DataDB.mdb" 
                
                
                SelectCommand="SELECT [monthid], [monthname] FROM [cdmonth]">
            </asp:AccessDataSource>
            <dx:ASPxGridViewExporter ID="ASPxGridViewExporterEditor" runat="server" 
                FileName="ContactUSFX" GridViewID="GVEditor" PaperKind="A4">
            </dx:ASPxGridViewExporter>
        </td>
    </tr>
    </table>
    
<dx:ASPxPopupControl ID="ASPxPopupControlEditor" runat="server" 
    AllowDragging="True" ClientInstanceName="popupeditor" 
    CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
    HeaderText="رسالـــه" 
    Modal="True" PopupHorizontalAlign="WindowCenter" 
    PopupVerticalAlign="WindowCenter" RightToLeft="True" 
    SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" Height="120px" 
    Width="300px" style="text-align: center" 
    Font-Bold="False" Theme="iOS">
    <LoadingPanelImage Url="../App_Themes/PlasticBlue/Web/dvLoading.gif">
    </LoadingPanelImage>
    <CloseButtonStyle>
        <Paddings Padding="0px" />
    </CloseButtonStyle>
    <ContentStyle Font-Bold="True" Font-Size="Medium" Font-Underline="False">
        <BorderBottom BorderColor="#E0E0E0" BorderStyle="Solid" BorderWidth="1px" />
    </ContentStyle>
    <HeaderStyle>
    <Paddings PaddingLeft="10px" PaddingBottom="4px" PaddingRight="4px" 
        PaddingTop="4px" />
    </HeaderStyle>
    <ContentCollection>

<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">تم</dx:PopupControlContentControl>

</ContentCollection>
</dx:ASPxPopupControl>


    

</asp:Content>

