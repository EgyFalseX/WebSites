<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewCourseDetailsUserControl.ascx.cs" Inherits="ViewCourseDetailsUserControl" %>


<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxRatingControl" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHiddenField" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxCallbackPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxLoadingPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxTabControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dxpc" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dxe" %>

<link href="../Styles/jquery-ui.css" rel="stylesheet" />
<script src="../Scripts/jquery-1.7.1.min.js"></script>
<script src="../Scripts/jquery-ui.js"></script>

 <script>

     $(function () {

         $("#DateTextBox").datepicker();
     });

     $(function () {

         $("#DateTextBox1").datepicker();
     });
  </script>

<style type="text/css">


.dxeButtonEditSys 
{
    width: 170px;
}

.dxeTrackBar_Office2003Blue, 
.dxeIRadioButton_Office2003Blue, 
.dxeButtonEdit_Office2003Blue, 
.dxeTextBox_Office2003Blue, 
.dxeRadioButtonList_Office2003Blue, 
.dxeCheckBoxList_Office2003Blue, 
.dxeMemo_Office2003Blue, 
.dxeListBox_Office2003Blue, 
.dxeCalendar_Office2003Blue, 
.dxeColorTable_Office2003Blue
{
	-webkit-tap-highlight-color: rgba(0,0,0,0);
}

.dxeTextBox_Office2003Blue,
.dxeButtonEdit_Office2003Blue,
.dxeIRadioButton_Office2003Blue,
.dxeRadioButtonList_Office2003Blue,
.dxeCheckBoxList_Office2003Blue
{
    cursor: default;
}

.dxeButtonEdit_Office2003Blue
{
	background-color: white;
	border: 1px solid #6a8ccb;
}
.dxeButtonEdit_Office2003Blue .dxeEditArea_Office2003Blue
{
	background-color: white;
}
.dxeEditAreaSys 
{
    height: 14px;
    line-height: 14px;
    border: 0px!important;
	padding: 0px 1px 0px 0px; /* B146658 */
    background-position: 0 0; /* iOS Safari */
}

.dxeEditArea_Office2003Blue
{
	font: 12px Tahoma;
	border: 1px solid #6a8ccb;
}

.dxeButtonEditButton_Office2003Blue
{
<%--	background: #d7e8fd url('<%=WebResource("DevExpress.Web.ASPxThemes.App_Themes.Office2003Blue.Editors.edtButtonBack.gif")%>') repeat-x center bottom;--%>
	padding: 0px 1px;
}
.dxeButtonEditButton_Office2003Blue,
.dxeCalendarButton_Office2003Blue,
.dxeSpinIncButton_Office2003Blue,
.dxeSpinDecButton_Office2003Blue,
.dxeSpinLargeIncButton_Office2003Blue,
.dxeSpinLargeDecButton_Office2003Blue
{
	vertical-align: middle;
	border: 1px solid #6a8ccb;
	cursor: pointer;
} 

.dxEditors_edtDropDown_Office2003Blue {
    background-position: -95px 0px;
    width: 7px;
    height: 3px;
}

.dxEditors_edtError_Office2003Blue,
.dxEditors_edtCalendarPrevYear_Office2003Blue,
.dxEditors_edtCalendarPrevYearDisabled_Office2003Blue,
.dxEditors_edtCalendarPrevMonth_Office2003Blue,
.dxEditors_edtCalendarPrevMonthDisabled_Office2003Blue,
.dxEditors_edtCalendarNextMonth_Office2003Blue,
.dxEditors_edtCalendarNextMonthDisabled_Office2003Blue,
.dxEditors_edtCalendarNextYear_Office2003Blue,
.dxEditors_edtCalendarNextYearDisabled_Office2003Blue,
.dxEditors_edtCalendarFNPrevYear_Office2003Blue,
.dxEditors_edtCalendarFNNextYear_Office2003Blue,
.dxEditors_edtEllipsis_Office2003Blue,
.dxEditors_edtEllipsisDisabled_Office2003Blue,
.dxEditors_edtDropDown_Office2003Blue,
.dxEditors_edtDropDownDisabled_Office2003Blue,
.dxEditors_edtSpinEditIncrementImage_Office2003Blue,
.dxEditors_edtSpinEditIncrementImageDisabled_Office2003Blue,
.dxEditors_edtSpinEditDecrementImage_Office2003Blue,
.dxEditors_edtSpinEditDecrementImageDisabled_Office2003Blue,
.dxEditors_edtSpinEditLargeIncImage_Office2003Blue,
.dxEditors_edtSpinEditLargeIncImageDisabled_Office2003Blue,
.dxEditors_edtSpinEditLargeDecImage_Office2003Blue,
.dxEditors_edtSpinEditLargeDecImageDisabled_Office2003Blue
{
	display:block;
	margin:auto;
}

