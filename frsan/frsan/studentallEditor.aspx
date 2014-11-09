<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="studentallEditor.aspx.cs" Inherits="studentallEditor" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxCallbackPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
<body>

<table align="center">
    <tr>
        <td dir="ltr">
            <dx:ASPxComboBox ID="CBExporter" runat="server" 
                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                onbuttonclick="CBExporter_ButtonClick" 
                SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" 
                Theme="Office2003Blue">
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
                KeyFieldName="autoid" RightToLeft="True" 
                SummaryText="الملخص" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" 
                CssPostfix="PlasticBlue" EnableTheming="True" Font-Bold="True" Theme="Office2003Blue" OnCustomUnboundColumnData="GVEditor_CustomUnboundColumnData">
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
                    <dx:GridViewDataComboBoxColumn Caption="الطالب" FieldName="stid" VisibleIndex="1">
                        <PropertiesComboBox DataSourceID="DSstudent" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="Contains" TextField="stu_name" ValueField="stu_code" Width="300px">
                            <Columns>
                                <dx:ListBoxColumn Caption="الاسم" FieldName="stu_name" />
                            </Columns>
                        </PropertiesComboBox>
                        <Settings AllowAutoFilter="True" AllowHeaderFilter="True" AllowSort="True" ShowFilterRowMenu="True" ShowFilterRowMenuLikeItem="True" ShowInFilterControl="True" />
                        <EditFormSettings CaptionLocation="Top" />
                        <EditItemTemplate>
                            <table align="right" class="auto-style1">
                                <tr>
                                    <td>
                                        <dx:ASPxComboBox ID="cbStudent" runat="server" DataSourceID="DSstudent" DropDownStyle="DropDown" OnValueChanged="cbStudent_ValueChanged" TextField="stu_name" ValueField="stu_code" EnableCallbackMode="True" IncrementalFilteringMode="Contains" Theme="Office2003Blue" Value='<%# Bind("stid") %>' Width="300px" ValueType="System.Int32">
                                            <ClientSideEvents ValueChanged="function(s, e) {
	callstudent.PerformCallback(s.GetValue());
}" />
                                            <Columns>
                                                <dx:ListBoxColumn FieldName="stu_name" />
                                            </Columns>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center">
                                        <dx:ASPxCallbackPanel ID="callPnlStudent" runat="server" ClientInstanceName="callstudent" OnCallback="callPnlStudent_Callback" Width="200px">
                                            <PanelCollection>
                                                <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxLabel ID="lblSaf" runat="server">
                                                                </dx:ASPxLabel>
                                                    <br />
                                                    <dx:ASPxLabel ID="lblFasl" runat="server">
                                                                </dx:ASPxLabel>
                                                   
                                                </dx:PanelContent>
                                            </PanelCollection>
                                        </dx:ASPxCallbackPanel>
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="الموضوع" FieldName="subjectid" VisibleIndex="4">
                        <PropertiesComboBox DataSourceID="DSsubject" TextField="subject" ValueField="subjectid" Width="300px" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="Contains">
                            <Columns>
                                <dx:ListBoxColumn FieldName="subject" />
                            </Columns>
                        </PropertiesComboBox>
                        <Settings AllowAutoFilter="True" AllowHeaderFilter="True" AllowSort="True" ShowFilterRowMenu="True" ShowFilterRowMenuLikeItem="True" ShowInFilterControl="True" />
                        <EditFormSettings CaptionLocation="Top" />
                        <EditItemTemplate>
                            <table align="right" class="auto-style1">
                                <tr>
                                    <td>
                                        <dx:ASPxComboBox ID="cbSubject" runat="server" DataSourceID="DSsubject" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="Contains" TextField="subject" Theme="Office2003Blue" Value='<%# Bind("subjectid") %>' ValueField="subjectid" Width="300px" ValueType="System.Int32">
                                            <ClientSideEvents ValueChanged="function(s, e) {
	callProject.PerformCallback(s.GetValue());
}" />
                                            <Columns>
                                                <dx:ListBoxColumn FieldName="subject" Caption="الموضوع" />
                                            </Columns>
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: center">
                                        <dx:ASPxCallbackPanel ID="callPnlProject" runat="server" ClientInstanceName="callProject" OnCallback="callPnlProject_Callback" style="text-align: right" Width="200px">
                                            <panelcollection>
                                                <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                                                    <dx:ASPxLabel ID="lblProject" runat="server">
                                                    </dx:ASPxLabel>
                                                    <br />
                                                </dx:PanelContent>
                                            </panelcollection>
                                        </dx:ASPxCallbackPanel>
                                    </td>
                                </tr>
                            </table>
                        </EditItemTemplate>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataHyperLinkColumn Caption="التفاصيل" FieldName="autoid" VisibleIndex="8">
                        <PropertiesHyperLinkEdit NavigateUrlFormatString="SubjectStudentCreateDetails.aspx?id={0}" TextFormatString="التفاصيل">
                        </PropertiesHyperLinkEdit>
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataHyperLinkColumn>
                    <dx:GridViewDataTextColumn Caption="المشروع" FieldName="project" VisibleIndex="3">
                        <EditFormSettings CaptionLocation="Top" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn Caption="الصف" FieldName="Saf" UnboundType="String" VisibleIndex="2">
                        <PropertiesComboBox DataSourceID="DSsaf" DropDownStyle="DropDown" IncrementalFilteringMode="Contains" TextField="alsofof_name" ValueField="alsofof_code">
                            <Columns>
                                <dx:ListBoxColumn FieldName="alsofof_name" />
                            </Columns>
                        </PropertiesComboBox>
                        <Settings AllowAutoFilter="True" AllowHeaderFilter="True" AllowSort="True" AutoFilterCondition="BeginsWith" HeaderFilterMode="CheckedList" ShowFilterRowMenuLikeItem="True" ShowInFilterControl="True" />
                        <EditFormSettings CaptionLocation="Top" />
                    </dx:GridViewDataComboBoxColumn>
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
                DataFile="~/App_Data/frsan.mdb" 
                DeleteCommand="DELETE FROM [studentall] WHERE autoid = ?" 
                InsertCommand="INSERT INTO [studentall] ([stid], [subjectid], [tsfeat], [winner], [Data_Path]) VALUES (?, ?, ?, ?, ?)" 
                SelectCommand="SELECT studentall.stid, studentall.subjectid, studentall.tsfeat, studentall.winner, studentall.Data_Path, studentall.autoid, tblproject.project, tblsubject.subject FROM ((studentall INNER JOIN tblsubject ON studentall.subjectid = tblsubject.subjectid) INNER JOIN tblproject ON tblsubject.projectid = tblproject.projectid)" 
                UpdateCommand="UPDATE [studentall] SET [tsfeat] = ?, [winner] = ?, [Data_Path] = ?, [stid] = ?, [subjectid] =  ? WHERE autoid = ?">
                <DeleteParameters>
                    <asp:Parameter Name="autoid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="stid" Type="Int32" />
                    <asp:Parameter Name="subjectid" Type="Int32" />
                    <asp:Parameter Name="tsfeat" Type="Boolean" />
                    <asp:Parameter Name="winner" Type="Boolean" />
                    <asp:Parameter Name="Data_Path" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="tsfeat" Type="Boolean" />
                    <asp:Parameter Name="winner" Type="Boolean" />
                    <asp:Parameter Name="Data_Path" Type="String" />
                    <asp:Parameter Name="stid" Type="Int32" />
                    <asp:Parameter Name="subjectid" Type="Int32" />
                    <asp:Parameter Name="autoid" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSstudent" runat="server" 
                DataFile="~/desoft/database/2/dstudent/dataschool.mdb" 
                
                
                SelectCommand="SELECT student_t.stu_code, student_t.asase_code, student_t.alsofof_code, student_t.fasl_code, student.stu_name FROM (student_t INNER JOIN student ON student_t.stu_code = student.stu_code) WHERE (student_t.asase_code = (SELECT MAX(asase_code) AS Expr1 FROM student_t student_t_1))">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSsubject" runat="server" 
                DataFile="~/App_Data/frsan.mdb" 
                
                
                SelectCommand="SELECT tblsubject.subjectid, tblsubject.subject, tblsubject.projectid, tblproject.assecode, tblproject.project FROM (tblproject INNER JOIN tblsubject ON tblproject.projectid = tblsubject.projectid) WHERE (tblproject.assecode = (SELECT MAX(assecode) AS Expr1 FROM tblproject tblproject_1))">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSsaf" runat="server" 
                DataFile="~/App_Data/frsan.mdb" 
                
                
                SelectCommand="SELECT [alsofof_code], [alsofof_name] FROM [alsofof]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSfasl" runat="server" 
                DataFile="~/App_Data/frsan.mdb" 
                
                
                SelectCommand="SELECT [faslcode], [faslname] FROM [fasl]">
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
    Font-Bold="False" Theme="Office2003Blue">
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

<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">تم</dx:PopupControlContentControl>

</ContentCollection>
</dx:ASPxPopupControl>


    

</asp:Content>

