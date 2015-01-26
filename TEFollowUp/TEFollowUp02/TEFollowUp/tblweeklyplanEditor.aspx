<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="tblweeklyplanEditor.aspx.cs" Inherits="tblweeklyplanEditor" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>

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
                KeyFieldName="weekplanid" RightToLeft="True" 
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
                    <dx:GridViewCommandColumn ButtonType="Image" Caption="العمليات" VisibleIndex="0">
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
                    <dx:GridViewDataComboBoxColumn Caption="المشرف" FieldName="empid" VisibleIndex="1">
                        <PropertiesComboBox DataSourceID="DSempid" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="StartsWith" TextField="empname" ValueField="empid">
                            <Columns>
                                <dx:ListBoxColumn Caption="الاسم" FieldName="empname" />
                            </Columns>
                        </PropertiesComboBox>
                        <EditFormSettings ColumnSpan="2" />
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="المدرسة" FieldName="schoolid" VisibleIndex="1">
                        <PropertiesComboBox DataSourceID="DSschoolid" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="StartsWith" TextField="schoolname" ValueField="schoolid">
                            <Columns>
                                <dx:ListBoxColumn Caption="الاسم" FieldName="schoolname" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataDateColumn FieldName="dateplan" VisibleIndex="2" Caption="التاريخ">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="numberteacher" VisibleIndex="3" Caption="عدد معلمي التخصص" Visible="False">
                        <EditFormSettings ColumnSpan="2" Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="zearat" VisibleIndex="4" Caption="الزيارات الاشرافية" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="c_zearat" VisibleIndex="5" Caption="عدد المستفيدين" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="takweem" VisibleIndex="6" Caption="الزيارات التقويمية" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="c_takweem" VisibleIndex="7" Caption="عدد المستفيدين" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="motabadla" VisibleIndex="8" Caption="الزيارات المتبادلة" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="c_motabadla" VisibleIndex="9" Caption="عدد المستفيدين" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="droos" VisibleIndex="10" Caption="الدروس التطبيقية" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="c_droos" VisibleIndex="11" Caption="عدد المستفيدين" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="trbowy" VisibleIndex="12" Caption="اللقاءات التربوية" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="c_trbowy" VisibleIndex="13" Caption="عدد المستفيدين" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="trainperson" VisibleIndex="14" Caption="الدورات الشخصية" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="c_trainperson" VisibleIndex="15" Caption="عدد المستفيدين" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="trainteacher" VisibleIndex="16" Caption="دورات المعلمين" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="c_trainteacher" VisibleIndex="17" Caption="عدد المستفيدين" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="nashraat" VisibleIndex="18" Caption="النشرات التربوية" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="c_nashraat" VisibleIndex="19" Caption="عدد المستفيدين" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="reads" VisibleIndex="20" Caption="القراءات الموجهة" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="c_reads" VisibleIndex="21" Caption="عدد المستفيدين" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="mashael" VisibleIndex="22" Caption="المشاغل التربوية" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="c_mashael" VisibleIndex="23" Caption="عدد المستفيدين" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="drasat" VisibleIndex="24" Caption="الدراسات والبحوث" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="c_drasat" VisibleIndex="25" Caption="عدد المستفيدين" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="tagareb" VisibleIndex="26" Caption="التجارب الميدانية" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="c_tagareb" VisibleIndex="27" Caption="عدد المستفيدين" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="wasaeel" VisibleIndex="28" Caption="الوسائل التعليمية" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="c_wasaeel" VisibleIndex="29" Caption="عدد المستفيدين" Visible="False">
                        <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn FieldName="nasheed" VisibleIndex="30" Caption="النشيد الوطني(نفذ ام لا)">
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataMemoColumn Caption="ملاحظات" FieldName="remarks" VisibleIndex="31">
                        <PropertiesMemoEdit Height="100px">
                        </PropertiesMemoEdit>
                        <EditFormSettings ColumnSpan="2" />
                    </dx:GridViewDataMemoColumn>
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
                DeleteCommand="DELETE FROM [tblweeklyplan] WHERE [weekplanid] = ?" 
                InsertCommand="INSERT INTO [tblweeklyplan] ([empid], [schoolid], [dateplan], [numberteacher], [zearat], [c_zearat], [takweem], [c_takweem], [motabadla], [c_motabadla], [droos], [c_droos], [trbowy], [c_trbowy], [trainperson], [c_trainperson], [trainteacher], [c_trainteacher], [nashraat], [c_nashraat], [reads], [c_reads], [mashael], [c_mashael], [drasat], [c_drasat], [tagareb], [c_tagareb], [wasaeel], [c_wasaeel], [nasheed], [remarks], [userin], [datein]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, Date())" 
                SelectCommand="SELECT weekplanid, schoolid, empid, dateplan, numberteacher, zearat, c_zearat, takweem, c_takweem, motabadla, c_motabadla, droos, c_droos, trbowy, c_trbowy, trainperson, c_trainperson, trainteacher, c_trainteacher, nashraat, c_nashraat, reads, c_reads, mashael, c_mashael, drasat, c_drasat, tagareb, c_tagareb, wasaeel, c_wasaeel, nasheed, remarks, userin, datein FROM tblweeklyplan WHERE (empid = ?) OR (SELECT IsAdmin FROM FollowupUsers WHERE UserID = ?) = true" 
                UpdateCommand="UPDATE [tblweeklyplan] SET [empid] = ?, [schoolid] = ?, [dateplan] = ?, [numberteacher] = ?, [zearat] = ?, [c_zearat] = ?, [takweem] = ?, [c_takweem] = ?, [motabadla] = ?, [c_motabadla] = ?, [droos] = ?, [c_droos] = ?, [trbowy] = ?, [c_trbowy] = ?, [trainperson] = ?, [c_trainperson] = ?, [trainteacher] = ?, [c_trainteacher] = ?, [nashraat] = ?, [c_nashraat] = ?, [reads] = ?, [c_reads] = ?, [mashael] = ?, [c_mashael] = ?, [drasat] = ?, [c_drasat] = ?, [tagareb] = ?, [c_tagareb] = ?, [wasaeel] = ?, [c_wasaeel] = ?, [nasheed] = ?, [remarks] = ?, [userin] = ?, [datein] = Date() WHERE [weekplanid] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="weekplanid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="empid" Type="Int32" />
                    <asp:Parameter Name="schoolid" />
                    <asp:Parameter Name="dateplan" Type="DateTime" />
                    <asp:Parameter Name="numberteacher" Type="Int32" />
                    <asp:Parameter Name="zearat" Type="Int32" />
                    <asp:Parameter Name="c_zearat" Type="Int32" />
                    <asp:Parameter Name="takweem" Type="Int32" />
                    <asp:Parameter Name="c_takweem" Type="Int32" />
                    <asp:Parameter Name="motabadla" Type="Int32" />
                    <asp:Parameter Name="c_motabadla" Type="Int32" />
                    <asp:Parameter Name="droos" Type="Int32" />
                    <asp:Parameter Name="c_droos" Type="Int32" />
                    <asp:Parameter Name="trbowy" Type="Int32" />
                    <asp:Parameter Name="c_trbowy" Type="Int32" />
                    <asp:Parameter Name="trainperson" Type="Int32" />
                    <asp:Parameter Name="c_trainperson" Type="Int32" />
                    <asp:Parameter Name="trainteacher" Type="Int32" />
                    <asp:Parameter Name="c_trainteacher" Type="Int32" />
                    <asp:Parameter Name="nashraat" Type="Int32" />
                    <asp:Parameter Name="c_nashraat" Type="Int32" />
                    <asp:Parameter Name="reads" Type="Int32" />
                    <asp:Parameter Name="c_reads" Type="Int32" />
                    <asp:Parameter Name="mashael" Type="Int32" />
                    <asp:Parameter Name="c_mashael" Type="Int32" />
                    <asp:Parameter Name="drasat" Type="Int32" />
                    <asp:Parameter Name="c_drasat" Type="Int32" />
                    <asp:Parameter Name="tagareb" Type="Int32" />
                    <asp:Parameter Name="c_tagareb" Type="Int32" />
                    <asp:Parameter Name="wasaeel" Type="Int32" />
                    <asp:Parameter Name="c_wasaeel" Type="Int32" />
                    <asp:Parameter Name="nasheed" Type="Boolean" />
                    <asp:Parameter Name="remarks" Type="String" />
                    <asp:SessionParameter Name="userin" SessionField="UserIDTEFollowUp" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="empid" SessionField="UserIDTEFollowUp" Type="Int32" />
                    <asp:SessionParameter Name="userin" SessionField="UserIDTEFollowUp" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="empid" Type="Int32" />
                    <asp:Parameter Name="schoolid" />
                    <asp:Parameter Name="dateplan" Type="DateTime" />
                    <asp:Parameter Name="numberteacher" Type="Int32" />
                    <asp:Parameter Name="zearat" Type="Int32" />
                    <asp:Parameter Name="c_zearat" Type="Int32" />
                    <asp:Parameter Name="takweem" Type="Int32" />
                    <asp:Parameter Name="c_takweem" Type="Int32" />
                    <asp:Parameter Name="motabadla" Type="Int32" />
                    <asp:Parameter Name="c_motabadla" Type="Int32" />
                    <asp:Parameter Name="droos" Type="Int32" />
                    <asp:Parameter Name="c_droos" Type="Int32" />
                    <asp:Parameter Name="trbowy" Type="Int32" />
                    <asp:Parameter Name="c_trbowy" Type="Int32" />
                    <asp:Parameter Name="trainperson" Type="Int32" />
                    <asp:Parameter Name="c_trainperson" Type="Int32" />
                    <asp:Parameter Name="trainteacher" Type="Int32" />
                    <asp:Parameter Name="c_trainteacher" Type="Int32" />
                    <asp:Parameter Name="nashraat" Type="Int32" />
                    <asp:Parameter Name="c_nashraat" Type="Int32" />
                    <asp:Parameter Name="reads" Type="Int32" />
                    <asp:Parameter Name="c_reads" Type="Int32" />
                    <asp:Parameter Name="mashael" Type="Int32" />
                    <asp:Parameter Name="c_mashael" Type="Int32" />
                    <asp:Parameter Name="drasat" Type="Int32" />
                    <asp:Parameter Name="c_drasat" Type="Int32" />
                    <asp:Parameter Name="tagareb" Type="Int32" />
                    <asp:Parameter Name="c_tagareb" Type="Int32" />
                    <asp:Parameter Name="wasaeel" Type="Int32" />
                    <asp:Parameter Name="c_wasaeel" Type="Int32" />
                    <asp:Parameter Name="nasheed" Type="Boolean" />
                    <asp:Parameter Name="remarks" Type="String" />
                    <asp:SessionParameter Name="userin" SessionField="UserIDTEFollowUp" Type="Int32" />
                    <asp:Parameter Name="weekplanid" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSempid" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT empid, empname FROM tblempdata WHERE (empid = ?) OR (SELECT IsAdmin FROM FollowupUsers WHERE UserID = ?) = true">
                <SelectParameters>
                    <asp:SessionParameter Name="?" SessionField="UserIDTEFollowUp" />
                    <asp:SessionParameter Name="?" SessionField="UserIDTEFollowUp" />
                </SelectParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSschoolid" runat="server" 
                DataFile="Data/TEFollow-up.mdb" 
                SelectCommand="SELECT schoolid, schoolname FROM cdschool">
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

