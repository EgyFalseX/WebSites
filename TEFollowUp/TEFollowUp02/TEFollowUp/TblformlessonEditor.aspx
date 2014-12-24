<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="TblformlessonEditor.aspx.cs" Inherits="TblformlessonEditor" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxTabControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">

<table align="center">
    <tr>
        <td dir="ltr">
            <dx:ASPxComboBox ID="CBExporter" runat="server" 
                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                onbuttonclick="CBExporter_ButtonClick" 
                SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" 
                Theme="SoftOrange">
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
        <td style="text-align: center">
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            <dx:ASPxGridView ID="GVEditor" runat="server" AutoGenerateColumns="False" 
                Caption="البيــــــــــا نـــــــــــــــات" DataSourceID="DSData" 
                KeyFieldName="lessonid" RightToLeft="True" 
                SummaryText="الملخص" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" 
                CssPostfix="PlasticBlue" EnableTheming="True" 
                onrowdeleted="GVEditor_RowDeleted" onrowupdated="GVEditor_RowUpdated" 
                onrowinserted="GVEditor_RowInserted" Font-Bold="True" Theme="SoftOrange" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" KeyboardSupport="True">
                <ClientSideEvents EndCallback="function(s, e) {
	
	  if(typeof(s.cpShowPopup) != 'undefined')
		{
                popupeditor.SetContentHTML(s.cpShowPopup);
				popupeditor.Show();
		} 
}" BeginCallback="function(s, e) {
s.cpShowPopup = undefined;
}" />
                <TotalSummary>
                    <dx:ASPxSummaryItem DisplayFormat="العـدد : {0}" FieldName="addno" 
                        ShowInColumn="coname" ShowInGroupFooterColumn="coname" SummaryType="Count" />
                </TotalSummary>
                <Columns>
                    <dx:GridViewCommandColumn ButtonType="Image" Caption="العمليات" 
                        VisibleIndex="0">
                        <EditButton Visible="True">
                            <Image Url="images/edit.png" Width="26px">
                            </Image>
                        </EditButton>
                        <NewButton Visible="True">
                            <Image Url="images/insert.png" Width="26px">
                            </Image>
                        </NewButton>
                        <DeleteButton Text="حذف" Visible="True">
                            <Image Url="images/delete.png" Width="26px">
                            </Image>
                        </DeleteButton>
                        <SelectButton>
                            <Image Url="images/accept.png">
                            </Image>
                        </SelectButton>
                        <CancelButton>
                            <Image Url="images/delete.png">
                            </Image>
                        </CancelButton>
                        <UpdateButton>
                            <Image Url="images/accept.png">
                            </Image>
                        </UpdateButton>
                        <ClearFilterButton Visible="True">
                        </ClearFilterButton>
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataComboBoxColumn Caption="المدرسة" FieldName="schoolid" VisibleIndex="3">
                        <PropertiesComboBox DataSourceID="DSSchoolid" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="StartsWith" TextField="schoolname" ValueField="schoolid">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataDateColumn Caption="التاريخ" FieldName="lessondate" VisibleIndex="1">
                        <PropertiesDateEdit DisplayFormatString="d/M/yyyy">
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataComboBoxColumn Caption="الصف" FieldName="safid" VisibleIndex="5">
                        <PropertiesComboBox DataSourceID="DSsafid" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="StartsWith" TextField="saf" ValueField="safid">
                            <Columns>
                                <dx:ListBoxColumn FieldName="saf" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="المدرس" FieldName="empid" VisibleIndex="4">
                        <PropertiesComboBox DataSourceID="DSempid" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="StartsWith" TextField="empname" ValueField="empid">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="الفصل" FieldName="faslid" VisibleIndex="6">
                        <PropertiesComboBox DataSourceID="DSfaslid" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="StartsWith" TextField="fasl" ValueField="faslid">
                            <Columns>
                                <dx:ListBoxColumn FieldName="fasl" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="الحصة" FieldName="hesaid" VisibleIndex="7">
                        <PropertiesComboBox DataSourceID="DShesaid" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="StartsWith" TextField="hesa" ValueField="hesaid">
                            <Columns>
                                <dx:ListBoxColumn FieldName="hesa" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="المادة" FieldName="madaid" VisibleIndex="8">
                        <PropertiesComboBox DataSourceID="DSmadaid" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="StartsWith" TextField="madaname" ValueField="madaid">
                            <Columns>
                                <dx:ListBoxColumn FieldName="madaname" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn Caption="المقر" FieldName="place" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="عنوان الدرس" FieldName="lessonaddres" VisibleIndex="10">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataMemoColumn Caption="رأي المشرف" FieldName="moshreftext" VisibleIndex="11">
                        <PropertiesMemoEdit Height="100px">
                        </PropertiesMemoEdit>
                        <EditFormSettings ColumnSpan="2" RowSpan="2" />
                    </dx:GridViewDataMemoColumn>
                    <dx:GridViewDataComboBoxColumn Caption="مشرف" FieldName="moshrefid" VisibleIndex="2">
                        <PropertiesComboBox DataSourceID="DSmoshrefid" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="StartsWith" TextField="empname" ValueField="empid">
                            <Columns>
                                <dx:ListBoxColumn FieldName="empname" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataHyperLinkColumn Caption="عرض التقرير" FieldName="lessonid" VisibleIndex="12">
                        <PropertiesHyperLinkEdit NavigateUrlFormatString="XRepViewer01.aspx?id={0}" TextFormatString="عرض التقرير">
                        </PropertiesHyperLinkEdit>
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataHyperLinkColumn>
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" 
                    SortMode="DisplayText" ColumnResizeMode="Control" />
                <SettingsPager ShowDefaultImages="False" PageSize="40">
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
                <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ShowDetailRow="True" />
                <SettingsPopup>
                    <EditForm AllowResize="True" HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="Above" />
                </SettingsPopup>
                <Images SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css">
                    <LoadingPanelOnStatusBar Url="../App_Themes/PlasticBlue/GridView/gvLoadingOnStatusBar.gif">
                    </LoadingPanelOnStatusBar>
                    <LoadingPanel Url="../App_Themes/PlasticBlue/GridView/Loading.gif">
                    </LoadingPanel>
                </Images>
                <ImagesFilterControl>
                    <LoadingPanel Url="../App_Themes/PlasticBlue/Editors/Loading.gif">
                    </LoadingPanel>
                </ImagesFilterControl>
                <Styles CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" 
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
                <Templates>
                    <DetailRow>
                        <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0">
                            <TabPages>
                                <dx:TabPage Text="اهداف الدرس">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxGridView ID="GVEditorTblahdaf" runat="server" AutoGenerateColumns="False" Caption="البيــــــــــا نـــــــــــــــات" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="DSTblahdaf" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" EnableTheming="True" Font-Bold="True" KeyboardSupport="True" KeyFieldName="hadafid" OnBeforePerformDataSelect="GVEditor_BeforePerformDataSelect" OnRowDeleted="GVEditor_RowDeleted" OnRowInserted="GVEditor_RowInserted" OnRowUpdated="GVEditor_RowUpdated" RightToLeft="True" SummaryText="الملخص" Theme="SoftOrange">
                                                <ClientSideEvents BeginCallback="function(s, e) {
