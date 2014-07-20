<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TBLMembers.ascx.cs" Inherits="TBLMembers" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<style type="text/css">
    .auto-style1 {
        width: 554px;
    }

    .auto-style2 {
    }
    .auto-style3 {
        height: 18px;
    }
    .auto-style4
    {
        height: 22px;
    }
</style>

<table align="center">
    <tr>
        <td dir="ltr">
            <dx:ASPxValidationSummary ID="ASPxVS" runat="server" RightToLeft="True" ShowErrorsInEditors="True" ValidationGroup="VG" Visible="False">
            </dx:ASPxValidationSummary>
        </td>
    </tr>
    <tr>
        <td dir="ltr" style="text-align: right">
            <dx:ASPxLabel ID="lblState" runat="server" ForeColor="Red" Font-Bold="True" Font-Size="14pt">
            </dx:ASPxLabel>
        </td>
    </tr>
    <tr>
        <td dir="ltr" style="text-align: right">
            <dx:ASPxButton runat="server" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Text="جديد" ValidationGroup="VG" CssPostfix="PlasticBlue" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" Width="120px" ID="btnNew" OnClick="btnNew_Click" Font-Size="12pt">
            </dx:ASPxButton>
        </td>
    </tr>
    <tr>
        <td dir="ltr">
            <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" RightToLeft="True" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" ClientInstanceName="tabPage" Font-Size="11pt">
                <TabPages>
                    <dx:TabPage Text="البيانات الشخصية للعضو الاساسي" Name="page1">
                        <ContentCollection>
                            <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                <table class="auto-style1" dir="rtl">
                                    <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Text="النقابة الفرعية" Font-Size="11pt">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxComboBox ID="cbSyndicateId" runat="server" AutoPostBack="True" 
                                                CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                DataSourceID="DSSyndicateId" 
                                                SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" 
                                                TextField="Syndicate" ValueField="SyndicateId" 
                                                DropDownStyle="DropDown" Font-Size="11pt" Width="200px">
                                                <Columns>
                                                    <dx:ListBoxColumn Caption="الاسم" FieldName="Syndicate" />
                                                </Columns>
                                                <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel26" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Font-Size="11pt" Text="فرعية المشترك">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxComboBox ID="cbMemberSyndicateId" runat="server" AutoPostBack="True" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="DSSyndicateIdAll" DropDownStyle="DropDown" Font-Size="11pt" OnSelectedIndexChanged="cbSyndicateId_SelectedIndexChanged" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" TextField="Syndicate" ValueField="SyndicateId" Width="200px">
                                                <Columns>
                                                    <dx:ListBoxColumn Caption="الاسم" FieldName="Syndicate" />
                                                </Columns>
                                                <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel2" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Text="اللجنة النقابية" Font-Size="11pt">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxComboBox ID="cbSubCommitteId" runat="server" 
                                                CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                DataSourceID="DSSubCommitteId" 
                                                SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" 
                                                TextField="SubCommitte" ValueField="SubCommitteId" DropDownStyle="DropDown" Font-Size="11pt" Width="200px">
                                                <Columns>
                                                    <dx:ListBoxColumn Caption="الاسم" FieldName="SubCommitte" />
                                                </Columns>
                                                <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel3" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Text="الاسم" Font-Size="11pt">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxTextBox ID="tbMemberName" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="200px" MaxLength="100" Font-Size="11pt">
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel4" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Text="تاريخ الميلاد" Font-Size="11pt">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxDateEdit ID="deBdate" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" EditFormat="Custom" EditFormatString="dd/MM/yyyy" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Font-Size="11pt" Width="200px">
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxDateEdit>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel5" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Text="النوع" Font-Size="11pt">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxComboBox ID="cbGenderId" runat="server" 
                                                CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                DataSourceID="DSGenderId" 
                                                SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" TextField="Gender" 
                                                ValueField="GenderId" DropDownStyle="DropDown" Font-Size="11pt" Width="200px">
                                                <Columns>
                                                    <dx:ListBoxColumn Caption="الاسم" FieldName="Gender" />
                                                </Columns>
                                                <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel6" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Text="الحالة الاجتماعية" Font-Size="11pt">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxComboBox ID="cbMaritalStatusId" runat="server" 
                                                CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                DataSourceID="DSMaritalStatusId" 
                                                SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" 
                                                TextField="MaritalStatus" ValueField="MaritalStatusId" DropDownStyle="DropDown" Font-Size="11pt" Width="200px">
                                                <Columns>
                                                    <dx:ListBoxColumn Caption="الاسم" FieldName="MaritalStatus" />
                                                </Columns>
                                                <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel7" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Text="رقم اثبات الشخصية" Font-Size="11pt">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxTextBox ID="tbNID" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="200px" MaxLength="14" Font-Size="11pt">
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                    <RegularExpression ErrorText="يجب ادخال 14 رقم" ValidationExpression="\d{14}" />
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel8" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Text="نوعة" Font-Size="11pt">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxComboBox ID="cbIdTypeId" runat="server" 
                                                CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                DataSourceID="DSIdTypeId" 
                                                SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" TextField="IdType" 
                                                ValueField="IdTypeId" DropDownStyle="DropDown" Font-Size="11pt" Width="200px">
                                                <Columns>
                                                    <dx:ListBoxColumn Caption="الاسم" FieldName="IdType" />
                                                </Columns>
                                                <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel9" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Text="تاريخ الانتهاء" Font-Size="11pt">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxDateEdit ID="deNIDEndDate" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" EditFormat="Custom" EditFormatString="dd/MM/yyyy" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Font-Size="11pt" Width="200px">
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxDateEdit>
                                        </td>
                                    </tr>
                                </table>
                                <p>
                                </p>
                                
                                <p>
                                </p>
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                    <dx:TabPage Text="بيانات اعضاء العائلة" Name="page2">
                        <ContentCollection>
                            <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxGridView ID="GVEditor" runat="server" AutoGenerateColumns="False" Caption="البيــــــــــا نـــــــــــــــات" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="DSTBLCompanion" EnableTheming="True" Font-Bold="True" KeyFieldName="CompanionId" OnRowDeleted="GVEditor_RowDeleted" OnRowInserted="GVEditor_RowInserted" OnRowUpdated="GVEditor_RowUpdated" RightToLeft="True" SummaryText="الملخص" Width="700px" OnCancelRowEditing="GVEditor_CancelRowEditing" OnRowInserting="GVEditor_RowInserting" OnRowUpdating="GVEditor_RowUpdating" OnStartRowEditing="GVEditor_StartRowEditing">
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
                                                <Image Url="../images/edit.png" Width="26px">
                                                </Image>
                                            </EditButton>
                                            <NewButton Visible="True">
                                                <Image Url="../images/insert.png" Width="26px">
                                                </Image>
                                            </NewButton>
                                            <DeleteButton Text="حذف" Visible="True">
                                                <Image Url="../images/delete.png" Width="26px">
                                                </Image>
                                            </DeleteButton>
                                            <SelectButton>
                                                <Image Url="../images/accept.png">
                                                </Image>
                                            </SelectButton>
                                            <CancelButton>
                                                <Image Url="../images/delete.png">
                                                </Image>
                                            </CancelButton>
                                            <UpdateButton>
                                                <Image Url="../images/accept.png">
                                                </Image>
                                            </UpdateButton>
                                            <ClearFilterButton Visible="True">
                                            </ClearFilterButton>
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataTextColumn Caption="الاسم" FieldName="CompanionName" ShowInCustomizationForm="True" VisibleIndex="2">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="الفئة" FieldName="CompanionTypeId" ShowInCustomizationForm="True" VisibleIndex="1">
                                            <PropertiesComboBox DataSourceID="DSCDCompanionType" TextField="CompanionType" ValueField="CompanionTypeId" ValueType="System.Int32">
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="النوع" FieldName="GenderId" ShowInCustomizationForm="True" VisibleIndex="3">
                                            <PropertiesComboBox DataSourceID="DSGenderId" TextField="Gender" ValueField="GenderId" ValueType="System.Int32">
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>
                                        <dx:GridViewDataDateColumn Caption="تاريخ الميلاد" FieldName="CompanionBdate" ShowInCustomizationForm="True" VisibleIndex="4">
                                            <PropertiesDateEdit DisplayFormatString="{0: dd/MM/yyyy}">
                                            </PropertiesDateEdit>
                                        </dx:GridViewDataDateColumn>
                                                            <dx:GridViewDataTextColumn Caption="مسار الصورة" FieldName="CompanionImage" VisibleIndex="11"
                        Name="CompanionImage">
                        <DataItemTemplate>
                            <asp:Image ID="Image1" runat="server" Height="64px" ImageUrl='<%# Eval("CompanionImage", "../Assets/Images/{0}") %>'
                                Width="64px" />
                        </DataItemTemplate>
                        <EditItemTemplate>
                            <dx:ASPxUploadControl ID="UCpic" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"
                                CssPostfix="PlasticBlue" OnFileUploadComplete="UCpic_FileUploadComplete" ShowProgressPanel="True"
                                ShowUploadButton="True" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css"
                                Width="280px">
                                <ValidationSettings AllowedFileExtensions=".jpg" GeneralErrorText="فشل التحميل بسبب خطــاء داخلي"
                                    MaxFileSize="51200" MaxFileSizeErrorText="الملف اكبر من 50 كيلوبايت برجاء رفع ملف اصغر من 50 كيلوبايت"
                                    MultiSelectionErrorText="خطأ في نوع الملف :  {0} files are invalid because they exceed the allowed file size ({1}) or their extensions are not allowed. These files have been removed from selection, so they will not be uploaded. 

