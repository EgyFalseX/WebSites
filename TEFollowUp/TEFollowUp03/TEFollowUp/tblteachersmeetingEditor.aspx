<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="tblteachersmeetingEditor.aspx.cs" Inherits="tblteachersmeetingEditor" %>
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
                KeyFieldName="temeetingid" RightToLeft="True" 
                SummaryText="الملخص" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" 
                CssPostfix="PlasticBlue" EnableTheming="True" 
                onrowdeleted="GVEditor_RowDeleted" onrowupdated="GVEditor_RowUpdated" 
                onrowinserted="GVEditor_RowInserted" Font-Bold="True" Theme="SoftOrange" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" KeyboardSupport="True" OnCommandButtonInitialize="GVEditor_CommandButtonInitialize">
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
                    <dx:GridViewDataComboBoxColumn Caption="المدرسة" FieldName="cdschool" VisibleIndex="1">
                        <PropertiesComboBox DataSourceID="DSSchoolid" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="StartsWith" TextField="schoolname" ValueField="schoolid">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataDateColumn Caption="التاريخ" FieldName="meetingdate" VisibleIndex="3">
                        <PropertiesDateEdit DisplayFormatString="d/M/yyyy">
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataComboBoxColumn Caption="المادة" FieldName="madaid" VisibleIndex="2">
                        <PropertiesComboBox DataSourceID="DSmadaid" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="StartsWith" TextField="madaname" ValueField="madaid">
                            <Columns>
                                <dx:ListBoxColumn FieldName="madaname" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="مشرف" FieldName="moshrefid" VisibleIndex="4">
                        <PropertiesComboBox DataSourceID="DSmoshrefid" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="StartsWith" TextField="empname" ValueField="empid">
                            <Columns>
                                <dx:ListBoxColumn FieldName="empname" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
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
                                <dx:TabPage Text="الحاضرون">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxGridView ID="GVEditorTblahdaf" runat="server" AutoGenerateColumns="False" Caption="البيــــــــــا نـــــــــــــــات" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="DStblteachershodor" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" EnableTheming="True" Font-Bold="True" KeyboardSupport="True" KeyFieldName="moshrekid" OnBeforePerformDataSelect="GVEditor_BeforePerformDataSelect" OnRowDeleted="GVEditor_RowDeleted" OnRowInserted="GVEditor_RowInserted" OnRowUpdated="GVEditor_RowUpdated" RightToLeft="True" SummaryText="الملخص" Theme="SoftOrange" OnCommandButtonInitialize="GVEditor_CommandButtonInitialize">
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
                                                    <dx:GridViewDataComboBoxColumn Caption="المعلم" FieldName="empid" ShowInCustomizationForm="True" VisibleIndex="1">
                                                        <PropertiesComboBox DataSourceID="DSempid" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="StartsWith" TextField="empname" ValueField="empid">
                                                            <Columns>
                                                                <dx:ListBoxColumn Caption="الاسم" FieldName="empname" />
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
                                <dx:TabPage Text=" المناقشات">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxGridView ID="GVEditortbllessonmoshrek" runat="server" AutoGenerateColumns="False" Caption="البيــــــــــا نـــــــــــــــات" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="DStblteachersmon" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" EnableTheming="True" Font-Bold="True" KeyboardSupport="True" KeyFieldName="morekid" OnRowDeleted="GVEditor_RowDeleted" OnRowInserted="GVEditor_RowInserted" OnRowUpdated="GVEditor_RowUpdated" RightToLeft="True" SummaryText="الملخص" Theme="SoftOrange" OnCommandButtonInitialize="GVEditor_CommandButtonInitialize">
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
                                                    <dx:GridViewDataMemoColumn Caption="المناقشات" FieldName="dess" ShowInCustomizationForm="True" VisibleIndex="1">
                                                        <PropertiesMemoEdit Height="100px">
                                                        </PropertiesMemoEdit>
                                                        <EditFormSettings ColumnSpan="2" />
                                                    </dx:GridViewDataMemoColumn>
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
                                <dx:TabPage Text="التوصيات">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxGridView ID="GVEditortbllessonmoshrek0" runat="server" AutoGenerateColumns="False" Caption="البيــــــــــا نـــــــــــــــات" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="DStblteacherstwseat" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" EnableTheming="True" Font-Bold="True" KeyboardSupport="True" KeyFieldName="motrekid" OnRowDeleted="GVEditor_RowDeleted" OnRowInserted="GVEditor_RowInserted" OnRowUpdated="GVEditor_RowUpdated" RightToLeft="True" SummaryText="الملخص" Theme="SoftOrange" OnCommandButtonInitialize="GVEditor_CommandButtonInitialize">
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
                                                    <dx:GridViewDataMemoColumn Caption="التوصية" FieldName="twseat" ShowInCustomizationForm="True" VisibleIndex="1">
                                                        <PropertiesMemoEdit Height="100px">
                                                        </PropertiesMemoEdit>
                                                        <EditFormSettings ColumnSpan="2" />
                                                    </dx:GridViewDataMemoColumn>
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
                DeleteCommand="DELETE FROM [tblteachersmeeting] WHERE [temeetingid] = ?" 
                InsertCommand="INSERT INTO [tblteachersmeeting] ( [cdschool], [madaid], [meetingdate], [moshrefid], [userin], [datein]) VALUES (?, ?, ?, ?, ?, Date())" 
                SelectCommand="SELECT [temeetingid], [cdschool], [madaid], [meetingdate], [moshrefid], [userin], [datein] FROM [tblteachersmeeting]