.dxEditors_edtError_Office2003Blue,
.dxEditors_edtCalendarPrevYear_Office2003Blue,
.dxEditors_edtCalendarPrevYearDisabled_Office2003Blue,
.dxEditors_edtCalendarPrevMonth_Office2003Blue,
.dxEditors_edtCalendarPrevMonthDisabled_Office2003Blue,
.dxEditors_edtCalendarNextMonth_Office2003Blue,
.dxEditors_edtCalendarNextMonthDisabled_Office2003Blue,
.dxEditors_edtCalendarNextYear_Office2003Blue,
.dxEditors_edtCalendarNextYearDisabled_Office2003Blue,
.dxEditors_edtCalendarFNPrevYear_Office2003Blue,
.dxEditors_edtCalendarFNNextYear_Office2003Blue,
.dxEditors_edtEllipsis_Office2003Blue,
.dxEditors_edtEllipsisDisabled_Office2003Blue,
.dxEditors_edtDropDown_Office2003Blue,
.dxEditors_edtDropDownDisabled_Office2003Blue,
.dxEditors_edtDETSClockFace_Office2003Blue,
.dxEditors_edtDETSHourHand_Office2003Blue,
.dxEditors_edtDETSMinuteHand_Office2003Blue,
.dxEditors_edtDETSSecondHand_Office2003Blue,
.dxEditors_edtSpinEditIncrementImage_Office2003Blue,
.dxEditors_edtSpinEditIncrementImageDisabled_Office2003Blue,
.dxEditors_edtSpinEditDecrementImage_Office2003Blue,
.dxEditors_edtSpinEditDecrementImageDisabled_Office2003Blue,
.dxEditors_edtSpinEditLargeIncImage_Office2003Blue,
.dxEditors_edtSpinEditLargeIncImageDisabled_Office2003Blue,
.dxEditors_edtSpinEditLargeDecImage_Office2003Blue,
.dxEditors_edtSpinEditLargeDecImageDisabled_Office2003Blue,
.dxEditors_fcadd_Office2003Blue,
.dxEditors_fcaddhot_Office2003Blue,
.dxEditors_fcremove_Office2003Blue,
.dxEditors_fcremovehot_Office2003Blue,
.dxEditors_fcgroupaddcondition_Office2003Blue,
.dxEditors_fcgroupaddgroup_Office2003Blue,
.dxEditors_fcgroupremove_Office2003Blue,
.dxEditors_fcopany_Office2003Blue,
.dxEditors_fcopbegin_Office2003Blue,
.dxEditors_fcopbetween_Office2003Blue,
.dxEditors_fcopcontain_Office2003Blue,
.dxEditors_fcopnotcontain_Office2003Blue,
.dxEditors_fcopnotequal_Office2003Blue,
.dxEditors_fcopend_Office2003Blue,
.dxEditors_fcopequal_Office2003Blue,
.dxEditors_fcopgreater_Office2003Blue,
.dxEditors_fcopgreaterorequal_Office2003Blue,
.dxEditors_fcopnotblank_Office2003Blue,
.dxEditors_fcopblank_Office2003Blue,
.dxEditors_fcopless_Office2003Blue,
.dxEditors_fcoplessorequal_Office2003Blue,
.dxEditors_fcoplike_Office2003Blue,
.dxEditors_fcopnotany_Office2003Blue,
.dxEditors_fcopnotbetween_Office2003Blue,
.dxEditors_fcopnotlike_Office2003Blue,
.dxEditors_fcgroupand_Office2003Blue,
.dxEditors_fcgroupor_Office2003Blue,
.dxEditors_fcgroupnotand_Office2003Blue,
.dxEditors_fcgroupnotor_Office2003Blue,
.dxEditors_caRefresh_Office2003Blue,
.dxEditors_edtRadioButtonChecked_Office2003Blue,
.dxEditors_edtRadioButtonUnchecked_Office2003Blue,
.dxEditors_edtRadioButtonCheckedDisabled_Office2003Blue,
.dxEditors_edtRadioButtonUncheckedDisabled_Office2003Blue,
.dxEditors_edtRadioButtonGrayedDisabled_Office2003Blue,
.dxEditors_edtTBDecBtn_Office2003Blue,
.dxEditors_edtTBIncBtn_Office2003Blue,
.dxEditors_edtTBMainDH_Office2003Blue,
.dxEditors_edtTBSecondaryDH_Office2003Blue,
.dxEditors_edtTBIncBtnDisabled_Office2003Blue,
.dxEditors_edtTBDecBtnDisabled_Office2003Blue,
.dxEditors_edtTBMainDHDisabled_Office2003Blue,
.dxEditors_edtTBSecondaryDHDisabled_Office2003Blue {
<%--    background-image: url('<%=WebResource("DevExpress.Web.ASPxThemes.App_Themes.Office2003Blue.Editors.sprite.png")%>');
    -background-image: url('<%=WebResource("DevExpress.Web.ASPxThemes.App_Themes.Office2003Blue.Editors.sprite.gif")%>'); /* for IE6 */--%>
    background-repeat: no-repeat;
    background-color: transparent;
}