s.cpShowPopup = undefined;
}" EndCallback="function(s, e) {
	
	  if(typeof(s.cpShowPopup) != 'undefined')
		{
                popupeditor.SetContentHTML(s.cpShowPopup);
				popupeditor.Show();
		} 
}" />
                                                <TotalSummary>
                                                    <dx:ASPxSummaryItem DisplayFormat="العـدد : {0}" FieldName="addno" ShowInColumn="coname" ShowInGroupFooterColumn="coname" SummaryType="Count" />
                                                </TotalSummary>
                                                <Columns>
                                                    <dx:GridViewCommandColumn ButtonType="Image" Caption="العمليات" ShowInCustomizationForm="True" VisibleIndex="0">
                                                        <EditButton Visible="True">
                                                            <Image Url="images/edit.png" Width="26px">
                                                            </Image>
                                                        </EditButton>
                                                        <NewButton Visible="True">
                                                            <Image Url="images/insert.png" Width="26px">
                                                            </Image>
                                                        </NewButton>
                                                        <DeleteButton Text="حذف" Visible="True">
                                                            <Image Url="images/delete.png" Width="26px">
                                                            </Image>
                                                        </DeleteButton>
                                                        <SelectButton>
                                                            <Image Url="images/accept.png">
                                                            </Image>
                                                        </SelectButton>
                                                        <CancelButton>
                                                            <Image Url="images/delete.png">
                                                            </Image>
                                                        </CancelButton>
                                                        <UpdateButton>
                                                            <Image Url="images/accept.png">
                                                            </Image>
                                                        </UpdateButton>
                                                        <ClearFilterButton Visible="True">
                                                        </ClearFilterButton>
                                                    </dx:GridViewCommandColumn>
                                                    <dx:GridViewDataTextColumn Caption="الهدف" FieldName="hadaf" ShowInCustomizationForm="True" VisibleIndex="1">
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" ConfirmDelete="True" SortMode="DisplayText" />
                                                <SettingsPager PageSize="40" ShowDefaultImages="False">
                                                    <AllButton Text="All">
                                                    </AllButton>
                                                    <NextPageButton Text="Next &gt;">
                                                    </NextPageButton>
                                                    <PrevPageButton Text="&lt; Prev">
                                                    </PrevPageButton>
                                                    <Summary AllPagesText="صفحات :  {0} - {1} ({2} عناصر)" Position="Right" Text="صفحه {0} of {1} ({2} عنصر)" />
                                                </SettingsPager>
                                                <Settings ShowFilterBar="Visible" ShowFilterRow="True" ShowFilterRowMenu="True" ShowFooter="True" ShowGroupPanel="True" ShowHeaderFilterButton="True" ShowTitlePanel="True" />
                                                <SettingsText CommandCancel="الغاء" CommandClearFilter="مسح التصفيه" CommandDelete="حذف" CommandEdit="تعديل" CommandNew="جديد" CommandSelect="اختار" CommandUpdate="تحديث" ConfirmDelete="هل انت متأكد؟" CustomizationWindowCaption="خيارات" EmptyDataRow="فارغ" EmptyHeaders="راس فارغ" FilterBarClear="مسح التصفبه" FilterBarCreateFilter="صناعة تصفيه" FilterControlPopupCaption="خيارات التصفيه" GroupContinuedOnNextPage="تستكمل المجموعه في الصفحه القادمه" GroupPanel="اسحب عمود ثم افلته هنا لصناعه مجموعه" HeaderFilterShowAll="اظهار الكل" HeaderFilterShowBlanks="اظهار الفارغ" HeaderFilterShowNonBlanks="اظهار غير الفارغ" PopupEditFormCaption="صفحة المحرر" />
                                                <SettingsPopup>
                                                    <EditForm AllowResize="True" HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="Above" />
                                                </SettingsPopup>
                                                <Images SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css">
                                                    <LoadingPanelOnStatusBar Url="../App_Themes/PlasticBlue/GridView/gvLoadingOnStatusBar.gif">
                                                    </LoadingPanelOnStatusBar>
                                                    <LoadingPanel Url="../App_Themes/PlasticBlue/GridView/Loading.gif">
                                                    </LoadingPanel>
                                                </Images>
                                                <ImagesFilterControl>
                                                    <LoadingPanel Url="../App_Themes/PlasticBlue/Editors/Loading.gif">
                                                    </LoadingPanel>
                                                </ImagesFilterControl>
                                                <Styles CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
                                                    <Header Font-Bold="False" Font-Size="Medium" ImageSpacing="10px" SortingImageSpacing="10px">
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
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                                <dx:TabPage Text="المشاركون">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxGridView ID="GVEditortbllessonmoshrek" runat="server" AutoGenerateColumns="False" Caption="البيــــــــــا نـــــــــــــــات" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="DStbllessonmoshrek" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" EnableTheming="True" Font-Bold="True" KeyboardSupport="True" KeyFieldName="moshrekid" OnRowDeleted="GVEditor_RowDeleted" OnRowInserted="GVEditor_RowInserted" OnRowUpdated="GVEditor_RowUpdated" RightToLeft="True" SummaryText="الملخص" Theme="SoftOrange">
                                                <ClientSideEvents BeginCallback="function(s, e) {
