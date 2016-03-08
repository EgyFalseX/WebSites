<%@ Control Language="C#" AutoEventWireup="true" CodeFile="FriendsSingUpUserControl.ascx.cs" Inherits="FriendsSingUpUserControl" %>


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


<%@ Register src="UploadImageUserControl1.ascx" tagname="UploadImageUserControl" tagprefix="uc1" %>


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
    .auto-style1 {
        height: 25px;
    }
    </style>

<%--        <asp:SqlDataSource ID="friendsSqlDataSource" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\AriscFriend.mdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT * FROM [TBLFriends]" OnInserted="SqlDataSource2_Inserted">
</asp:SqlDataSource>--%>




 <asp:AccessDataSource ID="friendsSqlDataSource" runat="server" DataFile="~/App_Data/AriscFriend.mdb" SelectCommand="SELECT * FROM [TBLFriends]" OnInserted="SqlDataSource2_Inserted"></asp:AccessDataSource>




<%--            <dx:ASPxPopupControl ID="replayMsgASPxPopupControl" runat="server" 
                 CloseAction="CloseButton" 
                Modal="True" PopupElementID="deleteASPxButton" 
                ClientInstanceName="deleteMsgASPxPopupControl" 
                HeaderText="التسجيل" Theme="Glass" RightToLeft="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="Middle" AllowDragging="True" Font-Bold="True" ShowOnPageLoad="True">
                <ContentStyle VerticalAlign="Top">
                </ContentStyle>
                <SizeGripImage Height="12px" Width="12px" />
                <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl2" runat="server">--%>

<center>
                    <table width="780">
                        <tr>
                            <td>
                                <strong>قم بإدخال بيانات التسجيل</strong></td>
                        </tr>
                        <tr>
                            <td>
                                
                                <table dir="ltr" >
                                       <tr>
                            <td style="direction: rtl"  rowspan="3"><asp:Label ID="Label14" runat="server" Text="صورة شخصية * :" 
                                    Font-Bold="True" ForeColor="black"></asp:Label>
                                <asp:TextBox ID="EventImageTextBox" runat="server" Text='<%# Bind("ImageLink") %>' Visible="False" />
                                
                                <uc1:UploadImageUserControl ID="UploadImageUserControl1" runat="server" SetImageHeight="0" SetImageWidth="0" MFileSize="50000" PathID="1"/>
                                           </td>
                            <td style="direction: rtl" class="style8" >
                                <telerik:RadTextBox ID="RTxtTraineeName" runat="server" EmptyMessage="ادخل اسمك بالعربيه" LabelCssClass="" Width="200px">
                                    <PasswordStrengthSettings CalculationWeightings="50;15;15;20" IndicatorElementBaseStyle="riStrengthBar" IndicatorElementID="" MinimumLowerCaseCharacters="2" MinimumNumericCharacters="2" MinimumSymbolCharacters="2" MinimumUpperCaseCharacters="2" OnClientPasswordStrengthCalculating="" PreferredPasswordLength="10" RequiresUpperAndLowerCaseCharacters="True" ShowIndicator="False" TextStrengthDescriptions="Very Weak;Weak;Medium;Strong;Very Strong" TextStrengthDescriptionStyles="riStrengthBarL0;riStrengthBarL1;riStrengthBarL2;riStrengthBarL3;riStrengthBarL4;riStrengthBarL5;" />
                                </telerik:RadTextBox>

                            </td>
                            <td style="direction: rtl" >
                                <asp:Label ID="Label1" runat="server" Text="الاسم بالعربية * :" 
                                    Font-Bold="True" ForeColor="Black"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="direction: rtl" >
                                <telerik:RadTextBox ID="RTxtNameInEnglish" runat="server" EmptyMessage="ادخل اسمك بالانجليزيه" LabelCssClass="" TabIndex="1" Width="200px">
                                    <PasswordStrengthSettings CalculationWeightings="50;15;15;20" IndicatorElementBaseStyle="riStrengthBar" IndicatorElementID="" MinimumLowerCaseCharacters="2" MinimumNumericCharacters="2" MinimumSymbolCharacters="2" MinimumUpperCaseCharacters="2" OnClientPasswordStrengthCalculating="" PreferredPasswordLength="10" RequiresUpperAndLowerCaseCharacters="True" ShowIndicator="False" TextStrengthDescriptions="Very Weak;Weak;Medium;Strong;Very Strong" TextStrengthDescriptionStyles="riStrengthBarL0;riStrengthBarL1;riStrengthBarL2;riStrengthBarL3;riStrengthBarL4;riStrengthBarL5;" />
                                </telerik:RadTextBox>

                            </td>
                            <td style="direction: rtl" >
                                <asp:Label ID="Label2" runat="server" Text="الاسم بالانجليزية * :" 
                                    Font-Bold="True" ForeColor="Black"></asp:Label>
                            </td>
                        </tr>
                                       <tr>
                                           <td  align="right">
                                               <dx:ASPxRadioButtonList ID="genderASPxRadioButtonList" runat="server" RepeatDirection="Horizontal" ValueType="System.Int32">
                                                   <Items>
                                                       <dx:ListEditItem Text="ذكر" Value="1" />
                                                       <dx:ListEditItem Text="أنثى" Value="2" />
                                                   </Items>
                                               </dx:ASPxRadioButtonList>
                                           </td>
                                           <td style="direction: rtl" >
                                <asp:Label ID="Label11" runat="server" Text="النوع * :" 
                                    Font-Bold="True" ForeColor="black"></asp:Label>
                                               &nbsp;</td>
                                       </tr>
                                       <tr>
                                           <td class="style8" style="direction: rtl">
                                               <dx:ASPxLabel ID="msgNotifyASPxLabel" runat="server" ClientInstanceName="msgNotifyASPxLabel" style="font-weight: 700; color: #008000;" Text="يجب أن يكون نوع الصورة jpg او jpeg و حجمها لا يزيد عن 100 كيلو بايت">