.dxeTextBoxSys, 
.dxeMemoSys 
{
    border-collapse:separate!important;
}

.dxeTextBox_Office2003Blue,
.dxeMemo_Office2003Blue
{
	background-color: white;
	border: 1px solid #6a8ccb;
}
.dxeTextBox_Office2003Blue .dxeEditArea_Office2003Blue
{
	background-color: white;
}
    .dxpcControl_Aqua
{
	font: 12px Tahoma;
	cursor: default;
	color: #000000;
	background-color: #ECF4FE;
	border: 1px Solid #8BB6EF;
	width: 200px;
}
.dxpcHeader_Aqua
{
	color: #283B56;
<%-- background: #E2F0FF url('<%=WebResource("DevExpress.Web.ASPxThemes.App_Themes.Aqua.Web.pcHeaderBack.gif")%>') repeat-x;--%>
	border-bottom: 1px Solid #A3C0E8;
	border-top-width: 0px;
	border-left-width: 0px;
	border-right-width: 0px;
	padding-bottom: 0px;
}
.dxpcHBCell_Aqua {
    padding: 1px 1px 1px 1px;
}
.dxpcCloseButton_Aqua,
.dxpcPinButton_Aqua,
.dxpcRefreshButton_Aqua,
.dxpcCollapseButton_Aqua,
.dxpcMaximizeButton_Aqua
{
	cursor: pointer;
	padding: 1px 1px 1px 1px;
}

.dxpcContent_Aqua
{
	color: #000000;
	background-color: #FFFFFF;
	line-height: 128%;
	white-space: normal;
	border-width: 0px;
	vertical-align: top;
}
.dxpcContentPaddings_Aqua 
{
	padding: 14px 20px 15px;
}
.dxbButton_Aqua
{
	color: #2C4D79;
	font: normal 12px Tahoma;
	vertical-align: middle;
	border: 1px solid #A3C0E8;
<%--	background: #E2F0FF url('<%=WebResource("DevExpress.Web.ASPxThemes.App_Themes.Aqua.Editors.edtButtonBack.gif")%>') repeat-x top;--%>
	padding: 1px;
	cursor: pointer;
}
    .style1
    {
        width: 472px;
    }
    .style2
    {
        height: 32px;
    }
    .style3
    {
        width: 268px;
    }
    .style6
    {
        text-align: right;
    }
    .style8
    {
    }
    </style>

        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" ClientInstanceName="ASPxGridView1" CssFilePath="~/App_Themes/Office2010Black/{0}/styles.css" CssPostfix="Office2010Black" DataSourceID="coursesSqlDataSource" EnableTheming="True" KeyFieldName="CourseId" OnBeforePerformDataSelect="ASPxGridView1_BeforePerformDataSelect" OnCustomButtonCallback="ASPxGridView1_CustomButtonCallback" Theme="Youthful" Font-Bold="True" OnCustomCallback="ASPxGridView1_CustomCallback" OnCancelRowEditing="ASPxGridView1_CancelRowEditing">
            <ClientSideEvents EndCallback="function(s, e) {

}" RowClick="function(s, e) {

}" />

          
            <Columns>
                <dx:GridViewDataButtonEditColumn Caption="تسجيل" VisibleIndex="25" Name="Replay">
                    <DataItemTemplate>
                        
                    
                        <dx:ASPxButton ID="replayASPxButton" Enabled='<%# Convert.ToString(Eval("IsDisplay"))==""?false:true %>' runat="server" OnClick="replayASPxButton_Click" Text="تسجيل" Theme="PlasticBlue" >
                        </dx:ASPxButton>
                        <asp:HiddenField ID="msgIDHiddenField" runat="server" Value='<%# Eval("CourseId") %>' />
                    </DataItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataButtonEditColumn>
                <dx:GridViewDataMemoColumn Caption="إسم الدورة" FieldName="CourseName" ToolTip="إسم الدورة" VisibleIndex="1">
                    <PropertiesMemoEdit>
                        <ValidationSettings>
                            <RequiredField ErrorText="" IsRequired="True" />
                        </ValidationSettings>
                    </PropertiesMemoEdit>
                    <EditFormSettings Visible="True" />
                    <HeaderStyle HorizontalAlign="Center" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataTextColumn Caption="بداية الدورة" FieldName="StartDate" ToolTip="بداية الدورة" VisibleIndex="19">
                    <PropertiesTextEdit DisplayFormatString="{0:yyyy/MM/dd}">
                    </PropertiesTextEdit>
                    <EditFormSettings Visible="True" />
                    <HeaderStyle HorizontalAlign="Center" />
                </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption=" " VisibleIndex="0" Name="HasReaded" Visible="False" >
                                <DataItemTemplate>
