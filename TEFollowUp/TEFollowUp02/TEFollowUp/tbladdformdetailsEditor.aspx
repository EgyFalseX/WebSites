<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="tbladdformdetailsEditor.aspx.cs" Inherits="tbladdformdetailsEditor" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxFormLayout" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxRatingControl" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxTabControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">

<table align="center">
    <tr>
        <td dir="ltr">
            <dx:ASPxComboBox ID="CBExporter" runat="server" 
                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                onbuttonclick="CBExporter_ButtonClick" 
                SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" 
                Theme="Aqua">
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
        <td style="text-align: center">
            <dx:ASPxLabel ID="lblState" runat="server">
            </dx:ASPxLabel>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" TabAlign="Center">
                <TabPages>
                    <dx:TabPage Text="معاير التقييم">
                        <ContentCollection>
                            <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxGridView ID="GVEditor" runat="server" AutoGenerateColumns="False" Caption="البيــــــــــا نـــــــــــــــات" ClientInstanceName="GVEditor" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="DSData" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" EnableTheming="True" Font-Bold="True" KeyboardSupport="True" KeyFieldName="id" OnCustomCallback="GVEditor_CustomCallback" OnRowDeleted="GVEditor_RowDeleted" OnRowInserted="GVEditor_RowInserted" OnRowUpdated="GVEditor_RowUpdated" RightToLeft="True" SummaryText="الملخص" Theme="Aqua" Width="800px">
                                    <ClientSideEvents BeginCallback="function(s, e) {
s.cpShowPopup = undefined;
}" EndCallback="function(s, e) {
	
	  if(typeof(s.cpShowPopup) != 'undefined')
		{
                popupeditor.SetContentHTML(s.cpShowPopup);
				popupeditor.Show();
		} 
}" />
                                    <TotalSummary>
                                        <dx:ASPxSummaryItem DisplayFormat="العـدد : {0}" FieldName="addno" ShowInColumn="coname" ShowInGroupFooterColumn="coname" SummaryType="Count" />
                                    </TotalSummary>
                                    <Columns>
                                        <dx:GridViewCommandColumn ButtonType="Image" Caption="العمليات" ShowInCustomizationForm="True" VisibleIndex="0" Width="120px">
                                            <EditButton>
                                                <Image Url="images/edit.png" Width="26px">
                                                </Image>
                                            </EditButton>
                                            <NewButton>
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
                                        <dx:GridViewDataTextColumn Caption="معيار التقييم" FieldName="robrexe" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                            <EditFormSettings Visible="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataSpinEditColumn Caption="الدرجة" FieldName="robrexedegree" ShowInCustomizationForm="True" VisibleIndex="2">
                                            <PropertiesSpinEdit DisplayFormatString="g" LargeIncrement="5">
                                            </PropertiesSpinEdit>
                                            <DataItemTemplate>
                                                <dx:ASPxComboBox ID="cbdgree" runat="server" DropDownStyle="DropDown" IncrementalFilteringMode="StartsWith" Value='<%# Bind("robrexedegree") %>' Width="100px">
                                                    <Items>
                                                        <dx:ListEditItem Text="0" Value="0" />
                                                        <dx:ListEditItem Text="1" Value="1" />
                                                        <dx:ListEditItem Text="2" Value="2" />
                                                        <dx:ListEditItem Text="3" Value="3" />
                                                        <dx:ListEditItem Text="4" Value="4" />
                                                        <dx:ListEditItem Text="5" Value="5" />
                                                    </Items>
                                                </dx:ASPxComboBox>
                                            </DataItemTemplate>
                                        </dx:GridViewDataSpinEditColumn>
                                        <dx:GridViewDataTextColumn Caption="الوصف" FieldName="robrexedescrption" ShowInCustomizationForm="True" VisibleIndex="3">
                                            <DataItemTemplate>
                                                <dx:ASPxTextBox ID="txtDesc" runat="server" ClientInstanceName="txtDesc" Text='<%# Bind("robrexedescrption") %>' Width="200px">
                                                </dx:ASPxTextBox>
                                            </DataItemTemplate>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" ConfirmDelete="True" SortMode="DisplayText" />
                                    <SettingsPager PageSize="40" ShowDefaultImages="False">
                                        <AllButton Text="All">
                                        </AllButton>
                                        <NextPageButton Text="Next &gt;">
                                        </NextPageButton>
                                        <PrevPageButton Text="&lt; Prev">
                                        </PrevPageButton>
                                        <Summary AllPagesText="صفحات :  {0} - {1} ({2} عناصر)" Position="Right" Text="صفحه {0} of {1} ({2} عنصر)" />
                                    </SettingsPager>
                                    <Settings ShowFilterBar="Visible" ShowFilterRow="True" ShowFilterRowMenu="True" ShowFooter="True" ShowGroupPanel="True" ShowHeaderFilterButton="True" ShowTitlePanel="True" />
                                    <SettingsText CommandCancel="الغاء" CommandClearFilter="مسح التصفيه" CommandDelete="حذف" CommandEdit="تعديل" CommandNew="جديد" CommandSelect="اختار" CommandUpdate="تحديث" ConfirmDelete="هل انت متأكد؟" CustomizationWindowCaption="خيارات" EmptyDataRow="فارغ" EmptyHeaders="راس فارغ" FilterBarClear="مسح التصفبه" FilterBarCreateFilter="صناعة تصفيه" FilterControlPopupCaption="خيارات التصفيه" GroupContinuedOnNextPage="تستكمل المجموعه في الصفحه القادمه" GroupPanel="اسحب عمود ثم افلته هنا لصناعه مجموعه" HeaderFilterShowAll="اظهار الكل" HeaderFilterShowBlanks="اظهار الفارغ" HeaderFilterShowNonBlanks="اظهار غير الفارغ" PopupEditFormCaption="صفحة المحرر" />
                                    <SettingsPopup>
                                        <EditForm AllowResize="True" HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="Above" />
                                    </SettingsPopup>
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
                                    <Styles CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
                                        <Header Font-Bold="False" Font-Size="Medium" ImageSpacing="10px" SortingImageSpacing="10px">
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
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                    <dx:TabPage Text="الأساليب">
                        <ContentCollection>
                            <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxGridView ID="GVEditorAsaleeb" runat="server" AutoGenerateColumns="False" Caption="البيــــــــــا نـــــــــــــــات" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" DataSourceID="DSDataAsaleeb" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" EnableTheming="True" Font-Bold="True" KeyboardSupport="True" KeyFieldName="waytakeemid" OnRowDeleted="GVEditor_RowDeleted" OnRowInserted="GVEditor_RowInserted" OnRowUpdated="GVEditor_RowUpdated" RightToLeft="True" SummaryText="الملخص" Theme="Aqua" Width="600px">
                                    <ClientSideEvents BeginCallback="function(s, e) {
