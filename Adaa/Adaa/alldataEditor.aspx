<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="alldataEditor.aspx.cs" Inherits="alldataEditor" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>


<%@ Register assembly="DevExpress.Web.ASPxHtmlEditor.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHtmlEditor" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
 
<table align="center">
    <tr>
        <td dir="ltr">
            <dx:ASPxComboBox ID="CBExporter" runat="server" 
                CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                onbuttonclick="CBExporter_ButtonClick" 
                SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                <Items>
                    <dx:ListEditItem Text="Rtf" Value="Rtf" />
                    <dx:ListEditItem Text="Pdf" Value="Pdf" />
                    <dx:ListEditItem Text="Xls" Value="Xls" />
                    <dx:ListEditItem Text="Xlsx" Value="Xlsx" />
                    <dx:ListEditItem Text="Csv" Value="Csv" />
                </Items>
                <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
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
                KeyFieldName="dataid" RightToLeft="True" 
                SummaryText="الملخص" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                CssPostfix="PlasticBlue" EnableTheming="True" 
                onrowdeleted="GVEditor_RowDeleted" onrowupdated="GVEditor_RowUpdated" 
                onrowinserted="GVEditor_RowInserted" Font-Bold="True">
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
                    <dx:ASPxSummaryItem DisplayFormat="العـدد : {0}" FieldName="dataid" 
                        ShowInColumn="نوع الاستمارة" ShowInGroupFooterColumn="نوع الاستمارة" SummaryType="Count" />
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
                    <dx:GridViewDataComboBoxColumn Caption="نوع الاستمارة" FieldName="reporttypeid" VisibleIndex="1">
                        <PropertiesComboBox DataSourceID="DSCdreporttype" TextField="reporttype" ValueField="reporttypeid" DropDownStyle="DropDown" IncrementalFilteringMode="StartsWith">
                            <Columns>
                                <dx:ListBoxColumn Caption="الاسم" FieldName="reporttype" />
                            </Columns>
                            <ValidationSettings>
                                <RequiredField ErrorText="من فضلك اختر نوع الاستمارة" IsRequired="True" />
                            </ValidationSettings>
                        </PropertiesComboBox>
                        <Settings AllowAutoFilter="True" FilterMode="DisplayText" SortMode="DisplayText" />
                        <EditFormSettings ColumnSpan="2" />
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="رقم المتابعة" FieldName="reportnoid" VisibleIndex="2">
                        <PropertiesComboBox DataSourceID="DSCdreportno" TextField="reportno" ValueField="reportnoid" DropDownStyle="DropDown" IncrementalFilteringMode="StartsWith">
                            <Columns>
                                <dx:ListBoxColumn Caption="الاسم" FieldName="reportno" />
                            </Columns>
                            <ValidationSettings>
                                <RequiredField ErrorText="من فضلك اختر رقم المتابعة" IsRequired="True" />
                            </ValidationSettings>
                        </PropertiesComboBox>
                        <Settings AllowAutoFilter="True" FilterMode="DisplayText" SortMode="DisplayText" />
                        <EditFormSettings ColumnSpan="2" />
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="اسم الموظف" FieldName="empid" VisibleIndex="3">
                        <PropertiesComboBox DataSourceID="DSemp" TextField="empname" ValueField="empid" DropDownStyle="DropDown" IncrementalFilteringMode="StartsWith">
                            <Columns>
                                <dx:ListBoxColumn Caption="الاسم" FieldName="empname" />
                            </Columns>
                            <ValidationSettings>
                                <RequiredField ErrorText="من فضلك اختر اسم الموظف" IsRequired="True" />
                            </ValidationSettings>
                        </PropertiesComboBox>
                        <Settings AllowAutoFilter="True" FilterMode="DisplayText" SortMode="DisplayText" />
                        <EditFormSettings ColumnSpan="2" />
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn Caption="التفاصيل" FieldName="datapath" VisibleIndex="4">
                        <EditFormSettings ColumnSpan="2" RowSpan="2" />
                        <DataItemTemplate>
                            ...
                        </DataItemTemplate>
                        <EditItemTemplate>
                            <dx:ASPxHtmlEditor ID="ASPxHtmlEditor1" runat="server" Html="<%# bind('datapath') %>" RightToLeft="True">
                                <Settings AllowHtmlView="False" AllowPreview="False" />
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
                <SettingsEditing Mode="PopupEditForm" />
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
                    <EditForm AllowResize="True" HorizontalAlign="WindowCenter" Modal="True" />
                </SettingsPopup>
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
                <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
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
            <asp:AccessDataSource ID="DSData" runat="server" DataFile="~/App_Data/adaa.mdb" 
                DeleteCommand="DELETE FROM [alldata] WHERE [dataid] = ?" InsertCommand="INSERT INTO [alldata] ([dataid], [reporttypeid], [reportnoid], [empid], [datapath], [datein]) VALUES (?, ?, ?, ?, ?, date())" SelectCommand="SELECT [dataid], [reporttypeid], [reportnoid], [empid], [datapath], [datein] FROM [alldata]" 
                UpdateCommand="UPDATE [alldata] SET [reporttypeid] = ?, [reportnoid] = ?, [empid] = ?, [datapath] = ?, [datein] = date() WHERE [dataid] = ?" OnInserting="DSData_Inserting">
                <DeleteParameters>
                    <asp:Parameter Name="dataid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="dataid" Type="Int32" />
                    <asp:Parameter Name="reporttypeid" Type="Byte" />
                    <asp:Parameter Name="reportnoid" Type="Byte" />
                    <asp:Parameter Name="empid" Type="Int32" />
                    <asp:Parameter Name="datapath" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="reporttypeid" Type="Byte" />
                    <asp:Parameter Name="reportnoid" Type="Byte" />
                    <asp:Parameter Name="empid" Type="Int32" />
                    <asp:Parameter Name="datapath" Type="String" />
                    <asp:Parameter Name="dataid" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSCdreporttype" runat="server" DataFile="~/App_Data/adaa.mdb" SelectCommand="SELECT [reporttypeid], [reporttype] FROM [Cdreporttype]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSCdreportno" runat="server" DataFile="~/App_Data/adaa.mdb" SelectCommand="SELECT [reportnoid], [reportno] FROM [Cdreportno]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSemp" runat="server" DataFile="~/App_Data/adaa.mdb" SelectCommand="SELECT [empid], [empname] FROM [emp]">
            </asp:AccessDataSource>
        </td>
    </tr>
    </table>
    
<dx:ASPxPopupControl ID="ASPxPopupControlEditor" runat="server" 
    AllowDragging="True" ClientInstanceName="popupeditor" 
    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
    HeaderText="رسالـــه" 
    Modal="True" PopupHorizontalAlign="WindowCenter" 
    PopupVerticalAlign="WindowCenter" RightToLeft="True" 
    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Height="120px" 
    Width="300px" style="text-align: center" 
    Font-Bold="False">
    <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Web/dvLoading.gif">
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