<%--                                    <dx:ASPxImage ID="ASPxImage2" runat="server" Height="30px" ImageUrl='<%# Convert.ToInt32(Eval("Readed")) == 1 ? "~/contactsite/Images/read.png" : "~/contactsite/Images/unread.png" %>'  Width="30px">
                                    </dx:ASPxImage>--%>
                                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="EndDate" VisibleIndex="3" Caption="نهاية الدورة">
                    <PropertiesTextEdit NullText="نهاية الدورة" DisplayFormatString="{0:yyyy/MM/dd}">
                    </PropertiesTextEdit>
                    <EditFormSettings Visible="True" />
                    <HeaderStyle HorizontalAlign="Center" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataButtonEditColumn Caption="تفاصيل" VisibleIndex="23" Name="Details">
                    <DataItemTemplate>
                        <dx:ASPxButton ID="readASPxButton" runat="server" OnClick="readASPxButton_Click" Theme="iOS" Text="التفاصيل">
                        </dx:ASPxButton>
                        <asp:HiddenField ID="msgIDHiddenField" runat="server" Value='<%# Eval("CourseId") %>' />
                    </DataItemTemplate>
                    <EditItemTemplate>
                        <asp:HiddenField ID="msgIDHiddenField" runat="server" Value='<%# Eval("CourseId") %>' />
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                </dx:GridViewDataButtonEditColumn>
                <dx:GridViewDataMemoColumn Caption="الرد" VisibleIndex="27" Visible="False">
                    <PropertiesMemoEdit>
                        <Style HorizontalAlign="Center">
                        </Style>
                    </PropertiesMemoEdit>
                    <HeaderStyle HorizontalAlign="Center" />
                </dx:GridViewDataMemoColumn>
            </Columns>
            <SettingsBehavior AllowSelectByRowClick="True" ConfirmDelete="True" AllowFocusedRow="True" />
            <SettingsPager>
                <AllButton Text="All">
                </AllButton>
                <NextPageButton Text="Next &gt;">
                </NextPageButton>
                <PrevPageButton Text="&lt; Prev">
                </PrevPageButton>
            </SettingsPager>
            <SettingsEditing EditFormColumnCount="1" />
            <Settings ShowFilterRow="True" ShowFilterRowMenu="True" />
            <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ShowDetailRow="True" ShowDetailButtons="False" />
            <Images SpriteCssFilePath="~/App_Themes/Office2010Black/{0}/sprite.css">
                <LoadingPanelOnStatusBar Url="~/App_Themes/Office2010Black/GridView/Loading.gif">
                </LoadingPanelOnStatusBar>
                <LoadingPanel Url="~/App_Themes/Office2010Black/GridView/Loading.gif">
                </LoadingPanel>
            </Images>
            <ImagesFilterControl>
                <LoadingPanel Url="~/App_Themes/Office2010Black/GridView/Loading.gif">
                </LoadingPanel>
            </ImagesFilterControl>
            <Styles CssFilePath="~/App_Themes/Office2010Black/{0}/styles.css" CssPostfix="Office2010Black">
                <Header ImageSpacing="5px" SortingImageSpacing="5px">
                </Header>
                <LoadingPanel ImageSpacing="5px">
                </LoadingPanel>
            </Styles>
            <StylesPager>
                <CurrentPageNumber ForeColor="Black">
                </CurrentPageNumber>
                <PageNumber ForeColor="#000099">
                </PageNumber>
                <Summary ForeColor="White">
                </Summary>
                <Ellipsis ForeColor="White">
                </Ellipsis>
            </StylesPager>
            <StylesEditors ButtonEditCellSpacing="0">
                <ProgressBar Height="21px">
                </ProgressBar>
            </StylesEditors>
        </dx:ASPxGridView>
<asp:SqlDataSource ID="coursesSqlDataSource" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\AATSWEB.mdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT CourseId, CourseTypeID, CourseName, Courseremark, CoursePlace, StartDate, EndDate, Price, WithExam, ExamMax, ExamMin, ApologyAllow, rem, LabId, EvalAllow, (IIf(ShowOnline &lt;&gt;false, ShowOnline, '')) AS IsDisplay, imageline1, imageline2, imageline3, imageline4, imageline5, imageline6 FROM TBLCourses" OnInserted="SqlDataSource2_Inserted">
</asp:SqlDataSource>




