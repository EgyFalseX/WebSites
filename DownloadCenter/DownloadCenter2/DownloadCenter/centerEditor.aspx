﻿<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="centerEditor.aspx.cs" Inherits="centerEditor" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
<body>

<table align="center">
    <tr>
        <td dir="ltr">
            <dx:ASPxComboBox ID="CBExporter" runat="server" 
                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                onbuttonclick="CBExporter_ButtonClick" 
                SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css">
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
        <td>
            <dx:ASPxGridView ID="GVEditor" runat="server" AutoGenerateColumns="False" 
                Caption="البيــــــــــا نـــــــــــــــات" DataSourceID="DSData" 
                KeyFieldName="id_prog" RightToLeft="True" 
                SummaryText="الملخص" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" 
                CssPostfix="PlasticBlue" EnableTheming="True" 
                onrowdeleted="GVEditor_RowDeleted" onrowupdated="GVEditor_RowUpdated" 
                onrowinserted="GVEditor_RowInserted" Font-Bold="True" 
                oncancelrowediting="GVEditor_CancelRowEditing" 
                onrowdeleting="GVEditor_RowDeleting" 
                onstartrowediting="GVEditor_StartRowEditing" Theme="SoftOrange">
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
                    <dx:GridViewDataImageColumn Caption="الرابط" FieldName="link" 
                        VisibleIndex="9">
                        <PropertiesImage ImageHeight="32px" ImageUrlFormatString="Assets/DownloadCenterImages/{0}" 
                            ImageWidth="32px">
                        </PropertiesImage>
                        <EditFormSettings CaptionLocation="Top" />
                        <DataItemTemplate>
                            <dx:ASPxHyperLink ID="HLlink" runat="server" NavigateUrl='<%# Eval("link", "Assets/DownloadCenterImages/{0}") %>' Text="تحميل" />
                        </DataItemTemplate>
                        <EditItemTemplate>
                            <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" CssFilePath="App_Themes/DevEx/{0}/styles.css"
                                CssPostfix="DevEx" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete"
                                ShowProgressPanel="True" ShowUploadButton="True" SpriteCssFilePath="App_Themes/DevEx/{0}/sprite.css"
                                Width="280px">
                                <validationsettings generalerrortext="فشل التحميل بسبب خطــاء داخلي" maxfilesize="5242880"
                                    
                                    maxfilesizeerrortext="الملف اكبر من 100 كيلوبايت برجاء رفع ملف اصغر من 100 كيلوبايت" multiselectionerrortext="خطاء في نوع الملف :  {0} files are invalid because they exceed the allowed file size ({1}) or their extensions are not allowed. These files have been removed from selection, so they will not be uploaded. 

