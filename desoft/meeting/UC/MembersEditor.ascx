<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MembersEditor.ascx.cs" Inherits="MembersEditor" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>

<table align="center">
    <tr>
        <td dir="ltr">
            <dx:ASPxComboBox ID="CBExporter" runat="server" 
                CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" 
                onbuttonclick="CBExporter_ButtonClick" Spacing="0" 
                SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css">
                <Items>
                    <dx:ListEditItem Text="Rtf" Value="Rtf" />
                    <dx:ListEditItem Text="Pdf" Value="Pdf" />
                    <dx:ListEditItem Text="Xls" Value="Xls" />
                    <dx:ListEditItem Text="Xlsx" Value="Xlsx" />
                    <dx:ListEditItem Text="Csv" Value="Csv" />
                </Items>
                <LoadingPanelImage Url="../App_Themes/DevEx/Editors/Loading.gif">
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
            <dx:ASPxGridView ID="GVEditor" runat="server" AutoGenerateColumns="False" 
                Caption="البيــــــــــا نـــــــــــــــات" DataSourceID="DSData" 
                KeyFieldName="MemberId" RightToLeft="True" 
                SummaryText="الملخص" CssFilePath="../App_Themes/DevEx/{0}/styles.css" 
                CssPostfix="DevEx" EnableTheming="True" 
                onrowdeleted="GVEditor_RowDeleted" onrowupdated="GVEditor_RowUpdated" 
                onrowinserted="GVEditor_RowInserted" Width="700px" 
                onrowupdating="GVEditor_RowUpdating" 
                oncancelrowediting="GVEditor_CancelRowEditing" 
                onrowinserting="GVEditor_RowInserting" 
                onstartrowediting="GVEditor_StartRowEditing" Font-Bold="True">
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
                    <dx:GridViewDataTextColumn Caption="الاسم" FieldName="MemberName" 
                        VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn Caption="اللجنة" FieldName="LagnaId" 
                        VisibleIndex="2">
                        <PropertiesComboBox DataSourceID="DSCDLagna" TextField="LagnaName" 
                            ValueField="LagnaId" ValueType="System.Int32">
                            <Columns>
                                <dx:ListBoxColumn Caption="اختار اسم" FieldName="LagnaName" />
                            </Columns>
                            <Style HorizontalAlign="Center">
                            </Style>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn Caption="محل العمل" FieldName="Memberworkon" 
                        VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="الصوره" 
                        VisibleIndex="9" Name="picpath">
                        <DataItemTemplate>
                            <dx:ASPxImage ID="ASPxImage1" runat="server" Height="48px" 
                                ImageUrl='<%# Eval("picpath", "../Files/pic/{0}") %>' Width="48px">
                            </dx:ASPxImage>
                        </DataItemTemplate>
                        <EditItemTemplate>
                            <dx:ASPxUploadControl ID="UCpic" runat="server" 
                                CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" 
                                onfileuploadcomplete="UCpic_FileUploadComplete" ShowProgressPanel="True" 
                                SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" Width="280px" 
                                ShowUploadButton="True">
                                <ValidationSettings generalerrortext="فشل التحميل بسبب خطــاء داخلي" 
                                    maxfilesize="1048576" 
                                    maxfilesizeerrortext="الملف اكبر من 1 ميجا برجاء رفع ملف اصغر من 1 ميجا" MultiSelectionErrorText="خطاء في نوع الملف :  {0} files are invalid because they exceed the allowed file size ({1}) or their extensions are not allowed. These files have been removed from selection, so they will not be uploaded. 

