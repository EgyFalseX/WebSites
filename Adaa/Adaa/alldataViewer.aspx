<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="alldataViewer.aspx.cs" Inherits="alldataViewer" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>


<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>


<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function OnRowValues(values) {
            var fName1 = values[0];
            HtmlEditorViewer.SetHtml(fName1);
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">


    <table align="center">
        <tr>
            <td dir="ltr" style="text-align: right">
                <dx:ASPxComboBox ID="ASPxCBreporttypeid" runat="server" DataSourceID="DSCdreportno" Font-Size="12pt" RightToLeft="True" TextField="reportno" ValueField="reportnoid" Width="250px" DropDownStyle="DropDown">
                    <Columns>
                        <dx:ListBoxColumn Caption="اسم النوع" FieldName="reportno" />
                    </Columns>
                </dx:ASPxComboBox>
            </td>
            <td dir="ltr" style="text-align: right" width="100">
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Size="12pt" Text="نوع الاستمارة">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td dir="ltr">
                <dx:ASPxButton ID="btnSelect" runat="server" OnClick="btnSelect_Click" Text="اختر" Width="120px">
                </dx:ASPxButton>
            </td>
            <td dir="ltr">
                &nbsp;</td>
        </tr>
        <tr>
            <td dir="ltr" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <dx:ASPxGridView ID="GVEditor" runat="server" AutoGenerateColumns="False"
                    Caption="البيــــــــــا نـــــــــــــــات" DataSourceID="DSData"
                    KeyFieldName="dataid" RightToLeft="True"
                    SummaryText="الملخص" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"
                    CssPostfix="PlasticBlue" EnableTheming="True" Font-Bold="True" ClientInstanceName="grid">
                    <TotalSummary>
                        <dx:ASPxSummaryItem DisplayFormat="العـدد : {0}" FieldName="dataid"
                            ShowInColumn="نوع الاستمارة" ShowInGroupFooterColumn="نوع الاستمارة" SummaryType="Count" />
                    </TotalSummary>
                    <Columns>
                        <dx:GridViewDataComboBoxColumn Caption="نوع الاستمارة" FieldName="reporttypeid" VisibleIndex="0">
                            <PropertiesComboBox DataSourceID="DSCdreporttype" TextField="reporttype" ValueField="reporttypeid" DropDownStyle="DropDown" IncrementalFilteringMode="StartsWith">
                                <Columns>
                                    <dx:ListBoxColumn Caption="الاسم" FieldName="reporttype" />
                                </Columns>
                                <ValidationSettings>
                                    <RequiredField ErrorText="من فضلك اختر نوع الاستمارة" IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesComboBox>
                            <Settings AllowAutoFilter="True" FilterMode="DisplayText" SortMode="DisplayText" />
                            <EditFormSettings ColumnSpan="2" />
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataComboBoxColumn Caption="رقم المتابعة" FieldName="reportnoid" VisibleIndex="1">
                            <PropertiesComboBox DataSourceID="DSCdreportno" TextField="reportno" ValueField="reportnoid" DropDownStyle="DropDown" IncrementalFilteringMode="StartsWith">
                                <Columns>
                                    <dx:ListBoxColumn Caption="الاسم" FieldName="reportno" />
                                </Columns>
                                <ValidationSettings>
                                    <RequiredField ErrorText="من فضلك اختر رقم المتابعة" IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesComboBox>
                            <Settings AllowAutoFilter="True" FilterMode="DisplayText" SortMode="DisplayText" />
                            <EditFormSettings ColumnSpan="2" />
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataComboBoxColumn Caption="اسم الموظف" FieldName="empid" VisibleIndex="2">
                            <PropertiesComboBox DataSourceID="DSemp" TextField="empname" ValueField="empid" DropDownStyle="DropDown" IncrementalFilteringMode="StartsWith">
                                <Columns>
                                    <dx:ListBoxColumn Caption="الاسم" FieldName="empname" />
                                </Columns>
                                <ValidationSettings>
                                    <RequiredField ErrorText="من فضلك اختر اسم الموظف" IsRequired="True" />
                                </ValidationSettings>
                            </PropertiesComboBox>
                            <Settings AllowAutoFilter="True" FilterMode="DisplayText" SortMode="DisplayText" />
                            <EditFormSettings ColumnSpan="2" />
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataDateColumn Caption="تاريخ الادخال" FieldName="datein" VisibleIndex="3">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataHyperLinkColumn Caption="عرض البيان" FieldName="dataid" VisibleIndex="5">
                            <PropertiesHyperLinkEdit NavigateUrlFormatString="ViewData.aspx?dataid={0}" TextFormatString="عرض البيان" Target="_blank">
                            </PropertiesHyperLinkEdit>
                        </dx:GridViewDataHyperLinkColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True"
                        SortMode="DisplayText" ColumnResizeMode="Control" />
                    <SettingsPager ShowDefaultImages="False">
                        <AllButton Text="All">
                        </AllButton>
                        <NextPageButton Text="Next &gt;">
                        </NextPageButton>
                        <PrevPageButton Text="&lt; Prev">
                        </PrevPageButton>
                        <Summary AllPagesText="صفحات :  {0} - {1} ({2} عناصر)" Position="Right"
                            Text="صفحه {0} of {1} ({2} عنصر)" />
                    </SettingsPager>
                    <Settings ShowFilterBar="Visible" ShowFilterRow="True" ShowFilterRowMenu="True"
                        ShowFooter="True" ShowGroupPanel="True" ShowHeaderFilterButton="True"
                        ShowTitlePanel="True" />
                    <SettingsText CommandCancel="الغاء" CommandClearFilter="مسح التصفيه"
                        CommandDelete="حذف" CommandEdit="تعديل" CommandNew="جديد" CommandSelect="اختار"
                        CommandUpdate="تحديث" ConfirmDelete="هل انت متأكد؟"
                        CustomizationWindowCaption="خيارات" EmptyDataRow="فارغ" EmptyHeaders="راس فارغ"
                        FilterBarClear="مسح التصفبه" FilterBarCreateFilter="صناعة تصفيه"
                        FilterControlPopupCaption="خيارات التصفيه"
                        GroupContinuedOnNextPage="تستكمل المجموعه في الصفحه القادمه"
                        GroupPanel="اسحب عمود ثم افلته هنا لصناعه مجموعه"
                        HeaderFilterShowAll="اظهار الكل" HeaderFilterShowBlanks="اظهار الفارغ"
                        HeaderFilterShowNonBlanks="اظهار غير الفارغ"
                        PopupEditFormCaption="صفحة المحرر" />
                    <SettingsPopup>
                        <EditForm AllowResize="True" HorizontalAlign="WindowCenter" Modal="True" />
                    </SettingsPopup>
                    <Images SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                        <LoadingPanelOnStatusBar Url="~/App_Themes/PlasticBlue/GridView/gvLoadingOnStatusBar.gif">
                        </LoadingPanelOnStatusBar>
                        <LoadingPanel Url="~/App_Themes/PlasticBlue/GridView/Loading.gif">
                        </LoadingPanel>
                    </Images>
                    <ImagesFilterControl>
                        <LoadingPanel Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                        </LoadingPanel>
                    </ImagesFilterControl>
                    <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"
                        CssPostfix="PlasticBlue">
                        <Header ImageSpacing="10px" SortingImageSpacing="10px" Font-Bold="False"
                            Font-Size="Medium">
                        </Header>
                    </Styles>
                    <StylesPager>
                        <CurrentPageNumber Font-Bold="False">
                        </CurrentPageNumber>
                        <PageNumber Font-Bold="False">
                        </PageNumber>
                    </StylesPager>
                    <StylesEditors>
                        <CalendarHeader Spacing="11px">
                        </CalendarHeader>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                </dx:ASPxGridView>
                <dx:ASPxGridViewExporter ID="ASPxGridViewExporterEditor" runat="server"
                    FileName="ContactUSFX" GridViewID="GVEditor" PaperKind="A4">
                </dx:ASPxGridViewExporter>
                <asp:AccessDataSource ID="DSData" runat="server" DataFile="~/App_Data/adaa.mdb"
                    DeleteCommand="DELETE FROM [alldata] WHERE [dataid] = ?" InsertCommand="INSERT INTO [alldata] ([dataid], [reporttypeid], [reportnoid], [empid], [datapath], [datein]) VALUES (?, ?, ?, ?, ?, date())" SelectCommand="SELECT [dataid], [reporttypeid], [reportnoid], [empid], [datapath], [datein] FROM [alldata]
WHERE reporttypeid = ?
order by  [datein] "
                    UpdateCommand="UPDATE [alldata] SET [reporttypeid] = ?, [reportnoid] = ?, [empid] = ?, [datapath] = ?, [datein] = date() WHERE [dataid] = ?">
                    <DeleteParameters>
                        <asp:Parameter Name="dataid" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="dataid" Type="Int32" />
                        <asp:Parameter Name="reporttypeid" Type="Byte" />
                        <asp:Parameter Name="reportnoid" Type="Byte" />
                        <asp:Parameter Name="empid" Type="Int32" />
                        <asp:Parameter Name="datapath" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="0" Name="?" QueryStringField="eporttypeid" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="reporttypeid" Type="Byte" />
                        <asp:Parameter Name="reportnoid" Type="Byte" />
                        <asp:Parameter Name="empid" Type="Int32" />
                        <asp:Parameter Name="datapath" Type="String" />
                        <asp:Parameter Name="dataid" Type="Int32" />
                    </UpdateParameters>
                </asp:AccessDataSource>
                <asp:AccessDataSource ID="DSCdreporttype" runat="server" DataFile="~/App_Data/adaa.mdb" SelectCommand="SELECT [reporttypeid], [reporttype] FROM [Cdreporttype]"></asp:AccessDataSource>
                <asp:AccessDataSource ID="DSCdreportno" runat="server" DataFile="~/App_Data/adaa.mdb" SelectCommand="SELECT [reportnoid], [reportno] FROM [Cdreportno]"></asp:AccessDataSource>
                <asp:AccessDataSource ID="DSemp" runat="server" DataFile="~/App_Data/adaa.mdb" SelectCommand="SELECT [empid], [empname] FROM [emp]"></asp:AccessDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