{2}" NotAllowedFileExtensionErrorText="امتداد الملف غير مسموح به">
                                </ValidationSettings>
                                <ClientSideEvents FilesUploadComplete="function(s, e) {

}" />
                                <AddButton Text="اضافه">
                                </AddButton>
                                <BrowseButton Text="اختار ملف">
                                </BrowseButton>
                                <RemoveButton Text="حذف">
                                </RemoveButton>
                                <UploadButton Text="بداء التحميــــــــــل">
                                </UploadButton>
                                <CancelButton Text="الغــــــاء">
                                </CancelButton>
                                <AdvancedModeSettings TemporaryFolder="..\App_Data\UploadTemp\" />
                            </dx:ASPxUploadControl>
                        </EditItemTemplate>
                    </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataCheckColumn Caption="عضو قديم" FieldName="renew" ShowInCustomizationForm="True" VisibleIndex="13">
                                        </dx:GridViewDataCheckColumn>
                                    </Columns>
                                    <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" ConfirmDelete="True" SortMode="DisplayText" />
                                    <SettingsPager ShowDefaultImages="False">
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
                                    <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
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
                    <dx:TabPage Text="بيانات العنوان" Name="page3">
                        <ContentCollection>
                            <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                <table class="auto-style1" dir="rtl">
                                    <tr>
                                        <td colspan="3" style="text-align: center">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <dx:ASPxLabel ID="ASPxLabel11" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Text="شارع" Font-Size="11pt">
                                            </dx:ASPxLabel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="text-align: right">
                                            <dx:ASPxTextBox ID="tbStreet" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="250px" MaxLength="50" Font-Size="11pt">
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style2">
                                            <dx:ASPxLabel ID="ASPxLabel12" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Text="رقم العقار" Font-Size="11pt">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td colspan="2">
                                            <dx:ASPxLabel ID="ASPxLabel13" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Text="رقم الشقة" Font-Size="11pt">
                                            </dx:ASPxLabel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style2" colspan="2">
                                            <dx:ASPxTextBox ID="tbHomeNo" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="170px" MaxLength="5" Font-Size="11pt">
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td>
                                            <dx:ASPxTextBox ID="tbFlatNo" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="170px" MaxLength="5" Font-Size="11pt">
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style2" colspan="2">
                                            <dx:ASPxLabel ID="ASPxLabel14" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Text="المحافظة" Font-Size="11pt">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel15" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Text="المدينة" Font-Size="11pt">
                                            </dx:ASPxLabel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style2" colspan="2">
                                            <dx:ASPxComboBox ID="cbGovId" runat="server" 
                                                CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                DataSourceID="DSGovId" 
                                                SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" TextField="GOV" 
                                                ValueField="GovId" Font-Size="11pt">
                                                <Columns>
                                                    <dx:ListBoxColumn Caption="الاسم" FieldName="GOV" />
                                                </Columns>
                                                <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                        </td>
                                        <td>
                                            <dx:ASPxTextBox ID="tbCity" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="170px" MaxLength="50" Font-Size="11pt">
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style2" colspan="3">
                                            <dx:ASPxLabel ID="ASPxLabel16" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Text="الحي" Font-Size="11pt">
                                            </dx:ASPxLabel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <dx:ASPxTextBox ID="tbArea" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="170px" MaxLength="50" Font-Size="11pt">
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                </table>
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                    <dx:TabPage Text="بيانات اضافيه" Name="page4">
                        <ContentCollection>
                            <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                <table class="auto-style1" dir="rtl">
                                    <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel17" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Text="محمول" Font-Size="11pt">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel18" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Text="تليفون منزل" Font-Size="11pt">
                                            </dx:ASPxLabel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dx:ASPxTextBox ID="tbMobile" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="200px" MaxLength="11" Font-Size="11pt">
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td>
                                            <dx:ASPxTextBox ID="tbHomeTel" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="200px" MaxLength="10" TabIndex="1" Font-Size="11pt">
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel19" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Text="تليفون العمل" Font-Size="11pt">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel20" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Text="بريد اليكتروني" Font-Size="11pt">
                                            </dx:ASPxLabel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dx:ASPxTextBox ID="tbWorkTel" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="200px" MaxLength="10" TabIndex="2" Font-Size="11pt">
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td>
                                            <dx:ASPxTextBox ID="tbEMail" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="200px" MaxLength="50" TabIndex="3" Font-Size="11pt">
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dx:ASPxLabel ID="ASPxLabel21" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Text="رقم قيد النقابة / رقم صرف المعاش" Font-Size="11pt">
                                            </dx:ASPxLabel>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dx:ASPxTextBox ID="tbKidNO" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="200px" MaxLength="20" TabIndex="4" Font-Size="11pt">
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style3" colspan="2">
                                            <dx:ASPxLabel ID="ASPxLabel22" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Text="وسيلة مفضلة" Font-Size="11pt">
                                            </dx:ASPxLabel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <dx:ASPxComboBox ID="cbContactTypeID" runat="server" 
                                                CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                DataSourceID="DSContactTypeID" 
                                                SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" 
                                                TextField="ContactType" ValueField="ContactTypeID" TabIndex="5" DropDownStyle="DropDown" Font-Size="11pt" Width="200px">
                                                <Columns>
                                                    <dx:ListBoxColumn Caption="الاسم" FieldName="ContactType" />
                                                </Columns>
                                                <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <dx:ASPxLabel ID="ASPxLabel25" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Text="رقم الدفتر" Font-Size="11pt">
                                            </dx:ASPxLabel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <dx:ASPxComboBox ID="cbDaftar" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="DSDaftar" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" TabIndex="6" TextField="daftar" ValueField="daftar" DropDownStyle="DropDown" Font-Size="11pt" Width="200px">
                                                <Columns>
                                                    <dx:ListBoxColumn Caption="الاسم" FieldName="daftar" />
                                                </Columns>
                                                <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <ValidationSettings>
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <dx:ASPxLabel ID="ASPxLabel23" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Text="رقم الايصال" Font-Size="11pt">
                                            </dx:ASPxLabel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <dx:ASPxTextBox ID="tbReceiptNo" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" MaxLength="20" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" TabIndex="7" Width="200px" Font-Size="11pt">
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                    <RequiredField IsRequired="True" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <dx:ASPxLabel ID="ASPxLabel24" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" Text="الجهــــــــه" Font-Size="11pt" Visible="False">
                                            </dx:ASPxLabel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">
                                            <dx:ASPxComboBox ID="cbGehaId" runat="server" 
                                                CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                DataSourceID="DSGehaId" 
                                                SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" 
                                                TextField="GehaName" ValueField="GehaId" TabIndex="8" DropDownStyle="DropDown" Font-Size="11pt" Width="200px" Visible="False">
                                                <Columns>
                                                    <dx:ListBoxColumn Caption="الاسم" FieldName="GehaName" />
                                                </Columns>
                                                <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                                                </LoadingPanelImage>
                                                <ValidationSettings SetFocusOnError="True" ValidationGroup="VG">
                                                    <ErrorFrameStyle ImageSpacing="4px">
                                                        <ErrorTextPaddings PaddingLeft="4px" />
                                                    </ErrorFrameStyle>
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style4" colspan="2">
                                            <dx:ASPxCheckBox ID="cbrenew" runat="server" CheckState="Unchecked" Font-Size="11pt" TabIndex="9" Text="عضو قديم">
                                            </dx:ASPxCheckBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: center">
                                            <dx:ASPxUploadControl ID="UCFile" runat="server" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" OnFileUploadComplete="UCFile_FileUploadComplete" ShowProgressPanel="True" ShowUploadButton="True" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="280px" Font-Size="12pt">
                                                <ValidationSettings GeneralErrorText="فشل التحميل بسبب خطــاء داخلي" MaxFileSize="51200" MaxFileSizeErrorText="الملف اكبر من 50 كيلوبايت برجاء رفع ملف اصغر من 50 كيلوبايت" MultiSelectionErrorText="خطاء في نوع الملف :  {0} files are invalid because they exceed the allowed file size ({1}) or their extensions are not allowed. These files have been removed from selection, so they will not be uploaded. 

