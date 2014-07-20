<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="NewsEditor.aspx.cs" Inherits="NewsEditor" %>

<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.2.Export, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxHtmlEditor.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHtmlEditor" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">


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
        <td dir="ltr">
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Uploader.aspx" 
                Target="_blank">رفع صورة</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <dx:ASPxGridView ID="GVEditor" runat="server" AutoGenerateColumns="False" 
                Caption="البيــــــــــا نـــــــــــــــات" DataSourceID="DSData" 
                KeyFieldName="code_news" RightToLeft="True" 
                SummaryText="الملخص" CssFilePath="App_Themes/PlasticBlue/{0}/styles.css" 
                CssPostfix="PlasticBlue" EnableTheming="True" Font-Bold="True">
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
                    <dx:GridViewDataTextColumn Caption="عنوان الخبر" FieldName="news_title" 
                        VisibleIndex="1">
                        <EditItemTemplate>
                            <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" 
                                Text='<%# Bind("news_title") %>' Width="200px">
                            </dx:ASPxTextBox>
                        </EditItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn Caption="يعرض" FieldName="id_starting" 
                        VisibleIndex="4">
                        <PropertiesComboBox DataSourceID="DStd_starting" TextField="name_starting" 
                            ValueField="id_starting">
                        </PropertiesComboBox>
                        <EditItemTemplate>
                            <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" DataSourceID="DStd_starting" 
                                TextField="name_starting" Value='<%# Bind("id_starting") %>' 
                                ValueField="id_starting" ValueType="System.Int32">
                                <Columns>
                                    <dx:ListBoxColumn Caption="النوع" FieldName="name_starting" />
                                </Columns>
                            </dx:ASPxComboBox>
                        </EditItemTemplate>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataDateColumn Caption="تاريخ النشر" FieldName="Timeline" 
                        VisibleIndex="3">
                        <PropertiesDateEdit DisplayFormatString="d/M/yyyy">
                        </PropertiesDateEdit>
                        <EditItemTemplate>
                            <dx:ASPxDateEdit ID="ASPxDateEdit1" runat="server" 
                                Value='<%# Bind("Timeline") %>'>
                            </dx:ASPxDateEdit>
                        </EditItemTemplate>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn Caption="التفاصيل" FieldName="news_details" 
                        VisibleIndex="2">
                        <EditFormSettings ColumnSpan="2" RowSpan="2" />
                        <DataItemTemplate>
                            ...
                        </DataItemTemplate>
                        <EditItemTemplate>
                            <dx:ASPxHtmlEditor ID="ASPxHtmlEditor1"  runat="server" 
                                    Html="<%# Bind('news_details') %>" 
                                    CssFilePath="App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                    Width="700px">
                                    <Styles CssFilePath="App_Themes/PlasticBlue/{0}/styles.css" 
                                        CssPostfix="PlasticBlue">
                                        <ViewArea>
                                            <Border BorderColor="#CCCCCC" />
                                        </ViewArea>
                                    </Styles>
                                    <Settings AllowHtmlView="False" AllowPreview="False" />
                                    <SettingsImageUpload>
                                        <ValidationSettings AllowedFileExtensions=".jpe, .jpeg, .jpg, .gif, .png" MultiSelectionErrorText="Attention! 

The following {0} files are invalid because they exceed the allowed file size ({1}) or their extensions are not allowed. These files have been removed from selection, so they will not be uploaded. 

{2}">
                                        </ValidationSettings>
                                    </SettingsImageUpload>
                                    <SettingsImageSelector>
                                        <CommonSettings AllowedFileExtensions=".jpe, .jpeg, .jpg, .gif, .png" />
                                    </SettingsImageSelector>
                                    <SettingsDocumentSelector>
                                        <CommonSettings AllowedFileExtensions=".rtf, .pdf, .doc, .docx, .odt, .txt, .xls, .xlsx, .ods, .ppt, .pptx, .odp" />
                                    </SettingsDocumentSelector>
                                    <Images SpriteCssFilePath="App_Themes/PlasticBlue/{0}/sprite.css">
                                        <LoadingPanel Url="App_Themes/PlasticBlue/GridView/Loading.gif">
                                        </LoadingPanel>
                                    </Images>
                                    <ImagesFileManager>
                                        <FolderContainerNodeLoadingPanel Url="App_Themes/PlasticBlue/Web/tvNodeLoading.gif">
                                        </FolderContainerNodeLoadingPanel>
                                        <LoadingPanel Url="App_Themes/PlasticBlue/Web/Loading.gif">
                                        </LoadingPanel>
                                    </ImagesFileManager>
                                </dx:ASPxHtmlEditor>
                        </EditItemTemplate>
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
            <asp:AccessDataSource ID="DSData" runat="server" DataFile="~/App_Data/news.mdb" 
                DeleteCommand="DELETE FROM [News] WHERE [code_news] = ?" 
                InsertCommand="INSERT INTO [News] ([news_title], [news_details], [Timeline], [id_starting]) VALUES (?, ?, ?, ?)" 
                SelectCommand="SELECT [code_news], [news_title], [news_details], [Timeline], [id_starting] FROM [News]
ORDER BY [code_news] DESC" 
                
                
                
                UpdateCommand="UPDATE [News] SET [news_title] = ?, [news_details] = ?, [Timeline] = ?, [id_starting] = ? WHERE [code_news] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="code_news" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="news_title" Type="String" />
                    <asp:Parameter Name="news_details" Type="String" />
                    <asp:Parameter Name="Timeline" Type="DateTime" />
                    <asp:Parameter Name="id_starting" Type="Byte" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="news_title" Type="String" />
                    <asp:Parameter Name="news_details" Type="String" />
                    <asp:Parameter Name="Timeline" Type="DateTime" />
                    <asp:Parameter Name="id_starting" Type="Byte" />
                    <asp:Parameter Name="code_news" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DStd_starting" runat="server" 
                DataFile="~/App_Data/news.mdb" 
                SelectCommand="SELECT [id_starting], [name_starting] FROM [td_starting]">
            </asp:AccessDataSource>
            <dx:ASPxGridViewExporter ID="ASPxGridViewExporterEditor" runat="server" 
                FileName="ContactUSFX" GridViewID="GVEditor" PaperKind="A4">
            </dx:ASPxGridViewExporter>
        </td>
    </tr>
    </table>
    


</asp:Content>

