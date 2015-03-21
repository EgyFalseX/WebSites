<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="tblteachershodorEditor.aspx.cs" Inherits="tblteachershodorEditor" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxTabControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 32px;
        }
    </style>
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
        <td style="text-align: center" class="auto-style1">
            </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxGridView ID="GVEditor" runat="server" AutoGenerateColumns="False" 
                Caption="البيــــــــــا نـــــــــــــــات" DataSourceID="DSData" 
                KeyFieldName="tblallid" RightToLeft="True" 
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
                    <dx:GridViewDataComboBoxColumn Caption="العام الداراسي" FieldName="yearid" VisibleIndex="2">
                        <PropertiesComboBox DataSourceID="DSyearid" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="StartsWith" TextField="yearname" ValueField="yearid">
                            <Columns>
                                <dx:ListBoxColumn FieldName="yearname" Caption="الاسم" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="اسم المعلم" FieldName="empid" VisibleIndex="1">
                        <PropertiesComboBox DataSourceID="DSempid" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="StartsWith" TextField="empname" ValueField="empid">
                            <Columns>
                                <dx:ListBoxColumn FieldName="empname" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataSpinEditColumn Caption="عدد الزيارات" FieldName="zearat" VisibleIndex="3">
                        <PropertiesSpinEdit DisplayFormatString="g">
                        </PropertiesSpinEdit>
                    </dx:GridViewDataSpinEditColumn>
                    <dx:GridViewDataSpinEditColumn Caption="عدد اللقاءات" FieldName="lkaat" VisibleIndex="4">
                        <PropertiesSpinEdit DisplayFormatString="g">
                        </PropertiesSpinEdit>
                    </dx:GridViewDataSpinEditColumn>
                    <dx:GridViewDataSpinEditColumn Caption="عدد الدورات" FieldName="dowrat" VisibleIndex="5">
                        <PropertiesSpinEdit DisplayFormatString="g">
                        </PropertiesSpinEdit>
                    </dx:GridViewDataSpinEditColumn>
                    <dx:GridViewDataSpinEditColumn Caption="عدد النشرات" FieldName="nashrat" VisibleIndex="6">
                        <PropertiesSpinEdit DisplayFormatString="g">
                        </PropertiesSpinEdit>
                    </dx:GridViewDataSpinEditColumn>
                    <dx:GridViewDataMemoColumn Caption="البرنامج العلاجي" FieldName="brnamg" VisibleIndex="7" Visible="False">
                        <PropertiesMemoEdit Height="120px">
                        </PropertiesMemoEdit>
                        <EditFormSettings ColumnSpan="2" Visible="True" />
                    </dx:GridViewDataMemoColumn>
                    <dx:GridViewDataCheckColumn Caption="يبقى" FieldName="stay" VisibleIndex="8">
                    </dx:GridViewDataCheckColumn>
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
                        <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" Width="600px">
                            <TabPages>
                                <dx:TabPage Text="الايحابيات">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxGridView ID="GVEditorTblahdaf0" runat="server" AutoGenerateColumns="False" Caption="البيــــــــــا نـــــــــــــــات" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="DStblteacheregabyat" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" EnableTheming="True" Font-Bold="True" KeyboardSupport="True" KeyFieldName="egabyatid" OnBeforePerformDataSelect="GVEditor_BeforePerformDataSelect" RightToLeft="True" SummaryText="الملخص" Theme="SoftOrange" Width="600px" OnCommandButtonInitialize="GVEditor_CommandButtonInitialize">
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
                                                    <dx:GridViewDataMemoColumn Caption="الايحابيات" FieldName="egabyat" ShowInCustomizationForm="True" VisibleIndex="1">
                                                        <PropertiesMemoEdit Height="100px" Width="500px">
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
                                <dx:TabPage Text="السلبيات">
                                    <ContentCollection>
                                        <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                            <dx:ASPxGridView ID="GVEditorTblahdaf" runat="server" AutoGenerateColumns="False" Caption="البيــــــــــا نـــــــــــــــات" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="DStblteachersalpeat" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" EnableTheming="True" Font-Bold="True" KeyboardSupport="True" KeyFieldName="salpeatid" OnRowDeleted="GVEditor_RowDeleted" OnRowInserted="GVEditor_RowInserted" OnRowUpdated="GVEditor_RowUpdated" RightToLeft="True" SummaryText="الملخص" Theme="SoftOrange" Width="600px" OnCommandButtonInitialize="GVEditor_CommandButtonInitialize">
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
                                                    <dx:GridViewDataMemoColumn Caption="السلبيات" FieldName="salpeat" ShowInCustomizationForm="True" VisibleIndex="1">
                                                        <PropertiesMemoEdit Height="100px" Width="500px">
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
                DeleteCommand="DELETE FROM [tblteacherfinal] WHERE [tblallid] = ?" 
                InsertCommand="INSERT INTO [tblteacherfinal] ([empid], [yearid], [zearat], [lkaat], [dowrat], [nashrat], [brnamg], [stay], [userin], [datein]) VALUES (?, ?, ?, ?, ?, ?, ?, ?,? , Date())" 
                SelectCommand="SELECT tblteacherfinal.tblallid, tblteacherfinal.empid, tblteacherfinal.yearid, tblteacherfinal.zearat, tblteacherfinal.lkaat, tblteacherfinal.dowrat, tblteacherfinal.nashrat, tblteacherfinal.brnamg, tblteacherfinal.stay, tblteacherfinal.userin, tblteacherfinal.datein FROM (tblteacherfinal INNER JOIN tblplan ON tblteacherfinal.empid = tblplan.empid) 