{2}" NotAllowedFileExtensionErrorText="امتداد الملف غير مسموح به">
                                                </ValidationSettings>
                                                <ClientSideEvents FileUploadComplete="function(s, e) {
  _aspxGetElementById('lblPath').innerHTML = e.callbackData;
  
  myImg.SetImageUrl('Assets/Images/' + e.callbackData);
}" />
                                                <AddButton Text="اضافه">
                                                </AddButton>
                                                <BrowseButton Text="اختار ملف">
                                                </BrowseButton>
                                                <RemoveButton Text="حذف">
                                                </RemoveButton>
                                                <UploadButton Text="بداء التحميــــــــــل">
                                                </UploadButton>
                                                <CancelButton Text="الغــــــاء">
                                                </CancelButton>
                                                <AdvancedModeSettings TemporaryFolder="..\App_Data\UploadTemp\" />
                                            </dx:ASPxUploadControl>
                                            <br />
                                            <dx:ASPxLabel ID="lblPath" runat="server" ClientIDMode="Static" ClientInstanceName="lblPath" style="direction: ltr">
                                            </dx:ASPxLabel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style3" colspan="2" style="text-align: center">
                                            <dx:ASPxImage ID="myImg" runat="server" ClientIDMode="Static" ClientInstanceName="myImg" Height="100px" Width="100px">
                                            </dx:ASPxImage>
                                        </td>
                                    </tr>
                                </table>
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                </TabPages>
                <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Web/tcLoading.gif">
                </LoadingPanelImage>
                <ClientSideEvents TabClick="function(s, e) {
	tabPage.SetActiveTabIndex = 1;
	tabPage.SetActiveTabIndex = 2;
	tabPage.SetActiveTabIndex = 3;
	tabPage.SetActiveTabIndex = 0;
}" />
                <Paddings PaddingLeft="5px" PaddingRight="5px" PaddingTop="3px" />
                <ContentStyle>
                    <Border BorderWidth="0px" />
                </ContentStyle>
            </dx:ASPxPageControl>
        </td>
    </tr>
    <tr>
        <td dir="ltr" style="text-align: center">
            <dx:ASPxButton runat="server" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Text="حفظ" ValidationGroup="VG" CssPostfix="PlasticBlue" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" Width="120px" ID="btnSave" OnClick="btnSave_Click" Font-Size="12pt">
            </dx:ASPxButton>
        </td>
    </tr>