s.cpShowPopup = undefined;
}" EndCallback="function(s, e) {
	
	  if(typeof(s.cpShowPopup) != 'undefined')
		{
                popupeditor.SetContentHTML(s.cpShowPopup);
				popupeditor.Show();
		} 
}" />
                                                <TotalSummary>
                                                    <dx:ASPxSummaryItem DisplayFormat="العـدد : {0}" FieldName="addno" ShowInColumn="coname" ShowInGroupFooterColumn="coname" SummaryType="Count" />
                                                </TotalSummary>
                                                <Columns>
                                                    <dx:GridViewCommandColumn ButtonType="Image" Caption="العمليات" ShowInCustomizationForm="True" VisibleIndex="0">
                                                        <EditButton Visible="True">
                                                            <Image Url="images/edit.png" Width="26px">
                                                            </Image>
                                                        </EditButton>
                                                        <NewButton Visible="True">
                                                            <Image Url="images/insert.png" Width="26px">
                                                            </Image>
                                                        </NewButton>
                                                        <DeleteButton Text="حذف" Visible="True">
                                                            <Image Url="images/delete.png" Width="26px">
                                                            </Image>
                                                        </DeleteButton>
                                                        <SelectButton>
                                                            <Image Url="images/accept.png">
                                                            </Image>
                                                        </SelectButton>
                                                        <CancelButton>
                                                            <Image Url="images/delete.png">
                                                            </Image>
                                                        </CancelButton>
                                                        <UpdateButton>
                                                            <Image Url="images/accept.png">
                                                            </Image>
                                                        </UpdateButton>
                                                        <ClearFilterButton Visible="True">
                                                        </ClearFilterButton>
                                                    </dx:GridViewCommandColumn>
                                                    <dx:GridViewDataComboBoxColumn Caption="المدرس" FieldName="empid" ShowInCustomizationForm="True" VisibleIndex="1">
                                                        <PropertiesComboBox DataSourceID="DSempid" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="StartsWith" TextField="empname" ValueField="empid">
                                                            <Columns>
                                                                <dx:ListBoxColumn FieldName="empname" />
                                                            </Columns>
                                                        </PropertiesComboBox>
                                                    </dx:GridViewDataComboBoxColumn>
                                                </Columns>
                                                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" ConfirmDelete="True" SortMode="DisplayText" />
                                                <SettingsPager PageSize="40" ShowDefaultImages="False">
                                                    <AllButton Text="All">
                                                    </AllButton>
                                                    <NextPageButton Text="Next &gt;">
                                                    </NextPageButton>
                                                    <PrevPageButton Text="&lt; Prev">
                                                    </PrevPageButton>
                                                    <Summary AllPagesText="صفحات :  {0} - {1} ({2} عناصر)" Position="Right" Text="صفحه {0} of {1} ({2} عنصر)" />
                                                </SettingsPager>
                                                <Settings ShowFilterBar="Visible" ShowFilterRow="True" ShowFilterRowMenu="True" ShowFooter="True" ShowGroupPanel="True" ShowHeaderFilterButton="True" ShowTitlePanel="True" />
                                                <SettingsText CommandCancel="الغاء" CommandClearFilter="مسح التصفيه" CommandDelete="حذف" CommandEdit="تعديل" CommandNew="جديد" CommandSelect="اختار" CommandUpdate="تحديث" ConfirmDelete="هل انت متأكد؟" CustomizationWindowCaption="خيارات" EmptyDataRow="فارغ" EmptyHeaders="راس فارغ" FilterBarClear="مسح التصفبه" FilterBarCreateFilter="صناعة تصفيه" FilterControlPopupCaption="خيارات التصفيه" GroupContinuedOnNextPage="تستكمل المجموعه في الصفحه القادمه" GroupPanel="اسحب عمود ثم افلته هنا لصناعه مجموعه" HeaderFilterShowAll="اظهار الكل" HeaderFilterShowBlanks="اظهار الفارغ" HeaderFilterShowNonBlanks="اظهار غير الفارغ" PopupEditFormCaption="صفحة المحرر" />
                                                <SettingsPopup>
                                                    <EditForm AllowResize="True" HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="Above" />
                                                </SettingsPopup>
                                                <Images SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css">
                                                    <LoadingPanelOnStatusBar Url="../App_Themes/PlasticBlue/GridView/gvLoadingOnStatusBar.gif">
                                                    </LoadingPanelOnStatusBar>
                                                    <LoadingPanel Url="../App_Themes/PlasticBlue/GridView/Loading.gif">
                                                    </LoadingPanel>
                                                </Images>
                                                <ImagesFilterControl>
                                                    <LoadingPanel Url="../App_Themes/PlasticBlue/Editors/Loading.gif">
                                                    </LoadingPanel>
                                                </ImagesFilterControl>
                                                <Styles CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
                                                    <Header Font-Bold="False" Font-Size="Medium" ImageSpacing="10px" SortingImageSpacing="10px">
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
                                        </dx:ContentControl>
                                    </ContentCollection>
                                </dx:TabPage>
                            </TabPages>
                        </dx:ASPxPageControl>
                    </DetailRow>
                </Templates>
            </dx:ASPxGridView>
            <asp:AccessDataSource ID="DSData" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                DeleteCommand="DELETE FROM [tblformlesson] WHERE lessonid = ?" 
                InsertCommand="INSERT INTO [tblformlesson] ([moshrefid], [schoolid], [empid], [safid], [faslid], [lessondate], [hesaid], [madaid], [place], [lessonaddres], [moshreftext], userin, [datein]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, DATE ())" 
                SelectCommand="SELECT [lessonid], [moshrefid], [schoolid], [empid], [safid], [faslid], [lessondate], [hesaid], [madaid], [place], [lessonaddres], [moshreftext], [userin], [datein] FROM [tblformlesson]