<%--                                    <dx:ASPxImage ID="ASPxImage2" runat="server" Height="30px" ImageUrl='<%# Convert.ToInt32(Eval("Readed")) == 1 ? "~/contactsite/Images/read.png" : "~/contactsite/Images/unread.png" %>'  Width="30px">
                                    </dx:ASPxImage>--%>





            <dx:ASPxPopupControl ID="replayMsgASPxPopupControl" runat="server" 
                 CloseAction="CloseButton" 
                Modal="True" PopupElementID="deleteASPxButton" 
                ClientInstanceName="deleteMsgASPxPopupControl" 
                HeaderText="التسجيل" Theme="Youthful" RightToLeft="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle" AllowDragging="True" Font-Bold="True">
                <ContentStyle VerticalAlign="Top">
                </ContentStyle>
                <SizeGripImage Height="12px" Width="12px" />
                <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">

    <center>
                    <table width="580">
                        <tr>
                            <td>
                                <strong>قم بإدخال بيانات التسجيل</strong></td>
                        </tr>
                        <tr>
                            <td>
                                
                                <table dir="ltr">
                                       <tr>
                            <td style="direction: rtl" class="style8">
                                <telerik:RadTextBox ID="RTxtTraineeName" runat="server" EmptyMessage="ادخل اسمك بالعربيه"
                                    Width="200px">
<PasswordStrengthSettings ShowIndicator="False" CalculationWeightings="50;15;15;20" PreferredPasswordLength="10" MinimumNumericCharacters="2" RequiresUpperAndLowerCaseCharacters="True" MinimumLowerCaseCharacters="2" MinimumUpperCaseCharacters="2" MinimumSymbolCharacters="2" OnClientPasswordStrengthCalculating="" TextStrengthDescriptions="Very Weak;Weak;Medium;Strong;Very Strong" TextStrengthDescriptionStyles="riStrengthBarL0;riStrengthBarL1;riStrengthBarL2;riStrengthBarL3;riStrengthBarL4;riStrengthBarL5;" IndicatorElementBaseStyle="riStrengthBar" IndicatorElementID=""></PasswordStrengthSettings>
                                </telerik:RadTextBox>
                            </td>
                            <td style="direction: rtl" >
                                <asp:Label ID="Label1" runat="server" Text="الاسم باللغة العربية * :" 
                                    Font-Bold="True" ForeColor="black"></asp:Label>
                            </td>
                            <td style="direction: rtl">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="direction: rtl" class="style8">
                                <telerik:RadTextBox ID="RTxtNameInEnglish" runat="server" EmptyMessage="ادخل اسمك بالانجليزيه"
                                    TabIndex="1" Width="200px">
<PasswordStrengthSettings ShowIndicator="False" CalculationWeightings="50;15;15;20" PreferredPasswordLength="10" MinimumNumericCharacters="2" RequiresUpperAndLowerCaseCharacters="True" MinimumLowerCaseCharacters="2" MinimumUpperCaseCharacters="2" MinimumSymbolCharacters="2" OnClientPasswordStrengthCalculating="" TextStrengthDescriptions="Very Weak;Weak;Medium;Strong;Very Strong" TextStrengthDescriptionStyles="riStrengthBarL0;riStrengthBarL1;riStrengthBarL2;riStrengthBarL3;riStrengthBarL4;riStrengthBarL5;" IndicatorElementBaseStyle="riStrengthBar" IndicatorElementID=""></PasswordStrengthSettings>
                                </telerik:RadTextBox>
                            </td>
                            <td style="direction: rtl" >
                                <asp:Label ID="Label2" runat="server" Text="الاسم باللغة الانجليزية * :" 
                                    Font-Bold="True" ForeColor="black"></asp:Label>
                            </td>
                            <td style="direction: rtl">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="direction: rtl" class="style8">
                                <dx:ASPxComboBox ID="RCBNationalityId" Width="203px" runat="server" DataSourceID="DSCdNationality" TextField="Nationality" ValueField="NationalityId" ValueType="System.Int32" Theme="Youthful">
                                </dx:ASPxComboBox>
                                <%--<telerik:RadComboBox ID="RCBNationalityId" runat="server" TabIndex="2" Width="203px"
                                    DataSourceID="DSCdNationality" DataTextField="Nationality" DataValueField="NationalityId">
                                </telerik:RadComboBox>--%>
                            </td>
                            <td style="direction: rtl" >
                                <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="black" >الجنسية * :</asp:Label>
                            </td>
                            <td style="direction: rtl">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="direction: rtl" class="style8">
