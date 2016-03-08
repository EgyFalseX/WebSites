<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FilesUserControl.ascx.cs" Inherits="FilesUserControl" %>


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
	padding: 1px;
	cursor: pointer;
}
    </style>

        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" ClientInstanceName="ASPxGridView1" CssFilePath="~/App_Themes/Office2010Black/{0}/styles.css" CssPostfix="Office2010Black" DataSourceID="filesSqlDataSource" EnableTheming="True" KeyFieldName="FileID" Theme="Glass" Font-Bold="True">
            <ClientSideEvents EndCallback="function(s, e) {

}" RowClick="function(s, e) {

}" />

          
            <Columns>
                <dx:GridViewDataMemoColumn Caption="العنوان" FieldName="FileTitle" ToolTip="الاسم عربي" VisibleIndex="1">
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
                            <dx:GridViewDataTextColumn Caption=" " VisibleIndex="0" Name="HasReaded" >
                                <DataItemTemplate>
<%--                                    <dx:ASPxImage ID="ASPxImage2" runat="server" Height="30px" ImageUrl='<%# Convert.ToString(Eval("Readed")) != "" ? "~/contactsite/Images/read.png" : "~/contactsite/Images/unread.png" %>'  Width="30px">
                                    </dx:ASPxImage>--%>
                                </DataItemTemplate>
            </dx:GridViewDataTextColumn>
                <dx:GridViewDataMemoColumn Caption="التفاصيل" VisibleIndex="35" Visible="False">
                    <PropertiesMemoEdit>
                        <Style HorizontalAlign="Center">
                        </Style>
                    </PropertiesMemoEdit>
                    <DataItemTemplate>
                        <dx:ASPxButton ID="readASPxButton" runat="server" OnClick="readASPxButton_Click" Text="قراءة" Theme="PlasticBlue">
                        </dx:ASPxButton>
                        <asp:HiddenField ID="msgIDHiddenField" runat="server" Value='<%# Eval("FileID") %>' />
                    </DataItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataComboBoxColumn Caption="التخصص" VisibleIndex="26" FieldName="FileCategoryID">
               
                         <PropertiesComboBox DataSourceID="categSqlDataSource" TextField="CategoryName" ValueField="CategoryId" ValueType="System.Int32">
                        <ValidationSettings ErrorText="">
                            <RegularExpression ErrorText="Digits Only" ValidationExpression="\d+" />
                        </ValidationSettings>
                    </PropertiesComboBox>
                  
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataImageColumn Caption="الملف" FieldName="FilePath" VisibleIndex="28" Name="IMG">
                    <DataItemTemplate>
<%--                        <dx:ASPxImage ID="ASPxImage1" runat="server" Height="60px" ImageUrl='<%# "../../Client/"+Eval("ArticleImage") %>' Width="60px">
                        </dx:ASPxImage>
                        <asp:HiddenField ID="imgPathHiddenField" runat="server" Value='<%# "ArticleImages/"+Eval("ArticleImage") %>' />--%>
                 
                        <dx:ASPxTextBox ID="filePathTextBox" runat="server" Text='<%# "../Admin/"+Eval("FilePath") %>' Width="170px" Visible="False">
                        </dx:ASPxTextBox>
                 
                        <dx:ASPxButton ID="fileASPxButton" runat="server" OnClick="fileASPxButton_Click" Theme="PlasticBlue" EnableTheming="True" Height="30px" HorizontalAlign="Center" VerticalAlign="Middle" Visible='<%# Convert.ToString(Eval("FilePath")) !="" && Convert.ToString(Eval("FilePath"))!=null? true : false %>' Width="30px">
                            <Image Height="45px" Url="~/images/Attachment_Icon.png" Width="45px">
                            </Image>
                        </dx:ASPxButton>
                    </DataItemTemplate>
                </dx:GridViewDataImageColumn>
                <dx:GridViewDataTextColumn FieldName="TimeIn" VisibleIndex="2" Caption="الوقت">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="FileID" VisibleIndex="30" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="نبذة" FieldName="FileText" VisibleIndex="37">
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
<asp:SqlDataSource ID="filesSqlDataSource" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\AriscFriend.mdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT TBLFiles.* FROM TBLFiles">
</asp:SqlDataSource>




<asp:SqlDataSource ID="categSqlDataSource" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\AriscFriend.mdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT CategoryId, CategoryName FROM CdCategories"></asp:SqlDataSource>





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
            







            







            







            





