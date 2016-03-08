<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CPFriendsSignUpUserControl.ascx.cs" Inherits="CPFriendsSignUpUserControl" %>


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

<%@ Register src="UploadImageUserControl2.ascx" tagname="UploadImageUserControl2" tagprefix="uc1" %>

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
<%--	background: #E2F0FF url('<%=WebResource("DevExpress.Web.ASPxThemes.App_Themes.Aqua.Web.pcHeaderBack.gif")%>') repeat-x;--%>
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
    </style>

        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" ClientInstanceName="ASPxGridView1" CssFilePath="~/App_Themes/Office2010Black/{0}/styles.css" CssPostfix="Office2010Black" DataSourceID="friendsSqlDataSource" EnableTheming="True" KeyFieldName="FriendID" OnBeforePerformDataSelect="ASPxGridView1_BeforePerformDataSelect" OnCustomButtonCallback="ASPxGridView1_CustomButtonCallback" Theme="Glass" Font-Bold="True" OnCustomCallback="ASPxGridView1_CustomCallback" OnCancelRowEditing="ASPxGridView1_CancelRowEditing">
            <ClientSideEvents EndCallback="function(s, e) {

}" RowClick="function(s, e) {

}" />

          
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0">
                    <EditButton Text="تعديل" Visible="True">
                    </EditButton>
                    <DeleteButton Text="حذف" Visible="True">
                    </DeleteButton>
                    <CancelButton Text="تراجع">
                    </CancelButton>
                    <UpdateButton Text="حفظ">
                    </UpdateButton>
                </dx:GridViewCommandColumn>
                <dx:GridViewDataButtonEditColumn Caption="إرسال رد" VisibleIndex="34" Name="Replay" Visible="False">
                    <DataItemTemplate>
                        
                    
<%--                        <dx:ASPxButton ID="replayASPxButton" Enabled='<%#Convert.ToString(Eval("Replied"))!=""?false:true%>' runat="server" OnClick="replayASPxButton_Click" Text="ارسال رد" Theme="PlasticBlue" >
                        </dx:ASPxButton>--%>
                        <asp:HiddenField ID="msgIDHiddenField" runat="server" Value='<%# Eval("msgid") %>' />
                    </DataItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataButtonEditColumn>
                <dx:GridViewDataMemoColumn Caption="الاسم عربي" FieldName="FriendArabicName" ToolTip="الاسم عربي" VisibleIndex="2">
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
                <dx:GridViewDataComboBoxColumn Caption="المحافظة" FieldName="City" ToolTip="المحافظة" VisibleIndex="17">
                    <PropertiesComboBox DataSourceID="citySqlDataSource" TextField="City" ValueField="CityID" ValueType="System.Int32">
                        <ValidationSettings ErrorText="">
                            <RegularExpression ErrorText="Digits Only" ValidationExpression="\d+" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                    <EditFormSettings Visible="True" />
                    <HeaderStyle HorizontalAlign="Center" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn FieldName="FriendEnglishName" ToolTip="الاسم انجليزي" VisibleIndex="3" Caption="الاسم انجليزي">
                    <EditFormSettings Visible="False" />
                    <HeaderStyle HorizontalAlign="Center" />
                </dx:GridViewDataTextColumn >
                            <dx:GridViewDataTextColumn Caption=" " VisibleIndex="1" Name="HasReaded" >
                                <EditFormSettings Visible="False" />
                                <DataItemTemplate>
<%--                                    <dx:ASPxImage ID="ASPxImage2" runat="server" Height="30px" ImageUrl='<%# Convert.ToString(Eval("Readed")) != "" ? "~/contactsite/Images/read.png" : "~/contactsite/Images/unread.png" %>'  Width="30px">
                                    </dx:ASPxImage>--%>
                                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Email" Caption="البريد الالكتروني" VisibleIndex="13">
<PropertiesTextEdit NullText="رقم اللوحة" DisplayFormatString="{0:yyyy/MM/dd}"></PropertiesTextEdit>