{2}" notallowedfileextensionerrortext="امتداد الملف غير مسموح به">
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
                    <dx:GridViewDataComboBoxColumn Caption="الوظيفة" FieldName="jobId" 
                        VisibleIndex="3">
                        <PropertiesComboBox DataSourceID="DSCDjob" TextField="jobName" 
                            ValueField="jobId" ValueType="System.Int32">
                            <Columns>
                                <dx:ListBoxColumn Caption="اختار اسم" FieldName="jobName" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn Caption="تليفون" FieldName="Membertel" 
                        VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="موبيل" FieldName="Membermobil" 
                        VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="بريد اليكتروني" FieldName="Memberemail" 
                        VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="العنوان" FieldName="Memberaddress" 
                        VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" 
                    SortMode="DisplayText" ColumnResizeMode="NextColumn" />
                <SettingsPager>
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
                <Images SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css">
                    <LoadingPanelOnStatusBar Url="../App_Themes/DevEx/GridView/StatusBarLoading.gif">
                    </LoadingPanelOnStatusBar>
                    <LoadingPanel Url="../App_Themes/DevEx/GridView/Loading.gif">
                    </LoadingPanel>
                </Images>
                <ImagesFilterControl>
                    <LoadingPanel Url="../App_Themes/DevEx/GridView/Loading.gif">
                    </LoadingPanel>
                </ImagesFilterControl>
                <Styles CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx">
                    <Header ImageSpacing="5px" SortingImageSpacing="5px" Font-Bold="False" 
                        Font-Size="Medium" HorizontalAlign="Center">
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
            <dx:ASPxGridViewExporter ID="ASPxGridViewExporterEditor" runat="server" 
                FileName="ContactUSFX" GridViewID="GVEditor" PaperKind="A4">
            </dx:ASPxGridViewExporter>
            <asp:AccessDataSource ID="DSData" runat="server" DataFile="../App_Data/Synricate.mdb" 
                DeleteCommand="DELETE FROM [TBLMember] WHERE ([MemberId] = ?)" 
                InsertCommand="INSERT INTO [TBLMember] ([MemberName], [jobId], [Memberworkon], [Membertel], [Membermobil], [Memberemail], [Memberaddress], [picpath], [LagnaId]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)" 
                SelectCommand="SELECT [MemberId], [MemberName], [jobId], [Memberworkon], [Membertel], [Membermobil], [Memberemail], [Memberaddress], [picpath], [LagnaId] FROM [TBLMember]
WHERE EXISTS (SELECT id FROM UserMeeting 
WHERE (LagnaId = TBLMember.LagnaId) AND (id = ?))" 
                
                
                
                
                
                
                
                
                
                
                
                UpdateCommand="UPDATE [TBLMember] SET [MemberName] = ?, [jobId] = ?, [Memberworkon] = ?, [Membertel] = ?, [Membermobil] = ?, [Memberemail] = ?, [Memberaddress] = ?, [picpath] = ?, [LagnaId] = ? WHERE ([MemberId] = ?)">
                <DeleteParameters>
                    <asp:Parameter Name="MemberId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="MemberName" Type="String" />
                    <asp:Parameter Name="jobId" Type="Byte" />
                    <asp:Parameter Name="Memberworkon" Type="String" />
                    <asp:Parameter Name="Membertel" Type="String" />
                    <asp:Parameter Name="Membermobil" Type="String" />
                    <asp:Parameter Name="Memberemail" Type="String" />
                    <asp:Parameter Name="Memberaddress" Type="String" />
                    <asp:Parameter Name="picpath" Type="String" />
                    <asp:Parameter Name="LagnaId" Type="Byte" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="?" SessionField="meetingID" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="MemberName" Type="String" />
                    <asp:Parameter Name="jobId" Type="Byte" />
                    <asp:Parameter Name="Memberworkon" Type="String" />
                    <asp:Parameter Name="Membertel" Type="String" />
                    <asp:Parameter Name="Membermobil" Type="String" />
                    <asp:Parameter Name="Memberemail" Type="String" />
                    <asp:Parameter Name="Memberaddress" Type="String" />
                    <asp:Parameter Name="picpath" Type="String" />
                    <asp:Parameter Name="LagnaId" Type="Byte" />
                    <asp:Parameter Name="MemberId" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSCDLagna" runat="server" DataFile="../App_Data/Synricate.mdb"
                
                SelectCommand="SELECT [LagnaId], [LagnaName] FROM [CDLagna]
WHERE EXISTS (SELECT id FROM UserMeeting 
WHERE (LagnaId = CDLagna.LagnaId) AND (id = ?))">
                <SelectParameters>
                    <asp:SessionParameter Name="?" SessionField="meetingID" />
                </SelectParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSCDjob" runat="server" DataFile="../App_Data/Synricate.mdb"
                
                SelectCommand="SELECT [jobId], [jobName] FROM [CDjob]">
            </asp:AccessDataSource>
        </td>
    </tr>
    </table>
    
<dx:ASPxPopupControl ID="ASPxPopupControlEditor" runat="server" 
    AllowDragging="True" ClientInstanceName="popupeditor" 
    CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" 
    HeaderText="رسالـــه" MinHeight="80px" MinWidth="200px" 
    Modal="True" PopupHorizontalAlign="WindowCenter" 
    PopupVerticalAlign="WindowCenter" RightToLeft="True" 
    SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" Height="120px" 
    Width="300px" style="text-align: center" 
    Font-Bold="False">
    <LoadingPanelImage Url="../App_Themes/DevEx/Web/Loading.gif">
    </LoadingPanelImage>
    <ContentStyle Font-Bold="True" Font-Size="Medium" Font-Underline="False" 
        HorizontalAlign="Center" VerticalAlign="Middle">
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
