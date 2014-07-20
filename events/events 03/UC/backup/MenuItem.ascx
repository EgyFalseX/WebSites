<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MenuItem.ascx.cs" Inherits="MenuItem" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.2.Export, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
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
                DataSourceID="DSData" KeyFieldName="ItemID" RightToLeft="True" SummaryText="الملخص"
                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" EnableTheming="True"
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
                    <dx:GridViewDataTextColumn Caption="مسار الصورة" FieldName="ItemPic" VisibleIndex="12"
                        Name="ItemPic">
                        <DataItemTemplate>
                            <asp:Image ID="Image1" runat="server" Height="64px" ImageUrl='<%# Eval("ItemPic", "../Files/img/{0}") %>'
                                Width="64px" />
                        </DataItemTemplate>
                        <EditItemTemplate>
                            <dx:ASPxUploadControl ID="UCpic" runat="server" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css"
                                CssPostfix="PlasticBlue" OnFileUploadComplete="UCpic_FileUploadComplete" ShowProgressPanel="True"
                                ShowUploadButton="True" SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css"
                                Width="280px">
                                <ValidationSettings AllowedFileExtensions=".jpg" GeneralErrorText="فشل التحميل بسبب خطــاء داخلي"
                                    MaxFileSize="204800" MaxFileSizeErrorText="الملف اكبر من 200 كيلوبايت برجاء رفع ملف اصغر من 200 كيلوبايت"
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
                    <dx:GridViewDataDateColumn Caption="تاريخ البداية" FieldName="Itemdatestart" VisibleIndex="4">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy">
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn Caption="الحدث" FieldName="ItemName" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn Caption="نوع الحدث" FieldName="Itemtypeid" VisibleIndex="2">
                        <PropertiesComboBox DataSourceID="DSItemtype" TextField="Itemtype" ValueField="Itemtypeid"
                            ValueType="System.Int32">
                            <Columns>
                                <dx:ListBoxColumn Caption="الاسم" FieldName="Itemtype" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="الجهة" FieldName="LagnaId" VisibleIndex="3">
                        <PropertiesComboBox DataSourceID="DSCDLagna" TextField="LagnaName" ValueField="LagnaId"
                            ValueType="System.Int32">
                            <Columns>
                                <dx:ListBoxColumn Caption="الاسم" FieldName="LagnaName" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataDateColumn Caption="تاريخ النهايه" FieldName="Itemdateend" VisibleIndex="5">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy">
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataMemoColumn Caption="ملخص" FieldName="ItemInfo" VisibleIndex="14">
                        <PropertiesMemoEdit Height="100px">
                        </PropertiesMemoEdit>
                    </dx:GridViewDataMemoColumn>
                    <dx:GridViewDataTextColumn Caption="التفاصيل" VisibleIndex="16" 
                        FieldName="Data_Path" Name="Data_Path">
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
            <asp:AccessDataSource ID="DSData" runat="server" DataFile="../App_Data/events.mdb"
                DeleteCommand="DELETE FROM [MenuItem] WHERE [ItemID] = ?" InsertCommand="INSERT INTO [MenuItem] ([ItemName], [Itemtypeid], [LagnaId], [Itemdatestart], [Itemdateend], [Show_Hide], [Data_Path], [ItemInfo], [ItemPic]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"
                SelectCommand="SELECT [ItemID], [ItemName], [Itemtypeid], [LagnaId], [Itemdatestart], [Itemdateend], [Show_Hide], [Data_Path], [ItemInfo], [ItemPic] FROM [MenuItem]"
                UpdateCommand="UPDATE [MenuItem] SET [ItemName] = ?, [Itemtypeid] = ?, [LagnaId] = ?, [Itemdatestart] = ?, [Itemdateend] = ?, [Show_Hide] = ?, [Data_Path] = ?, [ItemInfo] = ?, [ItemPic] = ? WHERE [ItemID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ItemID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="ItemName" Type="String" />
                    <asp:Parameter Name="Itemtypeid" Type="Byte" />
                    <asp:Parameter Name="LagnaId" Type="Int32" />
                    <asp:Parameter Name="Itemdatestart" Type="DateTime" />
                    <asp:Parameter Name="Itemdateend" Type="DateTime" />
                    <asp:Parameter Name="Show_Hide" Type="Int16" />
                    <asp:Parameter Name="Data_Path" Type="String" />
                    <asp:Parameter Name="ItemInfo" Type="String" />
                    <asp:Parameter Name="ItemPic" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="ItemName" Type="String" />
                    <asp:Parameter Name="Itemtypeid" Type="Byte" />
                    <asp:Parameter Name="LagnaId" Type="Int32" />
                    <asp:Parameter Name="Itemdatestart" Type="DateTime" />
                    <asp:Parameter Name="Itemdateend" Type="DateTime" />
                    <asp:Parameter Name="Show_Hide" Type="Int16" />
                    <asp:Parameter Name="Data_Path" Type="String" />
                    <asp:Parameter Name="ItemInfo" Type="String" />
                    <asp:Parameter Name="ItemPic" Type="String" />
                    <asp:Parameter Name="ItemID" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSItemtype" runat="server" DataFile="../App_Data/events.mdb"
                SelectCommand="SELECT [Itemtypeid], [Itemtype] FROM [Itemtype]"></asp:AccessDataSource>
            <asp:AccessDataSource ID="DSCDLagna" runat="server" DataFile="../App_Data/events.mdb"
                SelectCommand="SELECT [LagnaId], [LagnaName] FROM [CDLagna]"></asp:AccessDataSource>
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


