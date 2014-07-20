<%@ Control Language="C#" AutoEventWireup="true" CodeFile="RotatorDataAdmin.ascx.cs" Inherits="RotatorDataAdmin" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.2.Export, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>

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
                KeyFieldName="ID" RightToLeft="True" 
                SummaryText="الملخص" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" 
                CssPostfix="PlasticBlue" EnableTheming="True" 
                onrowdeleted="GVEditor_RowDeleted" onrowupdated="GVEditor_RowUpdated" 
                onrowinserted="GVEditor_RowInserted" Width="700px" Font-Bold="True">
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
                        <NewButton>
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
                    <dx:GridViewDataComboBoxColumn Caption="الموضوع" FieldName="IDElement" 
                        VisibleIndex="1" ReadOnly="True">
                        <PropertiesComboBox DataSourceID="DSRotatorElement" TextField="Caption" 
                            ValueField="IDElement" ValueType="System.Int32">
                            <Columns>
                                <dx:ListBoxColumn Caption="الاسم" FieldName="Caption" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn Caption="بريد اليكتروني" FieldName="mail" 
                        VisibleIndex="2" ReadOnly="True">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataMemoColumn Caption="تعليق الزائر" FieldName="userreply" 
                        VisibleIndex="4" ReadOnly="True">
                        <PropertiesMemoEdit Height="100px">
                        </PropertiesMemoEdit>
                    </dx:GridViewDataMemoColumn>
                    <dx:GridViewDataTextColumn Caption="الاسم" FieldName="name" VisibleIndex="3" 
                        ReadOnly="True">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn Caption="يعرض" FieldName="show" VisibleIndex="6">
                    </dx:GridViewDataCheckColumn>
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
            <dx:ASPxGridViewExporter ID="ASPxGridViewExporterEditor" runat="server" 
                FileName="ContactUSFX" GridViewID="GVEditor" PaperKind="A4">
            </dx:ASPxGridViewExporter>
            <asp:AccessDataSource ID="DSData" runat="server" DataFile="../App_Data/DataDB.mdb" 
                DeleteCommand="DELETE FROM [RotatorData] WHERE [ID] = ?" 
                InsertCommand="INSERT INTO [RotatorData] ([IDElement], [name], [mail], [userreply], [show]) VALUES (?, ?, ?, ?, ?)" 
                SelectCommand="SELECT [ID], [IDElement], [name], [mail], [userreply], [show] FROM [RotatorData]" 
                
                
                
                
                
                
                
                
                
                
                
                UpdateCommand="UPDATE [RotatorData] SET [IDElement] = ?, [name] = ?, [mail] = ?, [userreply] = ?, [show] = ? WHERE [ID] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="IDElement" Type="Int32" />
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="mail" Type="String" />
                    <asp:Parameter Name="userreply" Type="String" />
                    <asp:Parameter DefaultValue="True" Name="show" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="IDElement" Type="Int32" />
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="mail" Type="String" />
                    <asp:Parameter Name="userreply" Type="String" />
                    <asp:Parameter DefaultValue="" Name="show" Type="Boolean" />
                    <asp:Parameter Name="ID" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSRotatorElement" runat="server" DataFile="../App_Data/DataDB.mdb" 
                
                SelectCommand="SELECT [IDElement], [Caption], [show] FROM [RotatorElement]">
            </asp:AccessDataSource>
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

<dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">تم 
    التحميل</dx:PopupControlContentControl>

</ContentCollection>
</dx:ASPxPopupControl>


    