</dx:ASPxLabel>

                                           </td>
                                           <td style="direction: rtl" class="style8">
                                               <telerik:RadTextBox ID="jobRTxt" runat="server" EmptyMessage="ادخل مسمى الوظيفة" LabelCssClass="" TabIndex="1" Width="200px">
                                                   <PasswordStrengthSettings CalculationWeightings="50;15;15;20" IndicatorElementBaseStyle="riStrengthBar" IndicatorElementID="" MinimumLowerCaseCharacters="2" MinimumNumericCharacters="2" MinimumSymbolCharacters="2" MinimumUpperCaseCharacters="2" OnClientPasswordStrengthCalculating="" PreferredPasswordLength="10" RequiresUpperAndLowerCaseCharacters="True" ShowIndicator="False" TextStrengthDescriptions="Very Weak;Weak;Medium;Strong;Very Strong" TextStrengthDescriptionStyles="riStrengthBarL0;riStrengthBarL1;riStrengthBarL2;riStrengthBarL3;riStrengthBarL4;riStrengthBarL5;" />
                                               </telerik:RadTextBox>
                                           </td>
                                           <td style="direction: rtl">&nbsp;<asp:Label ID="Label12" runat="server" Text="الوظيفة * :" 
                                    Font-Bold="True" ForeColor="black"></asp:Label>
                                              </td>
                                       </tr>
                                       <tr>
                                           <td class="style8" style="direction: rtl">&nbsp;</td>
                                           <td class="style8" style="direction: rtl">
                                               <telerik:RadTextBox ID="fieldRTxt" runat="server" EmptyMessage="ادخل اسم المؤهل او التخصص" LabelCssClass="" TabIndex="1" Width="200px">
                                                   <PasswordStrengthSettings CalculationWeightings="50;15;15;20" IndicatorElementBaseStyle="riStrengthBar" IndicatorElementID="" MinimumLowerCaseCharacters="2" MinimumNumericCharacters="2" MinimumSymbolCharacters="2" MinimumUpperCaseCharacters="2" OnClientPasswordStrengthCalculating="" PreferredPasswordLength="10" RequiresUpperAndLowerCaseCharacters="True" ShowIndicator="False" TextStrengthDescriptions="Very Weak;Weak;Medium;Strong;Very Strong" TextStrengthDescriptionStyles="riStrengthBarL0;riStrengthBarL1;riStrengthBarL2;riStrengthBarL3;riStrengthBarL4;riStrengthBarL5;" />
                                               </telerik:RadTextBox>
                                           </td>
                                           <td style="direction: rtl"><asp:Label ID="Label13" runat="server" Text="التخصص * :" 
                                    Font-Bold="True" ForeColor="black"></asp:Label>
                                               </td>
                                       </tr>
                        <tr>
                            <td style="direction: rtl" class="style8">
                                <%--<telerik:RadComboBox ID="RCBNationalityId" runat="server" TabIndex="2" Width="203px"
                                    DataSourceID="DSCdNationality" DataTextField="Nationality" DataValueField="NationalityId">
                                </telerik:RadComboBox>--%>&nbsp;</td>
                            <td  align="right">
                                <dx:ASPxComboBox ID="RCBCityId" runat="server" DataSourceID="DSCdCity" TextField="City" Theme="Glass" ValueField="CityID" ValueType="System.Int32" Width="203px">
                                </dx:ASPxComboBox>

                            </td>
                            <td style="direction: rtl" >
                                <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="black" >المحافظة * :</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="direction: rtl" class="auto-style1">
                                </td>
                            <td style="direction: rtl" class="auto-style1" >
                                 <dx:ASPxTextBox ID="facebookASPxTextBox" runat="server" Width="200px" 
                ClientIDMode="AutoID" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                CssPostfix="PlasticBlue" MaxLength="50" 
                SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" 
                NullText="Example: x@x.x">
                <ValidationSettings SetFocusOnError="True" ErrorText="" 
                    ValidationGroup="VG">
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px" />
                    </ErrorFrameStyle>
                    <RegularExpression ErrorText="إيميل خطأ" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                  
                </ValidationSettings>
            </dx:ASPxTextBox>

                            </td>
                            <td style="direction: rtl"  >
                                <asp:Label ID="Label5" runat="server" Font-Bold="True" ForeColor="black">إيميل الفيس بوك :</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="direction: rtl" class="style8">
                                &nbsp;</td>
                            <td style="direction: rtl"  >
                                    <dx:ASPxTextBox ID="phoneASPxTextBox" runat="server" Width="200px" 
                ClientIDMode="AutoID" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                CssPostfix="PlasticBlue" MaxLength="15" 
                SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                <ValidationSettings SetFocusOnError="True" ErrorText="" 
                    ValidationGroup="VG">
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px" />
                    </ErrorFrameStyle>
                    <RegularExpression ErrorText="رقم تليفون خطأ" 
                        ValidationExpression="\d+" />
                    <RequiredField ErrorText="" IsRequired="True" />
                </ValidationSettings>
            </dx:ASPxTextBox>
                                </td>
                            <td style="direction: rtl" >
                                <asp:Label ID="Label8" runat="server" Font-Bold="True" ForeColor="black">موبايل * :</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="direction: rtl" class="style8">
                               <dx:ASPxLabel ID="msgNotifyASPxLabel0" runat="server" ClientInstanceName="msgNotifyASPxLabel" style="font-weight: 700; color: #008000;" Text=" سيتم إرسال معلومات الدخول عليه">
                                </dx:ASPxLabel>
                            </td>
                            <td style="direction: rtl" class="style8" >
                                 <dx:ASPxTextBox ID="emailASPxTextBox" runat="server" Width="200px" 
                ClientIDMode="AutoID" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                CssPostfix="PlasticBlue" MaxLength="50" 
                SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" 
                NullText="Example: x@x.x">
                <ValidationSettings SetFocusOnError="True" ErrorText="" 
                    ValidationGroup="VG">
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px" />
                    </ErrorFrameStyle>
                    <RegularExpression ErrorText="إيميل خطأ" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                    <RequiredField ErrorText="" IsRequired="True" />
                </ValidationSettings>
            </dx:ASPxTextBox>

                            </td>
                            <td style="direction: rtl" >
                                <asp:Label ID="Label9" runat="server" Font-Bold="True" ForeColor="black">البريد الكتروني * :</asp:Label>
                            </td>
                        </tr>
                                       <tr>
                                           <td class="style8" style="direction: rtl">
                               <dx:ASPxLabel ID="msgNotifyASPxLabel1" runat="server" ClientInstanceName="msgNotifyASPxLabel" style="font-weight: 700; color: #008000;" Text="كلمة مرور الدخول على موقعنا">
                                </dx:ASPxLabel>
                                           </td>
                                           <td class="style8" style="direction: rtl">
                                               <dx:ASPxTextBox ID="passwordASPxTextBox" runat="server" ClientIDMode="AutoID" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" MaxLength="15" SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Width="200px">
                                                   <ValidationSettings ErrorText="" SetFocusOnError="True" ValidationGroup="contactUsVG">
                                                       <ErrorFrameStyle ImageSpacing="4px">
                                                           <ErrorTextPaddings PaddingLeft="4px" />
                                                       </ErrorFrameStyle>

                                                       <RequiredField ErrorText="" IsRequired="True" />
                                                   </ValidationSettings>
                                               </dx:ASPxTextBox>
                                           </td>
                                           <td style="direction: rtl">
                                               <asp:Label ID="Label10" runat="server" Font-Bold="True" ForeColor="Black">كلمة المرور * :</asp:Label>
                                           </td>
                                       </tr>
                                       <tr>
                                           <td class="style8" style="direction: rtl">
                                               &nbsp;</td>
                                           <td class="style8" colspan="2" style="direction: rtl">
                                               <p style="text-align: right">
                                                   (*) بيانات مطلوبة</p>
                                           </td>
                                       </tr>
                                </table>
                                
                                </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxButton ID="sendASPxButton" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" meta:resourceKey="saveASPxButtonResource1" OnClick="yesDeleteASPxButton_Click" Text="تسجيل" Theme="Glass" ValidationContainerID="idASPxTextBox" Width="100px" Font-Bold="True" ValidationGroup="VG">
                                    <ClientSideEvents Click="function(s, e) {
	deleteMsgASPxPopupControl.Hide();
}" />
                                </dx:ASPxButton>
                                <dx:ASPxButton ID="RBtnClear" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" Font-Bold="True" meta:resourceKey="saveASPxButtonResource1" OnClick="RBtnClear_Click" Text="مسح" Theme="Glass" Width="100px">
                                    <ClientSideEvents Click="function(s, e) {
	deleteMsgASPxPopupControl.Hide();
}" />
                                </dx:ASPxButton>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%--<telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanelEdit" runat="server">
                                </telerik:RadAjaxLoadingPanel>--%>
                                <asp:AccessDataSource ID="DSCdCity" runat="server" DataFile="~/App_Data/AriscFriend.mdb" SelectCommand="SELECT * FROM [CdCity]"></asp:AccessDataSource>
                            </td>
                        </tr>
                    </table>