WHERE ((SELECT IsAdmin FROM FollowupUsers WHERE UserID = ?) = true) OR (tblplan.moshref = ?) 
GROUP BY tblteacherfinal.tblallid, tblteacherfinal.empid, tblteacherfinal.yearid, tblteacherfinal.zearat, tblteacherfinal.lkaat, tblteacherfinal.dowrat, tblteacherfinal.nashrat, tblteacherfinal.brnamg, tblteacherfinal.stay, tblteacherfinal.userin, tblteacherfinal.datein" 
                UpdateCommand="UPDATE [tblteacherfinal] SET [empid] = ?, [yearid] = ?, [zearat] = ?, [lkaat] = ?, [dowrat] = ?, [nashrat] = ?, [brnamg] = ?, [stay] = ?, [userin] = ?, [datein] = Date() WHERE [tblallid] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="tblallid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="empid" Type="Int32" />
                    <asp:Parameter Name="yearid" Type="Int32" />
                    <asp:Parameter Name="zearat" Type="Byte" />
                    <asp:Parameter Name="lkaat" Type="Byte" />
                    <asp:Parameter Name="dowrat" Type="Byte" />
                    <asp:Parameter Name="nashrat" Type="Byte" />
                    <asp:Parameter Name="brnamg" Type="String" />
                    <asp:Parameter Name="stay" Type="Boolean" />
                    <asp:SessionParameter Name="userin" SessionField="UserIDTEFollowUp" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="?" SessionField="UserIDTEFollowUp" />
                    <asp:SessionParameter Name="?" SessionField="empidTEFollowUp" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="empid" Type="Int32" />
                    <asp:Parameter Name="yearid" Type="Int32" />
                    <asp:Parameter Name="zearat" Type="Byte" />
                    <asp:Parameter Name="lkaat" Type="Byte" />
                    <asp:Parameter Name="dowrat" Type="Byte" />
                    <asp:Parameter Name="nashrat" Type="Byte" />
                    <asp:Parameter Name="brnamg" Type="String" />
                    <asp:Parameter Name="stay" Type="Boolean" />
                    <asp:SessionParameter Name="userin" SessionField="UserIDTEFollowUp" Type="Int32" />
                    <asp:Parameter Name="tblallid" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSempid" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT tblempdata.empid, tblempdata.empname FROM (tblempdata INNER JOIN tblplan ON tblempdata.empid = tblplan.empid) WHERE 
((SELECT IsAdmin FROM FollowupUsers WHERE UserID = ?) = true)
OR (tblplan.moshref = ?) 
GROUP BY tblempdata.empid, tblempdata.empname">
                <SelectParameters>
                    <asp:SessionParameter Name="?" SessionField="UserIDTEFollowUp" />
                    <asp:SessionParameter Name="?" SessionField="empidTEFollowUp" />
                </SelectParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSyearid" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT [yearid], [yearname] FROM [cdyear]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DStblteacheregabyat" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT [egabyatid], [tblallid], [egabyat] FROM [tblteacheregabyat]
WHERE tblallid = ?" DeleteCommand="DELETE FROM [tblteacheregabyat] WHERE [egabyatid] = ?" InsertCommand="INSERT INTO [tblteacheregabyat] ([tblallid], [egabyat]) VALUES (?, ?)" UpdateCommand="UPDATE [tblteacheregabyat] SET [egabyat] = ? WHERE [egabyatid] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="egabyatid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:SessionParameter Name="tblallid" SessionField="idEditor" Type="Int32" />
                    <asp:Parameter Name="egabyat" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="?" SessionField="idEditor" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="egabyat" Type="String" />
                    <asp:Parameter Name="egabyatid" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DStblteachersalpeat" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT [salpeatid], [tblallid], [salpeat] FROM [tblteachersalpeat]
WHERE tblallid = ?" DeleteCommand="DELETE FROM [tblteachersalpeat] WHERE [salpeatid] = ?" InsertCommand="INSERT INTO [tblteachersalpeat] ([tblallid], [salpeat]) VALUES (?, ?)" UpdateCommand="UPDATE [tblteachersalpeat] SET [salpeat] = ? WHERE [salpeatid] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="salpeatid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:SessionParameter Name="tblallid" SessionField="idEditor" Type="Int32" />
                    <asp:Parameter Name="salpeat" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="?" SessionField="idEditor" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="salpeat" Type="String" />
                    <asp:Parameter Name="salpeatid" Type="Int32" />
                </UpdateParameters>
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