</table>
<asp:AccessDataSource ID="DSData" runat="server" DataFile="~/App_Data/ETST.mdb" DeleteCommand="DELETE FROM [CDGov] WHERE [GovId] = @GovId" InsertCommand="INSERT INTO [CDGov] ([GovId], [GOV]) 
VALUES
((SELECT ISNULL(MAX(GovId) + 1, 1) FROM CDGov), @GOV)"
                SelectCommand="SELECT [GovId], [GOV] FROM [CDGov]" UpdateCommand="UPDATE [CDGov] SET [GOV] = @GOV WHERE [GovId] = @GovId">
                <DeleteParameters>
                    <asp:Parameter Name="GovId" Type="Byte" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="GOV" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="GOV" Type="String" />
                    <asp:Parameter Name="GovId" Type="Byte" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSSyndicateId" runat="server" DataFile="~/App_Data/ETST.mdb" SelectCommand="SELECT [SyndicateId], [Syndicate] FROM [CDSyndicate]" OnSelecting="DSSyndicateId_Selecting"></asp:AccessDataSource>
            <asp:AccessDataSource ID="DSSyndicateIdAll" runat="server" DataFile="~/App_Data/ETST.mdb" SelectCommand="SELECT [SyndicateId], [Syndicate] FROM [CDSyndicate]"></asp:AccessDataSource>
            <asp:AccessDataSource ID="DSSubCommitteId" runat="server" 
    DataFile="~/App_Data/ETST.mdb" 
    SelectCommand="SELECT [SubCommitteId], [SubCommitte] FROM [CDSubCommitte] WHERE ([SyndicateId] = ?)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HFSyndicateId" Name="SyndicateId" PropertyName="Value" Type="Int32" DefaultValue="-1" />
                </SelectParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSGenderId" runat="server" DataFile="~/App_Data/ETST.mdb" SelectCommand="SELECT [GenderId], [Gender] FROM [CDGender]"></asp:AccessDataSource>
            <asp:AccessDataSource ID="DSMaritalStatusId" runat="server" DataFile="~/App_Data/ETST.mdb" SelectCommand="SELECT [MaritalStatusId], [MaritalStatus] FROM [CDMaritalStatus]"></asp:AccessDataSource>
            <asp:AccessDataSource ID="DSIdTypeId" runat="server" DataFile="~/App_Data/ETST.mdb" SelectCommand="SELECT [IdTypeId], [IdType] FROM [CDIdType]"></asp:AccessDataSource>
            <asp:AccessDataSource ID="DSContactTypeID" runat="server" DataFile="~/App_Data/ETST.mdb" SelectCommand="SELECT [ContactTypeID], [ContactType] FROM [CDContactType]"></asp:AccessDataSource>
            <asp:AccessDataSource ID="DSGovId" runat="server" DataFile="~/App_Data/ETST.mdb" SelectCommand="SELECT [GovId], [GOV] FROM [CDGov]"></asp:AccessDataSource>