</center>
<%--    
                    </dx:PopupControlContentControl>

</ContentCollection>
                <CloseButtonImage Height="16px" Width="17px" />
            </dx:ASPxPopupControl>--%>
            





            <dx:ASPxPopupControl ID="readMsgASPxPopupControl" runat="server" 
                
                 CloseAction="CloseButton" 
                Modal="True" PopupElementID="deleteASPxButton" 
                ClientInstanceName="deleteMsgASPxPopupControl" 
                HeaderText="الخطوة التالية" Theme="Glass" RightToLeft="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Font-Bold="True">
                <ContentStyle VerticalAlign="Top">
                </ContentStyle>
                <SizeGripImage Height="12px" Width="12px" />
                <ContentCollection>
<dx:PopupControlContentControl ID="PopupControlContentControl3" runat="server">

    <center>
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="msgLabel" runat="server" Font-Bold="True" ForeColor="#996633"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxButton ID="RBtnOk" runat="server" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" Font-Bold="True" meta:resourceKey="saveASPxButtonResource1" OnClick="RBtnOk_Click" Text="تم" Theme="Glass" Width="100px">
                                    <ClientSideEvents Click="function(s, e) {
	deleteMsgASPxPopupControl.Hide();
}" />
                                </dx:ASPxButton>
                            </td>
                        </tr>
                    </table>
</center>
    
                    </dx:PopupControlContentControl>

</ContentCollection>
                <CloseButtonImage Height="16px" Width="17px" />
            </dx:ASPxPopupControl>
            







            







            







            





