﻿<%@ Page Title="" Language="C#" MasterPageFile="~/frsan/masteruser.master" AutoEventWireup="true" CodeFile="StudentViewer.aspx.cs" Inherits="StudentViewer" %>
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
    <table align="center" class="auto-style1">
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td><dx:ASPxGridView ID="GVEditor" runat="server" AutoGenerateColumns="False" 
                Caption="البيــــــــــا نـــــــــــــــات" DataSourceID="DSData" 
                KeyFieldName="autoid" RightToLeft="True" 
                SummaryText="الملخص" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" 
                CssPostfix="PlasticBlue" EnableTheming="True" Font-Bold="True" 
                    Theme="Office2010Blue" 
                    OnCustomUnboundColumnData="GVEditor_CustomUnboundColumnData" 
                    style="direction: ltr" Width="700px">
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
                    <dx:GridViewDataComboBoxColumn Caption="الطالب" FieldName="stid" VisibleIndex="1">
                        <PropertiesComboBox DataSourceID="DSstudent" DropDownStyle="DropDown" 
                            EnableCallbackMode="True" IncrementalFilteringMode="Contains" 
                            TextField="stu_name" ValueField="stu_code" Width="330px">
                            <Columns>
                                
<dx:ListBoxColumn Caption="الاسم" FieldName="stu_name" />
                            
</Columns>
                        
</PropertiesComboBox>
                        <Settings AllowAutoFilter="True" AllowHeaderFilter="True" AllowSort="True" ShowFilterRowMenu="True" ShowFilterRowMenuLikeItem="True" ShowInFilterControl="True" />
                        <EditFormSettings CaptionLocation="Top" />
                        <HeaderStyle Font-Bold="True" Font-Names="Arial" HorizontalAlign="Center" />
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn Caption="الموضوع" FieldName="subject" VisibleIndex="5">
                        <PropertiesTextEdit Width="300px">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="True" AllowHeaderFilter="True" AllowSort="True" ShowFilterRowMenu="True" ShowFilterRowMenuLikeItem="True" ShowInFilterControl="True" />
                        <EditFormSettings CaptionLocation="Top" />
                        <HeaderStyle Font-Bold="True" Font-Names="Arial" HorizontalAlign="Center" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataHyperLinkColumn Caption="التفاصيل" FieldName="autoid" 
                        VisibleIndex="9" Visible="False">
                        <PropertiesHyperLinkEdit NavigateUrlFormatString="studentPageViewer.aspx?id={0}" TextFormatString="التفاصيل">
                        </PropertiesHyperLinkEdit>
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataHyperLinkColumn>
                    <dx:GridViewDataTextColumn Caption="المشروع" FieldName="project" VisibleIndex="0">
                        <HeaderStyle Font-Bold="True" Font-Names="Arial" HorizontalAlign="Center" />
                        <CellStyle HorizontalAlign="Right">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataImageColumn Caption="صورة" FieldName="stid" VisibleIndex="7">
                        <PropertiesImage ImageHeight="64px" ImageUrlFormatString="../desoft/database/photo/picstudent/{0}.jpg" ImageWidth="64px">
                        </PropertiesImage>
                        <HeaderStyle Font-Bold="True" Font-Names="Arial" HorizontalAlign="Center" />
                    </dx:GridViewDataImageColumn>
                    <dx:GridViewDataTextColumn Caption="الصف" FieldName="Saf" Name="Saf" UnboundType="String" VisibleIndex="3">
                    <HeaderStyle Font-Bold="True" Font-Names="Arial" HorizontalAlign="Center" />
                    </dx:GridViewDataTextColumn>
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
                SelectCommand="SELECT studentall.stid, studentall.subjectid, studentall.tsfeat, studentall.winner, studentall.autoid, tblsubject.subject, tblproject.project, tblproject.projectid FROM ((studentall INNER JOIN tblsubject ON studentall.subjectid = tblsubject.subjectid) INNER JOIN tblproject ON tblsubject.projectid = tblproject.projectid) WHERE (tblproject.projectid = ?) ORDER BY studentall.autoid" 
                
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
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="0" Name="?" QueryStringField="id" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="tsfeat" Type="Boolean" />
                    <asp:Parameter Name="winner" Type="Boolean" />
                    <asp:Parameter Name="Data_Path" Type="String" />
                    <asp:Parameter Name="stid" Type="Int32" />
                    <asp:Parameter Name="subjectid" Type="Int32" />
                    <asp:Parameter Name="autoid" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSStudent" runat="server" 
                DataFile="~/desoft/database/2/dstudent/dataschool.mdb" 
                SelectCommand="SELECT stu_code, stu_name ,(SELECT alsofof_code FROM student_t WHERE stu_code = student.stu_code AND asase_code = (SELECT MAX(asase_code) FROM student_t)) AS alsofof_code FROM student">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSٍSaf" runat="server" 
                DataFile="~/App_Data/frsan.mdb" 
                SelectCommand="SELECT [alsofof_code], [alsofof_name] FROM [alsofof]">
            </asp:AccessDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