<EditFormSettings Visible="True"></EditFormSettings>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
</dx:GridViewDataTextColumn>
                <dx:GridViewDataButtonEditColumn Caption="تنشيط" VisibleIndex="32" Name="activate">
                    <DataItemTemplate>
                        <dx:ASPxButton ID="readASPxButton" runat="server" OnClick="readASPxButton_Click" Text="قراءة" Theme="PlasticBlue" Visible="False">
                        </dx:ASPxButton>
                        <dx:ASPxCheckBox ID="isActiveASPxCheckBox" runat="server" AutoPostBack="True" CheckState="Unchecked" OnCheckedChanged="isActiveASPxCheckBox_CheckedChanged" Value='<%# Eval("IsActive") %>'>
                        </dx:ASPxCheckBox>
                        <asp:HiddenField ID="msgIDHiddenField" runat="server" Value='<%# Eval("FriendID") %>' />
                    </DataItemTemplate>
                    <EditItemTemplate>
                        <asp:HiddenField ID="msgIDHiddenField" runat="server" Value='<%# Eval("FriendID") %>' />
                    </EditItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                </dx:GridViewDataButtonEditColumn>
                <dx:GridViewDataMemoColumn Caption="الرد" FieldName="msgadminreplay" VisibleIndex="36" Visible="False">
                    <PropertiesMemoEdit>
                        <Style HorizontalAlign="Center">
                        </Style>
                    </PropertiesMemoEdit>
                    <HeaderStyle HorizontalAlign="Center" />
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataTextColumn Caption="هل تم قراءة الرد" FieldName="UserReaded" ReadOnly="True" VisibleIndex="38" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FacebookEmail" VisibleIndex="15" Caption="بريد الفيسبوك">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn Caption="النوع" FieldName="GenderID" VisibleIndex="4">
                    <PropertiesComboBox DataSourceID="genderSqlDataSource" TextField="Gender" ValueField="GenderID">
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataTextColumn Caption="الموبايل" FieldName="Mobile" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="الوظيفة" FieldName="JobName" VisibleIndex="21">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="التخصص" FieldName="FieldText" VisibleIndex="19">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="إسم المستخدم" FieldName="UserName" VisibleIndex="23">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataImageColumn Caption="الصورة" FieldName="Photo" VisibleIndex="25" Name="PhotoImage">
                    <DataItemTemplate>
                        <dx:ASPxImage ID="ASPxImage1" runat="server" Height="60px" ImageUrl='<%# "../../Client/"+Eval("Photo") %>' Width="60px">
                        </dx:ASPxImage>
                    </DataItemTemplate>
                    <EditItemTemplate>
                        <asp:HiddenField ID="imgPathHiddenField" runat="server" Value='<%# Eval("Photo") %>' />
                        <uc1:UploadImageUserControl2 ID="UploadImageUserControl21" runat="server" MFileSize="100000" PathID="1" />
                        <dx:ASPxButton ID="saveASPxButton" runat="server" OnClick="saveASPxButton_Click" Text="حفظ" Theme="PlasticBlue">
                        </dx:ASPxButton>
                        <dx:ASPxLabel ID="msgNotifyASPxLabel1" runat="server" ClientInstanceName="msgNotifyASPxLabel" style="font-weight: 700; color:red;" Text="عند تعديل البيانات الاخرى تكون الصورة اولا ثم تعديل البيانات  ">
                        </dx:ASPxLabel>
                    </EditItemTemplate>
                </dx:GridViewDataImageColumn>
                <dx:GridViewDataCheckColumn Caption="تنشيط" FieldName="IsActive" VisibleIndex="29" Visible="False">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataTextColumn Caption="الوقت" FieldName="TimeIn" VisibleIndex="27">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FriendID" VisibleIndex="31">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
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
<asp:SqlDataSource ID="friendsSqlDataSource" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\AriscFriend.mdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT FriendID, FriendArabicName, FriendEnglishName, GenderID, Mobile, Email, FacebookEmail, City, countryId, FieldText, JobName, UserName, Pass, Photo, IsActive, TimeIn FROM TBLFriends ORDER BY TimeIn DESC" OnInserted="SqlDataSource2_Inserted" DeleteCommand="DELETE FROM TBLFriends WHERE (FriendID = ?)" UpdateCommand="UPDATE TBLFriends SET FriendArabicName = ?, FriendEnglishName = ?, GenderID = ?, Mobile = ?, Email = ?, FacebookEmail = ?, City = ?, countryId = ?, FieldText = ?, JobName = ?, IsActive = ? WHERE (FriendID = ?)">
    <DeleteParameters>
        <asp:Parameter Name="FriendID" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="FriendArabicName" Type="String" />
        <asp:Parameter Name="FriendEnglishName" Type="String" />
        <asp:Parameter Name="GenderID" Type="Byte" />
        <asp:Parameter Name="Mobile" Type="String" />
        <asp:Parameter Name="Email" Type="String" />
        <asp:Parameter Name="FacebookEmail" Type="String" />
        <asp:Parameter Name="City" Type="Int32" />
        <asp:Parameter Name="countryId" Type="Int32" />
        <asp:Parameter Name="FieldText" Type="String" />
        <asp:Parameter Name="JobName" Type="String" />
        <asp:Parameter Name="IsActive" Type="Boolean" />
        <asp:Parameter Name="FriendID" Type="Int32" />
    </UpdateParameters>
