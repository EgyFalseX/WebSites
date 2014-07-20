<%@ Page Title="" Language="C#" MasterPageFile="AdminMasterPage.master" AutoEventWireup="true" CodeFile="UsersEditor.aspx.cs" Inherits="UsersEditor" %>
  
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
  
<body>

<table align="center">
    <tr>
        <td dir="ltr">
            <dx:ASPxComboBox ID="CBExporter" runat="server" 
                CssFilePath="App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                onbuttonclick="CBExporter_ButtonClick" 
                SpriteCssFilePath="App_Themes/PlasticBlue/{0}/sprite.css">
                <Items>
                    <dx:ListEditItem Text="Rtf" Value="Rtf" />
                    <dx:ListEditItem Text="Pdf" Value="Pdf" />
                    <dx:ListEditItem Text="Xls" Value="Xls" />
                    <dx:ListEditItem Text="Xlsx" Value="Xlsx" />
                    <dx:ListEditItem Text="Csv" Value="Csv" />
                </Items>
                <LoadingPanelImage Url="App_Themes/PlasticBlue/Editors/Loading.gif">
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
        <td style="direction: ltr">
            <dx:ASPxGridView ID="GVEditor" runat="server" AutoGenerateColumns="False" 
                Caption="البيــــــــــا نـــــــــــــــات" DataSourceID="DSData" 
                KeyFieldName="UserID" RightToLeft="True" 
                SummaryText="الملخص" CssFilePath="App_Themes/PlasticBlue/{0}/styles.css" 
                CssPostfix="PlasticBlue" EnableTheming="True" 
                onrowdeleted="GVEditor_RowDeleted" onrowupdated="GVEditor_RowUpdated" 
                onrowinserted="GVEditor_RowInserted" Font-Bold="True" OnCancelRowEditing="GVEditor_CancelRowEditing" OnRowInserting="GVEditor_RowInserting" OnRowUpdating="GVEditor_RowUpdating" OnStartRowEditing="GVEditor_StartRowEditing">
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
                        <DeleteButton Visible="True" Text="حذف">
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
                    <dx:GridViewDataTextColumn Caption="الاسم الحقيقي" FieldName="realname" 
                        VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="موبيل" FieldName="mobil" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn Caption="الوظيفة" FieldName="titleId" VisibleIndex="2">
                        <PropertiesComboBox DataSourceID="DSCDtitle" TextField="titleName" ValueField="titleId" ValueType="System.Int32">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn Caption="البريد" FieldName="umail" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn Caption="الادارة او القسم" FieldName="udeptId" VisibleIndex="5">
                        <PropertiesComboBox DataSourceID="DSCDdept" TextField="deptName" ValueField="deptId" ValueType="System.Int32">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn Caption="التوقيع" FieldName="signture" VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn Caption="نشط" FieldName="IsActive" VisibleIndex="9">
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn Caption="مدير الموقع" FieldName="IsAdmin" VisibleIndex="10">
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataTextColumn Caption="اسم المستخدم" FieldName="UserName" VisibleIndex="11">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="كلمة المرور" FieldName="Password" VisibleIndex="12">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataImageColumn Caption="الصورة" FieldName="imgpath" VisibleIndex="7">
                        <PropertiesImage ImageHeight="24px" ImageUrlFormatString="Assets/userimages/{0}" ImageWidth="24px">
                        </PropertiesImage>
                        <EditItemTemplate>
                            <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" CssFilePath="App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" onfileuploadcomplete="ASPxUploadControl1_FileUploadComplete" ShowProgressPanel="True" ShowUploadButton="True" SpriteCssFilePath="App_Themes/DevEx/{0}/sprite.css" Width="280px">
                                <ValidationSettings generalerrortext="فشل التحميل بسبب خطــاء داخلي" maxfilesize="1048576" maxfilesizeerrortext="الملف اكبر من 1 ميجا برجاء رفع ملف اصغر من 1 ميجا" MultiSelectionErrorText="خطاء في نوع الملف :  {0} files are invalid because they exceed the allowed file size ({1}) or their extensions are not allowed. These files have been removed from selection, so they will not be uploaded. 

