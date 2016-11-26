<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MenuItem.ascx.cs" Inherits="MenuItem" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<table align="center">
    <tr>
        <td dir="ltr">
            <dx:ASPxComboBox ID="CBExporter" runat="server" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css"
                CssPostfix="PlasticBlue" OnButtonClick="CBExporter_ButtonClick" Spacing="0" SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css">
                <Items>
                    <dx:ListEditItem Text="Rtf" Value="Rtf" />
                    <dx:ListEditItem Text="Pdf" Value="Pdf" />
                    <dx:ListEditItem Text="Xls" Value="Xls" />
                    <dx:ListEditItem Text="Xlsx" Value="Xlsx" />
                    <dx:ListEditItem Text="Csv" Value="Csv" />
                </Items>
                <LoadingPanelImage Url="../App_Themes/PlasticBlue/Editors/Loading.gif">
                </LoadingPanelImage>
                <LoadingPanelStyle ImageSpacing="5px">
                </LoadingPanelStyle>
                <DropDownButton Position="Left">
                </DropDownButton>
                <Buttons>
                    <dx:EditButton Text="تصدير" Width="50px">
                    </dx:EditButton>
                </Buttons>
                <ButtonStyle Width="13px">
                </ButtonStyle>
            </dx:ASPxComboBox>
        </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxGridView ID="GVEditor" runat="server" AutoGenerateColumns="False" Caption="البيــــــــــا نـــــــــــــــات"
                DataSourceID="DSData" KeyFieldName="id" RightToLeft="True" SummaryText="الملخص"
                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" 
                CssPostfix="PlasticBlue" EnableTheming="True"
                OnRowDeleted="GVEditor_RowDeleted" OnRowUpdated="GVEditor_RowUpdated" 
                OnRowInserted="GVEditor_RowInserted" OnRowUpdating="GVEditor_RowUpdating" OnCancelRowEditing="GVEditor_CancelRowEditing"
                OnRowInserting="GVEditor_RowInserting" OnStartRowEditing="GVEditor_StartRowEditing"
                Font-Bold="True" EnableCallBacks="False">
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
                    <dx:ASPxSummaryItem DisplayFormat="العـدد : {0}" FieldName="addno" ShowInColumn="coname"
                        ShowInGroupFooterColumn="coname" SummaryType="Count" />
                </TotalSummary>
                <Columns>
                    <dx:GridViewCommandColumn ButtonType="Image" Caption="العمليات" VisibleIndex="0">
                        <EditButton Visible="True">
                            <Image Url="../images/edit.png" Width="26px">
                            </Image>
                        </EditButton>
                        <NewButton Visible="True">
                            <Image Url="../images/insert.png" Width="26px">
                            </Image>
                        </NewButton>
                        <DeleteButton Visible="True" Text="حذف">
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
                    <dx:GridViewDataTextColumn VisibleIndex="12"
                        Name="emptyCol" UnboundType="String">
                        <EditFormSettings Caption="مسار ملف" CaptionLocation="Top" />
                        <EditItemTemplate>
                            <dx:ASPxUploadControl ID="UCpic" runat="server" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css"
                                CssPostfix="PlasticBlue" OnFileUploadComplete="UCpic_FileUploadComplete" ShowProgressPanel="True"
                                ShowUploadButton="True" SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css"
                                Width="280px">
                                <ValidationSettings GeneralErrorText="فشل التحميل بسبب خطــاء داخلي"
                                    MaxFileSize="102400" MaxFileSizeErrorText="الملف اكبر من 100 كيلوبايت برجاء رفع ملف اصغر من 100 كيلوبايت"
                                    MultiSelectionErrorText="خطاء في نوع الملف :  {0} files are invalid because they exceed the allowed file size ({1}) or their extensions are not allowed. These files have been removed from selection, so they will not be uploaded. 

