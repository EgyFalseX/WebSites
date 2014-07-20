<%@ Page Title="" Language="C#" MasterPageFile="AdminMasterPage.master" AutoEventWireup="true" CodeFile="UserEditor[Deleted].aspx.cs" Inherits="UserEditor" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    
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
                KeyFieldName="UserID" RightToLeft="True" 
                SummaryText="الملخص" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" 
                CssPostfix="PlasticBlue" EnableTheming="True" 
                onrowdeleted="GVEditor_RowDeleted" onrowupdated="GVEditor_RowUpdated" 
                onrowinserted="GVEditor_RowInserted" Font-Bold="True" 
                oncancelrowediting="GVEditor_CancelRowEditing" 
                onrowdeleting="GVEditor_RowDeleting" 
                onstartrowediting="GVEditor_StartRowEditing">
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
                    <dx:GridViewDataImageColumn Caption="مسار الصورة" FieldName="imgpath" 
                        VisibleIndex="13">
                        <PropertiesImage ImageHeight="32px" ImageUrlFormatString="Assets/userimages/{0}" 
                            ImageWidth="32px">
                        </PropertiesImage>
                        <EditFormSettings ColumnSpan="2" />
                        <EditItemTemplate>
                            <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" CssFilePath="App_Themes/DevEx/{0}/styles.css"
                                CssPostfix="DevEx" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete"
                                ShowProgressPanel="True" ShowUploadButton="True" SpriteCssFilePath="App_Themes/DevEx/{0}/sprite.css"
                                Width="280px">
                                <validationsettings generalerrortext="فشل التحميل بسبب خطــاء داخلي" maxfilesize="102400"
                                    
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
                    <dx:GridViewDataTextColumn Caption="اسم المستخدم" FieldName="UserName" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="كلمة المرور" FieldName="Password" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn Caption="الوظيفة" FieldName="titleId" VisibleIndex="3">
                        <PropertiesComboBox DataSourceID="DSCDtitle" TextField="titleName" ValueField="titleId">
                            <Columns>
                                <dx:ListBoxColumn Caption="اسم العنوان" FieldName="titleName" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataCheckColumn Caption="مدير" FieldName="IsAdmin" VisibleIndex="4">
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn Caption="متاح" FieldName="IsActive" VisibleIndex="5">
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataTextColumn Caption="الاسم الكامل" FieldName="realname" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="موبيل" FieldName="mobil" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="بريد" FieldName="umail" VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn Caption="الادارة" FieldName="udeptId" VisibleIndex="9">
                        <PropertiesComboBox DataSourceID="DSCDdept" TextField="deptName" ValueField="deptId">
                            <Columns>
                                <dx:ListBoxColumn Caption="اسم الادارة" FieldName="deptName" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn Caption="التوقيع" VisibleIndex="11" FieldName="signture">
                    </dx:GridViewDataTextColumn>
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
            </dx:ASPxGridView>
            <asp:AccessDataSource ID="DSData" runat="server" 
                DataFile="~/App_Data/contact.mdb" 
                SelectCommand="SELECT [UserID], [UserName], [titleId], [Password], [IsAdmin], [IsActive], [realname], [mobil], [umail], [udeptId], [imgpath], [signture] FROM [Users]" 
                OnSelecting="DSData_Selecting" oninserting="DSData_Inserting" 
                onupdating="DSData_Updating" DeleteCommand="DELETE FROM [Users] WHERE (([UserID] = ?) OR ([UserID] IS NULL AND ? IS NULL))" InsertCommand="INSERT INTO [Users] ([UserID], [UserName], [titleId], [Password], [IsAdmin], [IsActive], [realname], [mobil], [umail], [udeptId], [imgpath], [signture]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" UpdateCommand="UPDATE [Users] SET [UserName] = ?, [titleId] = ?, [Password] = ?, [IsAdmin] = ?, [IsActive] = ?, [realname] = ?, [mobil] = ?, [umail] = ?, [udeptId] = ?, [imgpath] = ?, [signture] = ? WHERE UserID = ?">
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
            <asp:AccessDataSource ID="DSCDtitle" runat="server" 
                DataFile="~/App_Data/contact.mdb" 
                SelectCommand="SELECT [titleId], [titleName] FROM [CDtitle]" 
                OnSelecting="DSData_Selecting" oninserting="DSData_Inserting" 
                onupdating="DSData_Updating">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSCDdept" runat="server" 
                DataFile="~/App_Data/contact.mdb" 
                SelectCommand="SELECT [deptId], [deptName] FROM [CDdept]" 
                OnSelecting="DSData_Selecting" oninserting="DSData_Inserting" 
                onupdating="DSData_Updating">
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
    Font-Bold="False">
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