{2}" notallowedfileextensionerrortext="امتداد الملف غير مسموح به">
                                </ValidationSettings>
                                <ClientSideEvents FilesUploadComplete="function(s, e) {}" />
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
                <Images SpriteCssFilePath="App_Themes/PlasticBlue/{0}/sprite.css">
                    <LoadingPanelOnStatusBar Url="App_Themes/PlasticBlue/GridView/gvLoadingOnStatusBar.gif">
                    </LoadingPanelOnStatusBar>
                    <LoadingPanel Url="App_Themes/PlasticBlue/GridView/Loading.gif">
                    </LoadingPanel>
                </Images>
                <ImagesFilterControl>
                    <LoadingPanel Url="App_Themes/PlasticBlue/Editors/Loading.gif">
                    </LoadingPanel>
                </ImagesFilterControl>
                <Styles CssFilePath="App_Themes/PlasticBlue/{0}/styles.css" 
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
            <asp:AccessDataSource ID="DSData" runat="server" DataFile="../App_Data/contact.mdb" SelectCommand="SELECT [UserID], [UserName], [titleId], [Password], [IsAdmin], [IsActive], [realname], [mobil], [umail], [udeptId], [imgpath], [signture] FROM [Users]" DeleteCommand="DELETE FROM [Users] WHERE ([UserID] = ?)" InsertCommand="INSERT INTO [Users] ([UserID], [UserName], [titleId], [Password], [IsAdmin], [IsActive], [realname], [mobil], [umail], [udeptId], [imgpath], [signture]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" UpdateCommand="UPDATE [Users] SET [UserName] = ?, [titleId] = ?, [Password] = ?, [IsAdmin] = ?, [IsActive] = ?, [realname] = ?, [mobil] = ?, [umail] = ?, [udeptId] = ?, [imgpath] = ?, [signture] = ? WHERE ([UserID] = ?)" OnInserting="DSData_Inserting">
                <DeleteParameters>
                    <asp:Parameter Name="UserID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="UserID" Type="Int32" />
                    <asp:Parameter Name="UserName" Type="String" />
                    <asp:Parameter Name="titleId" Type="Byte" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="IsAdmin" Type="Boolean" />
                    <asp:Parameter Name="IsActive" Type="Boolean" />
                    <asp:Parameter Name="realname" Type="String" />
                    <asp:Parameter Name="mobil" Type="String" />
                    <asp:Parameter Name="umail" Type="String" />
                    <asp:Parameter Name="udeptId" Type="Byte" />
                    <asp:Parameter Name="imgpath" Type="String" />
                    <asp:Parameter Name="signture" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="UserName" Type="String" />
                    <asp:Parameter Name="titleId" Type="Byte" />
                    <asp:Parameter Name="Password" Type="String" />
                    <asp:Parameter Name="IsAdmin" Type="Boolean" />
                    <asp:Parameter Name="IsActive" Type="Boolean" />
                    <asp:Parameter Name="realname" Type="String" />
                    <asp:Parameter Name="mobil" Type="String" />
                    <asp:Parameter Name="umail" Type="String" />
                    <asp:Parameter Name="udeptId" Type="Byte" />
                    <asp:Parameter Name="imgpath" Type="String" />
                    <asp:Parameter Name="signture" Type="String" />
                    <asp:Parameter Name="UserID" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSCDtitle" runat="server" DataFile="../App_Data/contact.mdb" SelectCommand="SELECT [titleId], [titleName] FROM [CDtitle]" OnInserting="DSData_Inserting">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSCDdept" runat="server" DataFile="../App_Data/contact.mdb" SelectCommand="SELECT [deptId], [deptName] FROM [CDdept]" OnInserting="DSData_Inserting">
            </asp:AccessDataSource>
            <dx:ASPxGridViewExporter ID="ASPxGridViewExporterEditor" runat="server" 
                FileName="ContactUSFX" GridViewID="GVEditor" PaperKind="A4">
            </dx:ASPxGridViewExporter>
        </td>
    </tr>
    </table>
    
<dx:ASPxPopupControl ID="ASPxPopupControlEditor" runat="server" 
    AllowDragging="True" ClientInstanceName="popupeditor" 
    CssFilePath="App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
    HeaderText="رسالـــه" 
    Modal="True" PopupHorizontalAlign="WindowCenter" 
    PopupVerticalAlign="WindowCenter" RightToLeft="True" 
    SpriteCssFilePath="App_Themes/PlasticBlue/{0}/sprite.css" Height="120px" 
    Width="300px" style="text-align: center" 
    Font-Bold="False">
    <LoadingPanelImage Url="App_Themes/PlasticBlue/Web/dvLoading.gif">
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