<%--                                <telerik:RadComboBox ID="RCBcountryId" runat="server" TabIndex="3" Width="203px"
                                    DataSourceID="DSCdcountry" DataTextField="country" DataValueField="countryId">
                                </telerik:RadComboBox>--%>
                                <dx:ASPxComboBox ID="RCBcountryId" runat="server" Width="203px" DataSourceID="DSCdcountry" TextField="country" ValueField="countryId" ValueType="System.Int32" Theme="Youthful">
                                </dx:ASPxComboBox>
                            </td>
                            <td style="direction: rtl" >
                                <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="black">دولة الإقامة *:</asp:Label>
                            </td>
                            <td style="direction: rtl">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="direction: rtl" class="style8">
                                <telerik:RadTextBox ID="RTxtCity" runat="server" EmptyMessage="ادخل اسم مدينتك" TabIndex="4"
                                    Width="200px">
<PasswordStrengthSettings ShowIndicator="False" CalculationWeightings="50;15;15;20" PreferredPasswordLength="10" MinimumNumericCharacters="2" RequiresUpperAndLowerCaseCharacters="True" MinimumLowerCaseCharacters="2" MinimumUpperCaseCharacters="2" MinimumSymbolCharacters="2" OnClientPasswordStrengthCalculating="" TextStrengthDescriptions="Very Weak;Weak;Medium;Strong;Very Strong" TextStrengthDescriptionStyles="riStrengthBarL0;riStrengthBarL1;riStrengthBarL2;riStrengthBarL3;riStrengthBarL4;riStrengthBarL5;" IndicatorElementBaseStyle="riStrengthBar" IndicatorElementID=""></PasswordStrengthSettings>
                                </telerik:RadTextBox>
                            </td>
                            <td style="direction: rtl" >
                                <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="black">المدينة* :</asp:Label>
                            </td>
                            <td style="direction: rtl">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="direction: rtl" class="style8">
                                <telerik:RadTextBox ID="RTxtAddress" runat="server" EmptyMessage="ادخل عنوانك" TabIndex="5"
                                    Width="200px">
<PasswordStrengthSettings ShowIndicator="False" CalculationWeightings="50;15;15;20" PreferredPasswordLength="10" MinimumNumericCharacters="2" RequiresUpperAndLowerCaseCharacters="True" MinimumLowerCaseCharacters="2" MinimumUpperCaseCharacters="2" MinimumSymbolCharacters="2" OnClientPasswordStrengthCalculating="" TextStrengthDescriptions="Very Weak;Weak;Medium;Strong;Very Strong" TextStrengthDescriptionStyles="riStrengthBarL0;riStrengthBarL1;riStrengthBarL2;riStrengthBarL3;riStrengthBarL4;riStrengthBarL5;" IndicatorElementBaseStyle="riStrengthBar" IndicatorElementID=""></PasswordStrengthSettings>
                                </telerik:RadTextBox>
                            </td>
                            <td style="direction: rtl">
                                <asp:Label ID="Label6" runat="server" Font-Bold="True" ForeColor="black">العنوان :</asp:Label>
                            </td>
                            <td style="direction: rtl">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="direction: rtl" class="style8">
                                <telerik:RadTextBox ID="RTxttel" runat="server" EmptyMessage="ادخل هاتفك" TabIndex="6"
                                    Width="200px">
<PasswordStrengthSettings ShowIndicator="False" CalculationWeightings="50;15;15;20" PreferredPasswordLength="10" MinimumNumericCharacters="2" RequiresUpperAndLowerCaseCharacters="True" MinimumLowerCaseCharacters="2" MinimumUpperCaseCharacters="2" MinimumSymbolCharacters="2" OnClientPasswordStrengthCalculating="" TextStrengthDescriptions="Very Weak;Weak;Medium;Strong;Very Strong" TextStrengthDescriptionStyles="riStrengthBarL0;riStrengthBarL1;riStrengthBarL2;riStrengthBarL3;riStrengthBarL4;riStrengthBarL5;" IndicatorElementBaseStyle="riStrengthBar" IndicatorElementID=""></PasswordStrengthSettings>
                                </telerik:RadTextBox>
                            </td>
                            <td style="direction: rtl">
                                <asp:Label ID="Label7" runat="server" Font-Bold="True" ForeColor="black">الهاتف * :</asp:Label>
                            </td>
                            <td style="direction: rtl">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="direction: rtl" class="style8">
                                <telerik:RadTextBox ID="RTxtMobile" runat="server" EmptyMessage="ادخل جوالك" TabIndex="7"
                                    Width="200px">