s.cpShowPopup = undefined;
}" EndCallback="function(s, e) {
	
	  if(typeof(s.cpShowPopup) != 'undefined')
		{
                popupeditor.SetContentHTML(s.cpShowPopup);
				popupeditor.Show();
		} 
}" />
                                    <TotalSummary>
                                        <dx:ASPxSummaryItem DisplayFormat="العـدد : {0}" FieldName="addno" ShowInColumn="coname" ShowInGroupFooterColumn="coname" SummaryType="Count" />
                                    </TotalSummary>
                                    <Columns>
                                        <dx:GridViewCommandColumn ButtonType="Image" Caption="العمليات" ShowInCustomizationForm="True" VisibleIndex="0" Width="120px">
                                            <EditButton>
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
                                        </dx:GridViewCommandColumn>
                                        <dx:GridViewDataComboBoxColumn Caption="اسلوب" FieldName="waytakeemid" ShowInCustomizationForm="True" VisibleIndex="1">
                                            <PropertiesComboBox DataSourceID="DSwaytakeemid" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="StartsWith" TextField="waytakeem" ValueField="waytakeemid">
                                                <Columns>
                                                    <dx:ListBoxColumn Caption="الاسم" FieldName="waytakeem" />
                                                </Columns>
                                            </PropertiesComboBox>
                                        </dx:GridViewDataComboBoxColumn>
                                    </Columns>
                                    <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" ConfirmDelete="True" SortMode="DisplayText" />
                                    <SettingsPager PageSize="40" ShowDefaultImages="False" Visible="False">
                                        <AllButton Text="All">
                                        </AllButton>
                                        <NextPageButton Text="Next &gt;">
                                        </NextPageButton>
                                        <PrevPageButton Text="&lt; Prev">
                                        </PrevPageButton>
                                        <Summary AllPagesText="صفحات :  {0} - {1} ({2} عناصر)" Position="Right" Text="صفحه {0} of {1} ({2} عنصر)" />
                                    </SettingsPager>
                                    <Settings ShowFilterBar="Visible" ShowFilterRowMenu="True" ShowFooter="True" ShowHeaderFilterButton="True" ShowTitlePanel="True" />
                                    <SettingsText CommandCancel="الغاء" CommandClearFilter="مسح التصفيه" CommandDelete="حذف" CommandEdit="تعديل" CommandNew="جديد" CommandSelect="اختار" CommandUpdate="تحديث" ConfirmDelete="هل انت متأكد؟" CustomizationWindowCaption="خيارات" EmptyDataRow="فارغ" EmptyHeaders="راس فارغ" FilterBarClear="مسح التصفبه" FilterBarCreateFilter="صناعة تصفيه" FilterControlPopupCaption="خيارات التصفيه" GroupContinuedOnNextPage="تستكمل المجموعه في الصفحه القادمه" GroupPanel="اسحب عمود ثم افلته هنا لصناعه مجموعه" HeaderFilterShowAll="اظهار الكل" HeaderFilterShowBlanks="اظهار الفارغ" HeaderFilterShowNonBlanks="اظهار غير الفارغ" PopupEditFormCaption="صفحة المحرر" />
                                    <SettingsPopup>
                                        <EditForm AllowResize="True" HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="Above" />
                                    </SettingsPopup>
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
                                    <Styles CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
                                        <Header Font-Bold="False" Font-Size="Medium" ImageSpacing="10px" SortingImageSpacing="10px">
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
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                </TabPages>
            </dx:ASPxPageControl>
        </td>
    </tr>
    <tr>
        <td>
            <asp:AccessDataSource ID="DSData" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT tbladdformdetails.id, tbladdformdetails.formid, tbladdformdetails.robrexeid, tbladdformdetails.robrexedegree, tbladdformdetails.robrexedescrption, tbladdformdetails.userin, tbladdformdetails.datein, cdrobrexelement.robrexe FROM (tbladdformdetails LEFT OUTER JOIN cdrobrexelement ON tbladdformdetails.robrexeid = cdrobrexelement.robrexeid) WHERE (tbladdformdetails.formid = ?)" 
                DeleteCommand="DELETE FROM [tbladdformdetails] WHERE [id] = ?" 
                InsertCommand="INSERT INTO [tbladdformdetails] ([id], [formid], [robrexeid], [robrexedegree], [robrexedescrption], [userin], [datein]) VALUES (?, ?, ?, ?, ?, ?, ?)" 
                UpdateCommand="UPDATE [tbladdformdetails] SET  [robrexedegree] = ?, [robrexedescrption] = ?, [userin] = ?, [datein] = Date() WHERE [id] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                    <asp:Parameter Name="formid" Type="Int32" />
                   
                    <asp:Parameter Name="robrexeid" Type="Int32" />
                    <asp:Parameter Name="robrexedegree" Type="Byte" />
                    <asp:Parameter Name="robrexedescrption" Type="String" />
                    <asp:Parameter Name="userin" Type="Int32" />
                    <asp:Parameter Name="datein" Type="DateTime" />
                   
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="0" Name="formid" QueryStringField="id" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="robrexedegree" Type="Byte" />
                    
                    <asp:Parameter Name="robrexedescrption" Type="String" />
                    
                    <asp:SessionParameter Name="userin" SessionField="UserIDTEFollowUp" Type="Int32" />
                    <asp:Parameter Name="id" Type="Int32" />
                    
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSelementtakeemid" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT [elementtakeemid], [elementwaytakeem] FROM [cdtakeemelement]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSDataAsaleeb" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT [formid], [waytakeemid] FROM [tblasleepmoshref]
WHERE  formid = ?" 
                DeleteCommand="DELETE FROM [tblasleepmoshref] WHERE [formid] = ? AND [waytakeemid] = ?" 
                InsertCommand="INSERT INTO [tblasleepmoshref] ([formid], [waytakeemid]) VALUES (?, ?)">
                <DeleteParameters>
                    <asp:QueryStringParameter Name="formid" QueryStringField="id" Type="Int32" />
                    <asp:Parameter Name="waytakeemid" Type="Byte" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:QueryStringParameter Name="formid" QueryStringField="id" Type="Int32" />
                    <asp:Parameter Name="waytakeemid" Type="Byte" />
                   
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="?" QueryStringField="id" />
                </SelectParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSwaytakeemid" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT [waytakeemid], [waytakeem] FROM [cdwaytakeem]">
            </asp:AccessDataSource>
            <dx:ASPxGridViewExporter ID="ASPxGridViewExporterEditor" runat="server" 
                FileName="ContactUSFX" GridViewID="GVEditor" PaperKind="A4">
            </dx:ASPxGridViewExporter>
        </td>
    </tr>
    </table>
    <table align="center">
    <tr>
        <td>
            <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" EnableTheming="True" RightToLeft="True" Theme="iOS">
                <Items>
                    <dx:LayoutItem Caption="يستفاد من المعلم في" Height="120px">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxMemo ID="tbystfad" runat="server" Height="71px" Width="300px">
                                </dx:ASPxMemo>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                        <CaptionSettings Location="Top" />
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="توصيات" Height="120px">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxMemo ID="tbtawseat" runat="server" Height="71px" Width="300px">
                                </dx:ASPxMemo>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                        <CaptionSettings Location="Top" />
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Layout Item" ShowCaption="False">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer runat="server" SupportsDisabledAttribute="True">
                                <dx:ASPxButton ID="btnSave" runat="server" Text="حفظ" Width="100px" AutoPostBack="False" ClientInstanceName="grid">
                                    <ClientSideEvents Click="function(s, e) {
	GVEditor.PerformCallback('post');
}" />
                                </dx:ASPxButton>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:ASPxFormLayout>
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
    Font-Bold="False" Theme="Aqua">
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

