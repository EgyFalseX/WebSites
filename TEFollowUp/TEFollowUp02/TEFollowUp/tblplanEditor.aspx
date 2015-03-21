<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="tblplanEditor.aspx.cs" Inherits="tblplanEditor" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>

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
                Theme="SoftOrange">
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
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            <dx:ASPxGridView ID="GVEditor" runat="server" AutoGenerateColumns="False" 
                Caption="البيــــــــــا نـــــــــــــــات" DataSourceID="DSData" 
                KeyFieldName="planid" RightToLeft="True" 
                SummaryText="الملخص" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" 
                CssPostfix="PlasticBlue" EnableTheming="True" 
                onrowdeleted="GVEditor_RowDeleted" onrowupdated="GVEditor_RowUpdated" 
                onrowinserted="GVEditor_RowInserted" Font-Bold="True" Theme="SoftOrange" EnableCallbackAnimation="True" EnablePagingCallbackAnimation="True" KeyboardSupport="True">
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
                    <dx:GridViewDataComboBoxColumn Caption="المدرسة" FieldName="schoolid" VisibleIndex="1">
                        <PropertiesComboBox DataSourceID="DSSchoolid" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="StartsWith" TextField="schoolname" ValueField="schoolid">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataDateColumn Caption="تاريخ" FieldName="datef" VisibleIndex="5">
                        <PropertiesDateEdit DisplayFormatString="d/M/yyyy">
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataComboBoxColumn Caption="الصف" FieldName="safid" VisibleIndex="3">
                        <PropertiesComboBox DataSourceID="DSsafid" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="StartsWith" TextField="saf" ValueField="safid">
                            <Columns>
                                <dx:ListBoxColumn FieldName="saf" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="المدرس" FieldName="empid" VisibleIndex="2">
                        <PropertiesComboBox DataSourceID="DSempid" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="StartsWith" TextField="empname" ValueField="empid">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="الفصل" FieldName="faslid" VisibleIndex="4">
                        <PropertiesComboBox DataSourceID="DSfaslid" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="StartsWith" TextField="fasl" ValueField="faslid">
                            <Columns>
                                <dx:ListBoxColumn FieldName="fasl" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="الحصة" FieldName="hesaid" VisibleIndex="6">
                        <PropertiesComboBox DataSourceID="DShesaid" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="StartsWith" TextField="hesa" ValueField="hesaid">
                            <Columns>
                                <dx:ListBoxColumn FieldName="hesa" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="المشرف" FieldName="moshref" VisibleIndex="7">
                        <PropertiesComboBox DataSourceID="DSmoshref" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="StartsWith" TextField="empname" ValueField="empid">
                            <Columns>
                                <dx:ListBoxColumn FieldName="empname" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" 
                    SortMode="DisplayText" ColumnResizeMode="Control" />
                <SettingsPager ShowDefaultImages="False" PageSize="40">
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
                DataFile="Data/TEFollow-up.mdb" 
                DeleteCommand="DELETE FROM [tblplan] WHERE planid = ?" 
                InsertCommand="INSERT INTO [tblplan] ([schoolid], [safid], [faslid], [datef], [empid], [hesaid], moshref, [userin], [datein]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, Date())" 
                SelectCommand="SELECT planid, schoolid, safid, faslid, datef, empid, hesaid, userin, datein, moshref FROM tblplan 
WHERE 
((SELECT IsAdmin FROM FollowupUsers WHERE UserID = ?) = true)
 OR (userin = ?)
OR (moshref  = ?)
" 
                UpdateCommand="UPDATE       tblplan
SET                schoolid = ?, safid = ?, faslid = ?, datef = ?, empid = ?, hesaid = ?, moshref = ?, userin = ?, datein = DATE()
WHERE        planid = ?">
                <DeleteParameters>
                    <asp:Parameter Name="planid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="schoolid" Type="Int32" />
                    <asp:Parameter Name="safid" Type="Int32" />
                    <asp:Parameter Name="faslid" Type="Int32" />
                    <asp:Parameter Name="datef" Type="DateTime" />
                    <asp:Parameter Name="empid" Type="Int32" />
                    <asp:Parameter Name="hesaid" Type="Int32" />
                    <asp:Parameter Name="moshref" />
                    <asp:SessionParameter Name="userin" SessionField="UserIDTEFollowUp" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="" Name="?" SessionField="UserIDTEFollowUp" />
                    <asp:SessionParameter DefaultValue="0" Name="?" SessionField="UserIDTEFollowUp" />
                    <asp:SessionParameter DefaultValue="" Name="?" SessionField="empidTEFollowUp" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="schoolid" Type="Int32" />
                    <asp:Parameter Name="safid" Type="Int32" />
                    <asp:Parameter Name="faslid" Type="Int32" />
                    <asp:Parameter Name="datef" Type="DateTime" />
                    <asp:Parameter Name="empid" Type="Int32" />
                    <asp:Parameter Name="hesaid" Type="Int32" />
                    <asp:Parameter Name="moshref" />
                    <asp:SessionParameter Name="userin" SessionField="UserIDTEFollowUp" Type="Int32" DefaultValue="" />
                    <asp:Parameter Name="planid" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSSchoolid" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT [schoolid], [schoolname] FROM [cdschool]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSsafid" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT [safid], [saf] FROM [cdsaf]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSfaslid" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT [faslid], [fasl] FROM [cdfasl]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSempid" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT [empid], [empname] FROM [tblempdata]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DShesaid" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT [hesaid], [hesa] FROM [cdhesa]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSmoshref" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT [empid], [empname] FROM [tblempdata] WHERE ([moshref] = True)">
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