<PasswordStrengthSettings ShowIndicator="False" CalculationWeightings="50;15;15;20" PreferredPasswordLength="10" MinimumNumericCharacters="2" RequiresUpperAndLowerCaseCharacters="True" MinimumLowerCaseCharacters="2" MinimumUpperCaseCharacters="2" MinimumSymbolCharacters="2" OnClientPasswordStrengthCalculating="" TextStrengthDescriptions="Very Weak;Weak;Medium;Strong;Very Strong" TextStrengthDescriptionStyles="riStrengthBarL0;riStrengthBarL1;riStrengthBarL2;riStrengthBarL3;riStrengthBarL4;riStrengthBarL5;" IndicatorElementBaseStyle="riStrengthBar" IndicatorElementID=""></PasswordStrengthSettings>
                                </telerik:RadTextBox>
                            </td>
                            <td style="direction: rtl" >
                                <asp:Label ID="Label8" runat="server" Font-Bold="True" ForeColor="black">جوال * :</asp:Label>
                            </td>
                            <td style="direction: rtl">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="direction: rtl" class="style8">
                                <telerik:RadTextBox ID="RTxtEmail" runat="server" EmptyMessage="ادخل بريدك الالكتروني"
                                    TabIndex="8" Width="200px">
<PasswordStrengthSettings ShowIndicator="False" CalculationWeightings="50;15;15;20" PreferredPasswordLength="10" MinimumNumericCharacters="2" RequiresUpperAndLowerCaseCharacters="True" MinimumLowerCaseCharacters="2" MinimumUpperCaseCharacters="2" MinimumSymbolCharacters="2" OnClientPasswordStrengthCalculating="" TextStrengthDescriptions="Very Weak;Weak;Medium;Strong;Very Strong" TextStrengthDescriptionStyles="riStrengthBarL0;riStrengthBarL1;riStrengthBarL2;riStrengthBarL3;riStrengthBarL4;riStrengthBarL5;" IndicatorElementBaseStyle="riStrengthBar" IndicatorElementID=""></PasswordStrengthSettings>
                                </telerik:RadTextBox>
                            </td>
                            <td style="direction: rtl" >
                                <asp:Label ID="Label9" runat="server" Font-Bold="True" ForeColor="black">بريد الكتروني * :</asp:Label>
                            </td>
                            <td style="direction: rtl">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="direction: rtl" class="style8">
                                <telerik:RadTextBox ID="RTxtmony" runat="server" EmptyMessage="ادخل مبلغ الدوره المحول"
                                    TabIndex="9" Width="200px">
<PasswordStrengthSettings ShowIndicator="False" CalculationWeightings="50;15;15;20" PreferredPasswordLength="10" MinimumNumericCharacters="2" RequiresUpperAndLowerCaseCharacters="True" MinimumLowerCaseCharacters="2" MinimumUpperCaseCharacters="2" MinimumSymbolCharacters="2" OnClientPasswordStrengthCalculating="" TextStrengthDescriptions="Very Weak;Weak;Medium;Strong;Very Strong" TextStrengthDescriptionStyles="riStrengthBarL0;riStrengthBarL1;riStrengthBarL2;riStrengthBarL3;riStrengthBarL4;riStrengthBarL5;" IndicatorElementBaseStyle="riStrengthBar" IndicatorElementID=""></PasswordStrengthSettings>
                                </telerik:RadTextBox>
                            </td>
                            <td style="direction: rtl" >
                                <asp:Label ID="Label10" runat="server" Font-Bold="True" ForeColor="black">المبلغ المحول للدورة  :
                                </asp:Label>
                            </td>
                            <td style="direction: rtl">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="direction: rtl" class="style8">
                                <telerik:RadTextBox ID="RTxtaccname" runat="server" EmptyMessage="ادخل اسم صاحب الحساب البنكي"
                                    TabIndex="10" Width="200px">
<PasswordStrengthSettings ShowIndicator="False" CalculationWeightings="50;15;15;20" PreferredPasswordLength="10" MinimumNumericCharacters="2" RequiresUpperAndLowerCaseCharacters="True" MinimumLowerCaseCharacters="2" MinimumUpperCaseCharacters="2" MinimumSymbolCharacters="2" OnClientPasswordStrengthCalculating="" TextStrengthDescriptions="Very Weak;Weak;Medium;Strong;Very Strong" TextStrengthDescriptionStyles="riStrengthBarL0;riStrengthBarL1;riStrengthBarL2;riStrengthBarL3;riStrengthBarL4;riStrengthBarL5;" IndicatorElementBaseStyle="riStrengthBar" IndicatorElementID=""></PasswordStrengthSettings>
                                </telerik:RadTextBox>
                            </td>
                            <td style="direction: rtl" >
                                <asp:Label ID="Label11" runat="server" Font-Bold="True" ForeColor="black">اسم صاحب الحساب البنكي المحول منه :</asp:Label>
                            </td>
                            <td style="direction: rtl">
                                &nbsp; &nbsp;</td>
                        </tr>
                                       <tr>
                                           <td class="style8" colspan="3" style="direction: rtl">
                                               <p>
    <asp:Label ID="msgLabel" runat="server" Font-Bold="True" ForeColor="#009933"></asp:Label>
