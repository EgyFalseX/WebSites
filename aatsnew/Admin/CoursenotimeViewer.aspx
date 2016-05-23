<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="CoursenotimeViewer.aspx.cs" Inherits="CoursenotimeViewer" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>


<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxDataView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFormLayout" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
<body>

<table align="center" style="height: 215px; width: 100px">
    <tr>
        <td dir="ltr">
            <dx:ASPxComboBox ID="CBExporter" runat="server" 
                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                onbuttonclick="CBExporter_ButtonClick" 
                SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" 
                Theme="iOS" ClientVisible="False" Width="181px">
                <Items>
                    <dx:ListEditItem Text="Rtf" Value="Rtf" />
                    <dx:ListEditItem Text="Pdf" Value="Pdf" />
                    <dx:ListEditItem Text="Xls" Value="Xls" />
                    <dx:ListEditItem Text="Xlsx" Value="Xlsx" />
                    <dx:ListEditItem Text="Csv" Value="Csv" />
                </Items>
                <LoadingPanelImage Url="../App_Themes/PlasticBlue/Editors/Loading.gif">
                </LoadingPanelImage>
                <Buttons>
                    <dx:EditButton Text="تصدير" Width="50px">
                    </dx:EditButton>
                </Buttons>
                <ValidationSettings>
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px" />
                    </ErrorFrameStyle>
                </ValidationSettings>
            </dx:ASPxComboBox>
        </td>
    </tr>
    <tr>
        <td dir="ltr" style="text-align: center">
            <dx:ASPxDataView ID="ASPxDataView1" runat="server" DataSourceID="DSData" 
                EnableTheming="True" Theme="DevEx" ColumnCount="4">
                <ItemTemplate>
                    <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" ColCount="2" 
                        EnableTheming="True" RightToLeft="True" Theme="Office2010Black" Width="152px">
                        <Items>
                            <dx:LayoutItem Caption="الموضوع" ColSpan="2" ShowCaption="False" HorizontalAlign="Center">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxLabel ID="ASPxFormLayout1_E1" runat="server" Text='<%# Eval("CourseName") %>' Font-Bold="True" Font-Size="Medium" Font-Names="Arial" ForeColor="#000099">
                                        </dx:ASPxLabel>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                                <CaptionSettings Location="Top" VerticalAlign="Middle" />
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="الصورة" ShowCaption="False" ColSpan="2">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxImage ID="ASPxFormLayout1_E3" runat="server" Height="91px" ImageUrl='<%# Eval("CourseId", "~/CourseNoTimeFiles/{0}-1.jpg") %>' Width="125px">
                                        </dx:ASPxImage>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="Layout Item" ColSpan="2" ShowCaption="False">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxLabel ID="ASPxFormLayout1_E5" runat="server" Text='<%# Eval("StartDate", "{0:yyyy-MM-dd}") %>' Font-Bold="True">
                                        </dx:ASPxLabel>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="التفاصيل" ColSpan="2" ShowCaption="False" HorizontalAlign="Center">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxHyperLink ID="ASPxFormLayout1_E4" runat="server" NavigateUrl='<%# Eval("CourseId", "ViewCourseNoTimeDetailsViewer.aspx?CourseId={0}") %>' Text="عرض التفاصيل" Font-Bold="True">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                            <dx:LayoutItem Caption="التفاصيل" ColSpan="2" ShowCaption="False" HorizontalAlign="Center">
                                <LayoutItemNestedControlCollection>
                                    <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server" SupportsDisabledAttribute="True">
                                        <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" NavigateUrl='<%# Eval("CourseId", "Reservation.aspx?id={0}") %>' Text="احجز الان" Font-Bold="True">
                                        </dx:ASPxHyperLink>
                                    </dx:LayoutItemNestedControlContainer>
                                </LayoutItemNestedControlCollection>
                            </dx:LayoutItem>
                        </Items>
                    </dx:ASPxFormLayout>
                </ItemTemplate>
            </dx:ASPxDataView>
        </td>
    </tr>
    <tr>
        <td>
            <asp:AccessDataSource ID="DSData" runat="server" 
                DataFile="~/App_Data/AATSWEB.mdb" 
                
                
                
                SelectCommand="SELECT [CourseId], [CourseName], [StartDate], [EndDate], [imageline1] FROM [TBLCoursesnotime] WHERE ([ShowOnline] = ?)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="True" Name="ShowOnline" Type="Boolean" />
                </SelectParameters>
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