WHERE userin = ?" 
                UpdateCommand="UPDATE [tblformlesson] SET  [madaid] = ?, [place] = ?, [lessonaddres] = ?, [moshreftext] = ?, [userin] = ?, [datein] = Date(),  [moshrefid] = ?, [schoolid] = ?, [empid] = ?, [safid] = ?, [faslid] = ?, [lessondate] = ?, [hesaid] = ? WHERE [lessonid] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="lessonid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="moshrefid" Type="Int32" />
                    <asp:Parameter Name="schoolid" Type="Int32" />
                    <asp:Parameter Name="empid" Type="Int32" />
                    <asp:Parameter Name="safid" Type="Int32" />
                    <asp:Parameter Name="faslid" Type="Int32" />
                    <asp:Parameter Name="lessondate" Type="DateTime" />
                    <asp:Parameter Name="hesaid" Type="Int32" />
                    <asp:Parameter Name="madaid" Type="Int32" />
                    <asp:Parameter Name="place" Type="String" />
                    <asp:Parameter Name="lessonaddres" Type="String" />
                    <asp:Parameter Name="moshreftext" Type="String" />
                    <asp:SessionParameter Name="userin" SessionField="UserIDTEFollowUp" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="?" SessionField="UserIDTEFollowUp" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="madaid" Type="Int32" />
                    <asp:Parameter Name="place" Type="String" />
                    <asp:Parameter Name="lessonaddres" Type="String" />
                    <asp:Parameter Name="moshreftext" Type="String" />
                    <asp:SessionParameter Name="userin" SessionField="UserIDTEFollowUp" Type="Int32" />
                    <asp:Parameter Name="moshrefid" Type="Int32" />
                    <asp:Parameter Name="schoolid" Type="Int32" />
                    <asp:Parameter Name="empid" Type="Int32" />
                    <asp:Parameter Name="safid" Type="Int32" />
                    <asp:Parameter Name="faslid" Type="Int32" />
                    <asp:Parameter Name="lessondate" Type="DateTime" />
                    <asp:Parameter Name="hesaid" Type="Int32" />
                    <asp:Parameter Name="lessonid" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSmoshrefid" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT [empid], [empname] FROM [tblempdata] WHERE ([moshref] = -1)">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSSchoolid" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT [schoolid], [schoolname] FROM [cdschool]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSsafid" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT [safid], [saf] FROM [cdsaf]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSfaslid" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT [faslid], [fasl] FROM [cdfasl]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSempid" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT [empid], [empname] FROM [tblempdata]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DShesaid" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT [hesaid], [hesa] FROM [cdhesa]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSmadaid" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT [madaid], [madaname] FROM [cdmada]">
            </asp:AccessDataSource>
            <dx:ASPxGridViewExporter ID="ASPxGridViewExporterEditor" runat="server" 
                FileName="ContactUSFX" GridViewID="GVEditor" PaperKind="A4">
            </dx:ASPxGridViewExporter>
            <asp:AccessDataSource ID="DSTblahdaf" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                DeleteCommand="DELETE FROM [tblahdaf] WHERE [hadafid] = ?" 
                InsertCommand="INSERT INTO [tblahdaf] ([hadaf], [lessonid]) VALUES (?, ?)" 
                SelectCommand="SELECT [hadafid], [hadaf], [lessonid] FROM [tblahdaf] WHERE ([lessonid] = ?)" 
                UpdateCommand="UPDATE [tblahdaf] SET [hadaf] = ? WHERE [hadafid] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="hadafid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="hadaf" Type="String" />
                    <asp:SessionParameter Name="lessonid" SessionField="lessonidEditor" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="lessonid" SessionField="lessonidEditor" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="hadaf" Type="String" />
                    <asp:Parameter Name="hadafid" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DStbllessonmoshrek" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                DeleteCommand="DELETE FROM [tbllessonmoshrek] WHERE [moshrekid] = ?" 
                InsertCommand="INSERT INTO [tbllessonmoshrek] ([empid], [lessonid]) VALUES (?, ?)" 
                SelectCommand="SELECT [moshrekid], [empid], [lessonid] FROM [tbllessonmoshrek] WHERE ([lessonid] = ?)" 
                UpdateCommand="UPDATE [tbllessonmoshrek] SET [empid] = ? WHERE  [moshrekid] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="moshrekid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="empid" Type="Int32" />
                    <asp:SessionParameter DefaultValue="0" Name="lessonid" SessionField="lessonidEditor" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="lessonid" SessionField="lessonidEditor" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="empid" Type="Int32" />
                    <asp:Parameter Name="moshrekid" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
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
    Font-Bold="False" Theme="SoftOrange">
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

<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">تم 
    التحميل</dx:PopupControlContentControl>

</ContentCollection>
</dx:ASPxPopupControl>


    

</asp:Content>