WHERE 
((SELECT IsAdmin FROM FollowupUsers WHERE UserID = ?) = true)
OR (moshrefid = ?)
OR (userin = ?)


" 
                UpdateCommand="UPDATE [tblteachersmeeting] SET [cdschool] = ?, [madaid] = ?, [meetingdate] = ?, [moshrefid] = ?, [userin] = ?, [datein] = Date() WHERE [temeetingid] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="temeetingid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="cdschool" Type="Int32" />
                    <asp:Parameter Name="madaid" Type="Int32" />
                    <asp:Parameter Name="meetingdate" Type="DateTime" />
                    <asp:Parameter Name="moshrefid" Type="Int32" />
                    <asp:SessionParameter Name="userin" SessionField="UserIDTEFollowUp" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="?" SessionField="UserIDTEFollowUp" />
                    <asp:SessionParameter Name="?" SessionField="empidTEFollowUp" />
                    <asp:SessionParameter Name="?" SessionField="UserIDTEFollowUp" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="cdschool" Type="Int32" />
                    <asp:Parameter Name="madaid" Type="Int32" />
                    <asp:Parameter Name="meetingdate" Type="DateTime" />
                    <asp:Parameter Name="moshrefid" Type="Int32" />
                    <asp:SessionParameter Name="userin" SessionField="UserIDTEFollowUp" Type="Int32" />
                    <asp:Parameter Name="temeetingid" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSmoshrefid" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT [empid], [empname] FROM [tblempdata] WHERE ([moshref] = True)
AND
(
((SELECT IsAdmin FROM FollowupUsers WHERE UserID = ?) = true) OR (empid = ?)
)
order by empname">
                <SelectParameters>
                    <asp:SessionParameter Name="?" SessionField="UserIDTEFollowUp" />
                    <asp:SessionParameter Name="?" SessionField="empidTEFollowUp" />
                </SelectParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSSchoolid" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT [schoolid], [schoolname] FROM [cdschool]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSmadaid" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT [madaid], [madaname] FROM [cdmada]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSempid" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT [empid], [empname] FROM [tblempdata]
ORDER BY empname">
            </asp:AccessDataSource>
            <dx:ASPxGridViewExporter ID="ASPxGridViewExporterEditor" runat="server" 
                FileName="ContactUSFX" GridViewID="GVEditor" PaperKind="A4">
            </dx:ASPxGridViewExporter>
            <asp:AccessDataSource ID="DStblteachershodor" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                DeleteCommand="DELETE FROM [tblteachershodor] WHERE [moshrekid] = ?" 
                InsertCommand="INSERT INTO [tblteachershodor] ( [temeetingid], [empid]) VALUES ( ?, ?)" 
                SelectCommand="SELECT [moshrekid], [temeetingid], [empid] FROM [tblteachershodor]
WHERE temeetingid = ?" 
                UpdateCommand="UPDATE [tblteachershodor] SET  [empid] = ? WHERE [moshrekid] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="moshrekid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:SessionParameter Name="temeetingid" SessionField="tblteachersmeetingEditorID" Type="Int32" />
                    <asp:Parameter Name="empid" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="?" SessionField="tblteachersmeetingEditorID" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="empid" Type="Int32" />
                    <asp:Parameter Name="moshrekid" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DStblteachersmon" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT [morekid], [temeetingid], [dess] FROM [tblteachersmon]
WHERE temeetingid = ?" DeleteCommand="DELETE FROM [tblteachersmon] WHERE [morekid] = ?" InsertCommand="INSERT INTO [tblteachersmon] ([temeetingid], [dess]) VALUES (?, ?)" UpdateCommand="UPDATE [tblteachersmon] SET  [dess] = ? WHERE [morekid] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="morekid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:SessionParameter Name="temeetingid" SessionField="tblteachersmeetingEditorID" Type="Int32" />
                    <asp:Parameter Name="dess" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="?" SessionField="tblteachersmeetingEditorID" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="dess" Type="String" />
                    <asp:Parameter Name="morekid" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DStblteacherstwseat" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT [motrekid], [temeetingid], [twseat] FROM [tblteacherstwseat] WHERE ([temeetingid] = ?)" DeleteCommand="DELETE FROM [tblteacherstwseat] WHERE [motrekid] = ?" InsertCommand="INSERT INTO [tblteacherstwseat] ([temeetingid], [twseat]) VALUES (?, ?)" UpdateCommand="UPDATE [tblteacherstwseat] SET [twseat] = ? WHERE [motrekid] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="motrekid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:SessionParameter Name="temeetingid" SessionField="tblteachersmeetingEditorID" Type="Int32" />
                    <asp:Parameter Name="twseat" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="temeetingid" SessionField="tblteachersmeetingEditorID" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="twseat" Type="String" />
                    <asp:Parameter Name="motrekid" Type="Int32" />
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

