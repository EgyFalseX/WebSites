<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="centerEditor.aspx.cs" Inherits="centerEditor" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
<body>

<table align="center" style="width: 400px; height: 470px;">
    <tr>
        <td>
            <dx:ASPxGridView ID="GVEditor" runat="server" AutoGenerateColumns="False" 
                Caption="البيــــــــــا نـــــــــــــــات" DataSourceID="DSData" 
                KeyFieldName="ItemID" RightToLeft="True" 
                SummaryText="الملخص" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" 
                CssPostfix="PlasticBlue" EnableTheming="True" 
                onrowdeleted="GVEditor_RowDeleted" onrowupdated="GVEditor_RowUpdated" 
                onrowinserted="GVEditor_RowInserted" Font-Bold="True" 
                oncancelrowediting="GVEditor_CancelRowEditing" 
                onrowdeleting="GVEditor_RowDeleting" 
                onstartrowediting="GVEditor_StartRowEditing" Theme="SoftOrange" 
                OnHtmlDataCellPrepared="GVEditor_HtmlDataCellPrepared" Width="433px">
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
                    <dx:GridViewDataImageColumn Caption="الصورة" FieldName="ItemPic" 
                        VisibleIndex="3" Visible="False">
                        <PropertiesImage ImageHeight="32px" ImageUrlFormatString="uc/files/{0}" 
                            ImageWidth="32px">
                        </PropertiesImage>
                        <EditFormSettings CaptionLocation="Top" Visible="True" />
                        <DataItemTemplate>
                            <dx:ASPxHyperLink ID="HLlink" runat="server" NavigateUrl='<%# Eval("ItemPic", "uc/files/{0}") %>' Text="تحميل" />
                        </DataItemTemplate>
                        <EditItemTemplate>
                            <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" CssFilePath="App_Themes/DevEx/{0}/styles.css"
                                CssPostfix="DevEx" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete"
                                ShowProgressPanel="True" ShowUploadButton="True" SpriteCssFilePath="App_Themes/DevEx/{0}/sprite.css"
                                Width="280px">
                                <validationsettings generalerrortext="فشل التحميل بسبب خطــاء داخلي" maxfilesize="153600"
                                    
                                    maxfilesizeerrortext="الملف اكبر من 150 كيلوبايت برجاء رفع ملف اصغر من 150 كيلوبايت" multiselectionerrortext="خطاء في نوع الملف :  {0} files are invalid because they exceed the allowed file size ({1}) or their extensions are not allowed. These files have been removed from selection, so they will not be uploaded. 

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
                    <dx:GridViewDataTextColumn Caption="الدورة" VisibleIndex="1" FieldName="ItemName">
                        <PropertiesTextEdit Width="250px">
                        </PropertiesTextEdit>
                        <EditFormSettings CaptionLocation="Top" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataMemoColumn Caption="نبذة" FieldName="ItemInfo" 
                        VisibleIndex="2">
                        <PropertiesMemoEdit Height="150px" Width="250px">
                        </PropertiesMemoEdit>
                        <EditFormSettings ColumnSpan="2" RowSpan="4" />
                    </dx:GridViewDataMemoColumn>
                    <dx:GridViewDataCheckColumn Caption="تعرض" VisibleIndex="5" FieldName="Show_Hide">
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataHyperLinkColumn Caption="التفاصيل" FieldName="ItemID" VisibleIndex="4">
                        <PropertiesHyperLinkEdit NavigateUrlFormatString="CreatePage.aspx?id={0}" TextFormatString="التفاصيل">
                        </PropertiesHyperLinkEdit>
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataHyperLinkColumn>
                    <dx:GridViewDataHyperLinkColumn Caption="تفاصيل الحجز" FieldName="ItemID" VisibleIndex="7">
                        <PropertiesHyperLinkEdit NavigateUrlFormatString="ViewReservation.aspx?id={0}" TextFormatString="تفاصيل الحجز">
                        </PropertiesHyperLinkEdit>
                    </dx:GridViewDataHyperLinkColumn>
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" 
                    SortMode="DisplayText" ColumnResizeMode="Control" />
                <SettingsPager ShowDefaultImages="False" PageSize="20">
                    <AllButton Text="All">
                    </AllButton>
                    <NextPageButton Text="Next &gt;">
                    </NextPageButton>
                    <PrevPageButton Text="&lt; Prev">
                    </PrevPageButton>
                    <Summary AllPagesText="صفحات :  {0} - {1} ({2} عناصر)" Position="Right" 
                        Text="صفحه {0} of {1} ({2} عنصر)" />
                </SettingsPager>
                <SettingsEditing EditFormColumnCount="1" />
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
                DataFile="~/App_Data/AATSWEB.mdb" 
                DeleteCommand="DELETE FROM [MenuItem] WHERE [ItemID] = ?" 
                InsertCommand="INSERT INTO [MenuItem] ( [ItemName],[ItemNamee],  [Data_Path],[Data_Pathe], [ItemInfo],[ItemInfoe], [ItemPic],[Show_Hide]) VALUES (  ?,?,?,?, ?, ?, ?, ?)" 
                SelectCommand="SELECT [ItemID], [ItemName],[ItemNamee], [Show_Hide], [Data_Path],[Data_Pathe], [ItemInfo],[ItemInfoe], [ItemPic],[Show_Hide] FROM [MenuItem]" 
                UpdateCommand="UPDATE [MenuItem] SET [ItemName] = ?,[ItemNamee] = ?,  [Data_Path] = ?,[Data_Pathe] = ?, [ItemInfo] = ?,[ItemInfoe] = ?, [ItemPic] = ? , [ItemPic] = ? WHERE [ItemID] = ?" 
                OnSelecting="DSData_Selecting" oninserting="DSData_Inserting" 
                onupdating="DSData_Updating">
                <DeleteParameters>
                    <asp:Parameter Name="ItemID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ItemName" Type="String" />
                    <asp:Parameter Name="ItemNamee" Type="String" />
                    <asp:Parameter Name="Data_Path" Type="String" />
                    <asp:Parameter Name="Data_Pathe" Type="String" />
                    <asp:Parameter Name="ItemInfo" Type="String" />
                     <asp:Parameter Name="ItemInfoe" Type="String" />
                    <asp:Parameter Name="ItemPic" Type="String" />
                    <asp:Parameter Name="Show_Hide" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ItemName" Type="String" />
                    <asp:Parameter Name="ItemNamee" Type="String" />
                     <asp:Parameter Name="Data_Path" Type="String" />
                    <asp:Parameter Name="Data_Pathe" Type="String" />
                    <asp:Parameter Name="ItemInfo" Type="String" />
                    <asp:Parameter Name="ItemInfoe" Type="String" />
                    <asp:Parameter Name="ItemPic" Type="String" />
                    <asp:Parameter Name="Show_Hide" Type="Boolean" />
                    <asp:Parameter Name="ItemID" Type="Int32" />
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
    SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" Height="73px" 
    Width="248px" style="text-align: center" 
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