</asp:SqlDataSource>




<asp:SqlDataSource ID="citySqlDataSource" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\AriscFriend.mdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT * FROM [CdCity]"></asp:SqlDataSource>





<asp:SqlDataSource ID="genderSqlDataSource" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\AriscFriend.mdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT * FROM [CdGender]"></asp:SqlDataSource>





            <dx:ASPxPopupControl ID="replayMsgASPxPopupControl" runat="server" 
                 CloseAction="CloseButton" 
                Modal="True" PopupElementID="deleteASPxButton" 
                ClientInstanceName="deleteMsgASPxPopupControl" 
                HeaderText="إرسال رد على الرسالة" Theme="PlasticBlue" RightToLeft="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle" AllowDragging="True" Font-Bold="True">
                <ContentStyle VerticalAlign="Top">
                </ContentStyle>
                <SizeGripImage Height="12px" Width="12px" />
                <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">

    <center>
                    <table width="580">
                        <tr>
                            <td>
                                <strong>قم بإدخال الرد</strong></td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;<dx:ASPxMemo ID="sendMsgASPxMemo" runat="server" Height="178px" Width="560px">
                                </dx:ASPxMemo>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxButton ID="sendASPxButton" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" meta:resourceKey="saveASPxButtonResource1" OnClick="yesDeleteASPxButton_Click" Text="إرسال" Theme="PlasticBlue" ValidationContainerID="idASPxTextBox" Width="100px" Font-Bold="True">
                                    <ClientSideEvents Click="function(s, e) {
	deleteMsgASPxPopupControl.Hide();
}" />
                                </dx:ASPxButton>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%--<asp:SqlDataSource ID="replaySqlDataSource" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\datacontactfrom.mdb;Persist Security Info=True" InsertCommand="INSERT INTO tblmsgsyndicateReplay(msgid, SyndicateId, ReplayDate, ReplayText) VALUES (?, ?, ?, ?)" OnInserted="SqlDataSource2_Inserted" ProviderName="System.Data.OleDb" SelectCommand="SELECT tblmsgsyndicateReplay.* FROM tblmsgsyndicateReplay"></asp:SqlDataSource>--%>
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
                HeaderText="قراءة الرسالة" Theme="PlasticBlue" RightToLeft="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle" Font-Bold="True">
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
                                <%--<asp:SqlDataSource ID="readSqlDataSource" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\datacontactfrom.mdb;Persist Security Info=True" InsertCommand="INSERT INTO tblmsgsyndicateReplay(msgid, SyndicateId, ReplayDate, ReplayText) VALUES (?, ?, ?, ?)" OnInserted="SqlDataSource2_Inserted" ProviderName="System.Data.OleDb" SelectCommand="SELECT adminreaddate FROM tblmsgsyndicate"></asp:SqlDataSource>--%>
                            </td>
                        </tr>
                    </table>
</center>
    
                    </dx:PopupControlContentControl>

</ContentCollection>
                <CloseButtonImage Height="16px" Width="17px" />
            </dx:ASPxPopupControl>
            







            







            







            