{2}" notallowedfileextensionerrortext="امتداد الملف غير مسموح به">
                    </validationsettings>
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
                    <AdvancedModeSettings TemporaryFolder="App_Data\UploadTemp\" />
                </dx:ASPxUploadControl>
                        </EditItemTemplate>
                    </dx:GridViewDataImageColumn>
                    <dx:GridViewDataComboBoxColumn Caption="المتابع" FieldName="code_al_fasl" VisibleIndex="2">
                        <PropertiesComboBox DataSourceID="DScode_fasl" DropDownStyle="DropDown" IncrementalFilteringMode="StartsWith" TextField="name_al_fasl" ValueField="code_al_fasl" Width="200px">
                            <Columns>
                                <dx:ListBoxColumn FieldName="name_al_fasl" />
                            </Columns>
                        </PropertiesComboBox>
                        <Settings AutoFilterCondition="BeginsWith" />
                        <EditFormSettings CaptionLocation="Top" />
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="المؤسسة" FieldName="alsofof_code" VisibleIndex="1">
                        <PropertiesComboBox DataSourceID="DSalsofof" DropDownStyle="DropDown" IncrementalFilteringMode="StartsWith" TextField="alsofof_name" ValueField="alsofof_code" Width="200px">
                            <Columns>
                                <dx:ListBoxColumn FieldName="alsofof_name" />
                            </Columns>
                        </PropertiesComboBox>
                        <Settings AutoFilterCondition="BeginsWith" />
                        <EditFormSettings CaptionLocation="Top" />
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="نوع الزياة" FieldName="id_type_prog" VisibleIndex="3">
                        <PropertiesComboBox DataSourceID="DStype_prog" DropDownStyle="DropDown" IncrementalFilteringMode="StartsWith" TextField="name_prog" ValueField="type_prog_id" Width="200px">
                            <Columns>
                                <dx:ListBoxColumn FieldName="name_prog" />
                            </Columns>
                        </PropertiesComboBox>
                        <Settings AutoFilterCondition="BeginsWith" />
                        <EditFormSettings CaptionLocation="Top" />
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataMemoColumn Caption="ملخص التقرير" FieldName="name_prog" VisibleIndex="5">
                        <PropertiesMemoEdit Height="150px" Rows="3" Width="200px">
                        </PropertiesMemoEdit>
                        <EditFormSettings CaptionLocation="Top" ColumnSpan="2" />
                    </dx:GridViewDataMemoColumn>
                    <dx:GridViewDataDateColumn Caption="تاريخ الزيارة" FieldName="date_up" VisibleIndex="4">
                        <PropertiesDateEdit Width="200px">
                        </PropertiesDateEdit>
                        <EditFormSettings CaptionLocation="Top" />
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataSpinEditColumn Caption="رقم الاستمارة" FieldName="Description" VisibleIndex="6">
                        <PropertiesSpinEdit DisplayFormatString="g" Width="200px">
                        </PropertiesSpinEdit>
                        <EditFormSettings CaptionLocation="Top" RowSpan="2" />
                    </dx:GridViewDataSpinEditColumn>
                    <dx:GridViewDataHyperLinkColumn Caption="التفاصيل" FieldName="id_prog" VisibleIndex="7">
                        <PropertiesHyperLinkEdit NavigateUrlFormatString="DetailViewer.aspx?id={0}" TextFormatString="التفاصيل">
                        </PropertiesHyperLinkEdit>
                        <EditFormSettings CaptionLocation="Top" Visible="False" />
                    </dx:GridViewDataHyperLinkColumn>
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" 
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
                    <EditForm AllowResize="True" HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="Above" />
                </SettingsPopup>
                <Styles 
                    CssPostfix="PlasticBlue">
                    <Header ImageSpacing="10px" SortingImageSpacing="10px" Font-Bold="False" 
                        Font-Size="Medium">
                    </Header>
                    <EditForm Font-Size="Medium">
                    </EditForm>
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
                <StylesPopup>
                    <EditForm>
                        <Content Font-Size="Medium">
                        </Content>
                    </EditForm>
                </StylesPopup>
            </dx:ASPxGridView>
            <asp:AccessDataSource ID="DSData" runat="server" 
                DataFile="~/App_Data/egycsfolow.mdb" 
                DeleteCommand="DELETE FROM [center] WHERE [id_prog] = ?" 
                InsertCommand="INSERT INTO [center] ( [code_al_fasl], [alsofof_code], [id_type_prog], [name_prog], [date_up], [Description], [link]) VALUES (?, ?, ?, ?, ?, ?, ?)" 
                SelectCommand="SELECT [id_prog], [code_al_fasl], [alsofof_code], [id_type_prog], [name_prog], [date_up], [Description], [link] FROM [center]" 
                UpdateCommand="UPDATE [center] SET [code_al_fasl] = ?, [alsofof_code] = ?, [id_type_prog] = ?, [name_prog] = ?, [date_up] = ?, [Description] = ?, [link] = ? WHERE [id_prog] = ?" 
                OnSelecting="DSData_Selecting" oninserting="DSData_Inserting" 
                onupdating="DSData_Updating">
                <DeleteParameters>
                    <asp:Parameter Name="id_prog" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="code_al_fasl" Type="Byte" />
                    <asp:Parameter Name="alsofof_code" Type="Byte" />
                    <asp:Parameter Name="id_type_prog" Type="Byte" />
                    <asp:Parameter Name="name_prog" Type="String" />
                    <asp:Parameter Name="date_up" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="link" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="code_al_fasl" Type="Byte" />
                    <asp:Parameter Name="alsofof_code" Type="Byte" />
                    <asp:Parameter Name="id_type_prog" Type="Byte" />
                    <asp:Parameter Name="name_prog" Type="String" />
                    <asp:Parameter Name="date_up" Type="String" />
                    <asp:Parameter Name="Description" Type="String" />
                    <asp:Parameter Name="link" Type="String" />
                    <asp:Parameter Name="id_prog" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DScode_fasl" runat="server" 
                DataFile="~/App_Data/egycsfolow.mdb" 
                
                
                SelectCommand="SELECT [code_al_fasl], [name_al_fasl] FROM [code_fasl]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSalsofof" runat="server" 
                DataFile="~/App_Data/egycsfolow.mdb" 
                
                
                SelectCommand="SELECT [alsofof_code], [alsofof_name] FROM [alsofof]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DStype_prog" runat="server" 
                DataFile="~/App_Data/egycsfolow.mdb" 
                
                
                SelectCommand="SELECT [type_prog_id], [name_prog] FROM [type_prog]">
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