</p>
                                           </td>
                                       </tr>
                                </table>
                                
                                </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxButton ID="sendASPxButton0" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" meta:resourceKey="saveASPxButtonResource1" OnClick="yesDeleteASPxButton_Click" Text="إرسال" Theme="PlasticBlue" ValidationContainerID="idASPxTextBox" Width="100px" Font-Bold="True">
                                    <ClientSideEvents Click="function(s, e) {
	deleteMsgASPxPopupControl.Hide();
}" />
                                </dx:ASPxButton>
                                <dx:ASPxButton ID="RBtnClear" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" Font-Bold="True" meta:resourceKey="saveASPxButtonResource1" OnClick="yesDeleteASPxButton_Click" Text="مسح" Theme="PlasticBlue" Width="100px">
                                    <ClientSideEvents Click="function(s, e) {
	deleteMsgASPxPopupControl.Hide();
}" />
                                </dx:ASPxButton>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:SqlDataSource ID="replaySqlDataSource" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\datacontact.mdb;Persist Security Info=True" InsertCommand="INSERT INTO tblmsgsyndicateReplay(msgid, SyndicateId, ReplayDate, ReplayText) VALUES (?, ?, ?, ?)" OnInserted="SqlDataSource2_Inserted" ProviderName="System.Data.OleDb" SelectCommand="SELECT tblmsgsyndicateReplay.* FROM tblmsgsyndicateReplay"></asp:SqlDataSource>
                                <%--<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanelEdit" runat="server">
                                </telerik:RadAjaxLoadingPanel>--%>
                                <asp:AccessDataSource ID="DSCdcountry" runat="server" DataFile="~/App_Data/AATSWEB.mdb" SelectCommand="Select countryId, country From Cdcountry"></asp:AccessDataSource>
                                <telerik:RadNotification ID="RadNotificationInfo" runat="server" Animation="Fade" AnimationDuration="1000" AutoCloseDelay="0" EnableRoundedCorners="True" OnClientHidden="hideModalDiv" OnClientShowing="showModalDiv" Position="Center" Width="400px">
                                    <NotificationMenu ID="TitleMenu">
                                    </NotificationMenu>
                                </telerik:RadNotification>
                                <asp:AccessDataSource ID="DSCdNationality" runat="server" DataFile="~/App_Data/AATSWEB.mdb" SelectCommand="Select NationalityId, Nationality From CdNationality"></asp:AccessDataSource>
                            </td>
                        </tr>
                    </table>
</center>
    
                    </dx:PopupControlContentControl>

</ContentCollection>
                <CloseButtonImage Height="16px" Width="17px" />
            </dx:ASPxPopupControl>
            





            <dx:ASPxPopupControl ID="readMsgASPxPopupControl" runat="server" 
                
                 CloseAction="CloseButton" 
                Modal="True" PopupElementID="deleteASPxButton" 
                ClientInstanceName="deleteMsgASPxPopupControl" 
                HeaderText="قراءة الرسالة" Theme="Youthful" RightToLeft="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle" Font-Bold="True">
                <ContentStyle VerticalAlign="Top">
                </ContentStyle>
                <SizeGripImage Height="12px" Width="12px" />
                <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl3" runat="server">

    <center>
                    <table>
                        <tr>
                            <td>
                                &nbsp;<dx:ASPxMemo ID="readMsgASPxMemo" runat="server" Height="178px" Width="570px">
                                </dx:ASPxMemo>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:SqlDataSource ID="readSqlDataSource" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\datacontact.mdb;Persist Security Info=True" InsertCommand="INSERT INTO tblmsgsyndicateReplay(msgid, SyndicateId, ReplayDate, ReplayText) VALUES (?, ?, ?, ?)" OnInserted="SqlDataSource2_Inserted" ProviderName="System.Data.OleDb" SelectCommand="SELECT readmsgsyndicate.* FROM readmsgsyndicate"></asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
</center>
    
                    </dx:PopupControlContentControl>

</ContentCollection>
                <CloseButtonImage Height="16px" Width="17px" />
            </dx:ASPxPopupControl>
            







            







            







            