{2}" NotAllowedFileExtensionErrorText="امتداد الملف غير مسموح به">
                                </ValidationSettings>
                                <ClientSideEvents  FileUploadComplete="function(s, e) {
  _aspxGetElementById('lblPath').innerHTML = e.callbackData;
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
                            <dx:ASPxLabel ID="lblPath" runat="server" ClientInstanceName="lblPath" 
                                Text="." ClientIDMode="Static" style="direction: ltr">
                            </dx:ASPxLabel>
                        </EditItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="التاريخ" FieldName="add_date" 
                        VisibleIndex="1">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy">
                        </PropertiesDateEdit>
                        <EditFormSettings CaptionLocation="Top" />
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataComboBoxColumn Caption="الصف" FieldName="alsofof_code" 
                        VisibleIndex="2">
                        <PropertiesComboBox DataSourceID="DSalsofof" TextField="alsofof_name" ValueField="alsofof_code"
                            ValueType="System.Int32">
                            <Columns>
                                <dx:ListBoxColumn Caption="الاسم" FieldName="alsofof_name" />
                            </Columns>
                        </PropertiesComboBox>
                        <EditFormSettings CaptionLocation="Top" />
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="الفصل" FieldName="fasl_code" 
                        VisibleIndex="3">
                        <PropertiesComboBox DataSourceID="DSfasl" TextField="fasl_name" ValueField="fasl_code"
                            ValueType="System.Int32">
                            <Columns>
                                <dx:ListBoxColumn Caption="الاسم" FieldName="fasl_name" />
                            </Columns>
                        </PropertiesComboBox>
                        <EditFormSettings CaptionLocation="Top" />
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn Caption="التفاصيل" VisibleIndex="16" 
                        FieldName="Data_Path" Name="Data_Path">
                        <EditFormSettings CaptionLocation="Top" />
                        <DataItemTemplate>
                        
                        </DataItemTemplate>
                        <EditItemTemplate>
                           <CKEditor:CKEditorControl ID="CKEditor1" runat="server" Language="ar" 
                                Text='<%# Bind("Data_Path") %>' Width="" 
                                ondatabinding="CKEditor1_DataBinding"></CKEditor:CKEditorControl>
                        </EditItemTemplate>
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" SortMode="DisplayText"
                    ColumnResizeMode="NextColumn" />
                <SettingsPager>
                    <Summary AllPagesText="صفحات :  {0} - {1} ({2} عناصر)" Position="Right" Text="صفحه {0} of {1} ({2} عنصر)" />
                </SettingsPager>
                <Settings ShowFilterBar="Visible" ShowFilterRow="True" ShowFilterRowMenu="True" ShowFooter="True"
                    ShowGroupPanel="True" ShowHeaderFilterButton="True" ShowTitlePanel="True" />
                <SettingsText CommandCancel="الغاء" CommandClearFilter="مسح التصفيه" CommandDelete="حذف"
                    CommandEdit="تعديل" CommandNew="جديد" CommandSelect="اختار" CommandUpdate="تحديث"
                    ConfirmDelete="هل انت متأكد؟" CustomizationWindowCaption="خيارات" EmptyDataRow="فارغ"
                    EmptyHeaders="راس فارغ" FilterBarClear="مسح التصفبه" FilterBarCreateFilter="صناعة تصفيه"
                    FilterControlPopupCaption="خيارات التصفيه" GroupContinuedOnNextPage="تستكمل المجموعه في الصفحه القادمه"
                    GroupPanel="اسحب عمود ثم افلته هنا لصناعه مجموعه" HeaderFilterShowAll="اظهار الكل"
                    HeaderFilterShowBlanks="اظهار الفارغ" HeaderFilterShowNonBlanks="اظهار غير الفارغ"
                    PopupEditFormCaption="صفحة المحرر" />
                <Images SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css">
                    <LoadingPanelOnStatusBar Url="../App_Themes/PlasticBlue/GridView/StatusBarLoading.gif">
                    </LoadingPanelOnStatusBar>
                    <LoadingPanel Url="../App_Themes/PlasticBlue/GridView/Loading.gif">
                    </LoadingPanel>
                </Images>
                <ImagesFilterControl>
                    <LoadingPanel Url="../App_Themes/PlasticBlue/GridView/Loading.gif">
                    </LoadingPanel>
                </ImagesFilterControl>
                <Styles CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
                    <Header ImageSpacing="5px" SortingImageSpacing="5px" Font-Bold="False" Font-Size="Medium"
                        HorizontalAlign="Center">
                    </Header>
                    <Cell HorizontalAlign="Center">
                    </Cell>
                    <LoadingPanel ImageSpacing="5px">
                    </LoadingPanel>
                    <EditFormTable>
                        <Border BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                    </EditFormTable>
                    <EditFormColumnCaption BackColor="Gray" ForeColor="White">
                        <Border BorderColor="White" BorderStyle="Solid" BorderWidth="10px" />
                    </EditFormColumnCaption>
                </Styles>
                <StylesPager>
                    <CurrentPageNumber Font-Bold="False">
                    </CurrentPageNumber>
                    <PageNumber Font-Bold="False">
                    </PageNumber>
                </StylesPager>
                <StylesEditors ButtonEditCellSpacing="0">
                    <ProgressBar Height="21px">
                    </ProgressBar>
                </StylesEditors>
            </dx:ASPxGridView>
            <dx:ASPxGridViewExporter ID="ASPxGridViewExporterEditor" runat="server" FileName="ContactUSFX"
                GridViewID="GVEditor" PaperKind="A4">
            </dx:ASPxGridViewExporter>
            <asp:AccessDataSource ID="DSData" runat="server" DataFile="../App_Data/home_work.mdb"
                DeleteCommand="DELETE FROM [home_work] WHERE [id] = ?" InsertCommand="INSERT INTO [home_work] ([alsofof_code], [fasl_code], [add_date],  [Data_Path]) VALUES ( ?, ?, ?,  ?)"
                SelectCommand="SELECT [id], [alsofof_code], [fasl_code], [add_date], [read_code], [Data_Path] FROM [home_work]"
                
                UpdateCommand="UPDATE [home_work] SET [alsofof_code] = ?, [fasl_code] = ?, [add_date] = ?, [read_code] = ?, [Data_Path] = ? WHERE [id] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                   
                    <asp:Parameter Name="alsofof_code" Type="Byte" />
                    <asp:Parameter Name="fasl_code" Type="Byte" />
                    <asp:Parameter Name="add_date" Type="DateTime" />
            
                    <asp:Parameter Name="Data_Path" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="alsofof_code" Type="Byte" />
                    <asp:Parameter Name="fasl_code" Type="Byte" />
                    <asp:Parameter Name="add_date" Type="DateTime" />
                    <asp:Parameter Name="read_code" Type="Byte" />
                    <asp:Parameter Name="Data_Path" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSalsofof" runat="server" DataFile="../App_Data/home_work.mdb"
                SelectCommand="SELECT [alsofof_code], [alsofof_name] FROM [alsofof]"></asp:AccessDataSource>
            <asp:AccessDataSource ID="DSfasl" runat="server" DataFile="../App_Data/home_work.mdb"
                SelectCommand="SELECT [fasl_code], [fasl_name] FROM [fasl]"></asp:AccessDataSource>
        </td>
    </tr>
</table>
<dx:ASPxPopupControl ID="ASPxPopupControlEditor" runat="server" AllowDragging="True"
    ClientInstanceName="popupeditor" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css"
    CssPostfix="PlasticBlue" HeaderText="رسالـــه" MinHeight="80px" MinWidth="200px" Modal="True"
    PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" RightToLeft="True"
    SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" Height="120px" Width="300px"
    Style="text-align: center" Font-Bold="False">
    <LoadingPanelImage Url="../App_Themes/PlasticBlue/Web/Loading.gif">
    </LoadingPanelImage>
    <ContentStyle Font-Bold="True" Font-Size="Medium" Font-Underline="False" HorizontalAlign="Center"
        VerticalAlign="Middle">
        <Border BorderStyle="Solid" BorderWidth="10px" />
    </ContentStyle>
    <HeaderStyle>
        <Paddings PaddingLeft="7px" />
    </HeaderStyle>
    <LoadingPanelStyle ImageSpacing="5px">
    </LoadingPanelStyle>
    <ModalBackgroundStyle BackColor="Gray">
    </ModalBackgroundStyle>
    <ContentCollection>
        <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
            FalseX2012</dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>