<asp:HiddenField ID="HFSyndicateId" runat="server" />
            <asp:AccessDataSource ID="DSCDCompanionType" runat="server" DataFile="~/App_Data/ETST.mdb" SelectCommand="SELECT [CompanionTypeId], [CompanionType] FROM [CDCompanionType]"></asp:AccessDataSource>

            <asp:AccessDataSource ID="DSGehaId" runat="server" DataFile="~/App_Data/ETST.mdb" SelectCommand="SELECT [GehaId], [GehaName] FROM [CDGeha]"></asp:AccessDataSource>

            <asp:AccessDataSource ID="DSTBLCompanion" runat="server" 
    DataFile="~/App_Data/ETST.mdb" 
    SelectCommand="SELECT MemberId, CompanionId, CompanionTypeId, CompanionName, GenderId, CompanionBdate, CompanionImage, userin, datein, renew FROM TBLCompanion WHERE (MemberId = ?)" 
    DeleteCommand="DELETE FROM [TBLCompanion] WHERE [CompanionId] = ?" InsertCommand="INSERT INTO TBLCompanion (MemberId, CompanionId, CompanionTypeId, CompanionName, GenderId, CompanionBdate, CompanionImage, userin, datein, renew) VALUES (?, ?, ?, ?, ?, ?, ?, ?, DATE(),?)" 
    UpdateCommand="UPDATE TBLCompanion SET CompanionTypeId = ?, CompanionName = ?, GenderId = ?, CompanionBdate = ?, CompanionImage = ?, userin = ?, datein = DATE(), renew = ? WHERE (CompanionId = ?)" 
    oninserting="DSTBLCompanion_Inserting">
                <DeleteParameters>
                    <asp:Parameter Name="CompanionId" Type="Int64" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:QueryStringParameter Name="MemberId" QueryStringField="mm" Type="Int64" />
                    <asp:Parameter Name="CompanionId" />
                    <asp:Parameter Name="CompanionTypeId" Type="Byte" />
                    <asp:Parameter Name="CompanionName" Type="String" />
                    <asp:Parameter Name="GenderId" Type="Byte" />
                    <asp:Parameter DbType="Date" Name="CompanionBdate" />
                    <asp:Parameter Name="CompanionImage" Type="String" />
                    <asp:SessionParameter Name="userin" SessionField="UserID" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="0" Name="MemberId" QueryStringField="mm" Type="Int64" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CompanionTypeId" Type="Byte" />
                    <asp:Parameter Name="CompanionName" Type="String" />
                    <asp:Parameter Name="GenderId" Type="Byte" />
                    <asp:Parameter DbType="Date" Name="CompanionBdate" />
                    <asp:Parameter Name="CompanionImage" Type="String" />
                    <asp:SessionParameter Name="userin" SessionField="UserID" Type="Int32" />
                    <asp:Parameter Name="renew" />
                    <asp:Parameter Name="CompanionId" Type="Int64" />
                </UpdateParameters>
            </asp:AccessDataSource>

            <asp:AccessDataSource runat="server" DataFile="~/App_Data/ETST.mdb" SelectCommand="SELECT [SyndicateId], [esalfrom], [esalto], [daftar] FROM [esal] WHERE ([SyndicateId] = ?)" ID="DSDaftar">
                <SelectParameters>
                    <asp:ControlParameter ControlID="HFSyndicateId" PropertyName="Value" DefaultValue="-1" Name="daftar" Type="Int32"></asp:ControlParameter>
                </SelectParameters>
</asp:AccessDataSource>

<dx:ASPxPopupControl ID="ASPxPopupControlEditor" runat="server"
    AllowDragging="True" ClientInstanceName="popupeditor"
    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue"
    HeaderText="رسالـــه"
    Modal="True" PopupHorizontalAlign="WindowCenter"
    PopupVerticalAlign="WindowCenter" RightToLeft="True"
    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Height="120px"
    Width="300px" Style="text-align: center"
    Font-Bold="False">
    <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Web/dvLoading.gif">
    </LoadingPanelImage>
    <ClientSideEvents Init="function(s, e) {
	if(typeof(s.cpShowPopup) != 'undefined')
		{
                popupeditor.SetContentHTML(s.cpShowPopup);
				popupeditor.Show();
		} 
}" />
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

        <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">
            تم 
    التحميل
        </dx:PopupControlContentControl>

    </ContentCollection>
</dx:ASPxPopupControl>








