<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CPViewCourseUserControl.ascx.cs" Inherits="CPViewCourseUserControl" %>


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
       <table dir="ltr" >
                                       <tr>
                            <td style="direction: rtl" class="style8">
                                &nbsp;</td>
                            <td style="direction: rtl" class="style8" >
                                 <dx:ASPxTextBox ID="idASPxTextBox" runat="server" Width="200px" 
                ClientIDMode="AutoID" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                CssPostfix="PlasticBlue" MaxLength="500" 
                SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Theme="Glass" >
                                     <ValidationSettings ErrorText="مطلوب" SetFocusOnError="True" ValidationGroup="VG">
                                         <RequiredField ErrorText="" IsRequired="True" />
                                     </ValidationSettings>

            </dx:ASPxTextBox>

                                           </td>
                            <td style="direction: rtl" >
                                <asp:Label ID="Label5" runat="server" Text="رقم الدورة * :" 
                                    Font-Bold="True" ForeColor="Black"></asp:Label>
                            </td>
                        </tr>
                                       <tr>
                            <td style="direction: rtl" class="style8">
                               <dx:ASPxLabel ID="msgNotifyASPxLabel1" runat="server" ClientInstanceName="msgNotifyASPxLabel" style="font-weight: 700; color:red;" Text="يتم نشر المقالة بعد موافقة الإدارة" Visible="False">
                                </dx:ASPxLabel>
                                           </td>
                            <td style="direction: rtl" class="style8" >
                                 <dx:ASPxTextBox ID="titleASPxTextBox" runat="server" Width="200px" 
                ClientIDMode="AutoID" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                CssPostfix="PlasticBlue" MaxLength="500" 
                SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Theme="Glass" >
                                     <ValidationSettings ErrorText="مطلوب" SetFocusOnError="True" ValidationGroup="VG">
                                         <RequiredField ErrorText="" IsRequired="True" />
                                     </ValidationSettings>

            </dx:ASPxTextBox>

                                           </td>
                            <td style="direction: rtl" >
                                <asp:Label ID="Label1" runat="server" Text="إسم الدورة * :" 
                                    Font-Bold="True" ForeColor="Black"></asp:Label>
                            </td>
                        </tr>
                                       <tr>
                            <td style="direction: rtl" class="style8">
                                &nbsp;</td>
                            <td style="direction: rtl" class="style8" >
                                 <dx:ASPxDateEdit ID="startASPxDateEdit" runat="server" Theme="Glass">
                                     <ValidationSettings ErrorText="مطلوب" ValidationGroup="VG">
                                         <RequiredField ErrorText="" IsRequired="True" />
                                     </ValidationSettings>
                                 </dx:ASPxDateEdit>
                                           </td>
                            <td style="direction: rtl" >
                                <asp:Label ID="Label3" runat="server" Text="تاريخ بداية الدورة : *" 
                                    Font-Bold="True" ForeColor="Black"></asp:Label>
                            </td>
                        </tr>
                                       <tr>
                            <td style="direction: rtl" class="style8">
                                &nbsp;</td>
                            <td style="direction: rtl" class="style8" >
                                 <dx:ASPxDateEdit ID="endASPxDateEdit" runat="server" Theme="Glass">
                                     <ValidationSettings ErrorText="مطلوب" ValidationGroup="VG">
                                         <RequiredField ErrorText="" IsRequired="True" />
                                     </ValidationSettings>
                                 </dx:ASPxDateEdit>
                                           </td>
                            <td style="direction: rtl" >
                                <asp:Label ID="Label4" runat="server" Text="تاريخ نهاية الدورة : *" 
                                    Font-Bold="True" ForeColor="Black"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="direction: rtl" class="style8" colspan="2">
                                               <dx:ASPxCheckBox ID="displayASPxCheckBox" runat="server" Theme="Glass">
                                                   <ValidationSettings ErrorText="مطلوب" ValidationGroup="VG">
                                                   </ValidationSettings>
                                               </dx:ASPxCheckBox>
                            </td>
                            <td style="direction: rtl" >
                                <asp:Label ID="Label2" runat="server" Text="هل تعرض؟ * :" 
                                    Font-Bold="True" ForeColor="Black"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="direction: rtl" class="style8" colspan="2">
<dx:ASPxUploadControl ID="imageASPxUploadControl" runat="server" ClientInstanceName="imageASPxUploadControl" EnableTheming="True" FileUploadMode="OnPageLoad" Theme="Glass" Width="280px">
    <ValidationSettings AllowedFileExtensions=".jpg, .jpeg, .gif, .bmp, .png" MaxFileSize="100000" MaxFileSizeErrorText="حجم الملف يزيد عن المسموح" NotAllowedFileExtensionErrorText="نوع الملف غير مسموح">
    </ValidationSettings>
    <ClientSideEvents FileUploadComplete="function(s, e) {
	msgUploadASPxLabel.SetText('Uploaded Succesfully');     
}" />
</dx:ASPxUploadControl>
<dx:ASPxLabel ID="msgUploadASPxLabel" runat="server" ClientInstanceName="msgUploadASPxLabel" style="font-weight: 700; color: #008000;">
</dx:ASPxLabel>

                            </td>
                            <td style="direction: rtl" >
                                <asp:Label ID="Label6" runat="server" Text="صورة : " 
                                    Font-Bold="True" ForeColor="Black"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="direction: rtl" class="style8" colspan="3">
                                <dx:ASPxButton ID="saveAddASPxButton" runat="server" Text="حفظ" Theme="Glass" Font-Bold="True" OnClick="saveAddASPxButton_Click" ValidationGroup="VG">
                                </dx:ASPxButton>
                                <dx:ASPxButton ID="cleanASPxButton" runat="server" Text="مسح" Theme="Glass" Font-Bold="True" OnClick="cleanASPxButton_Click" ValidationGroup="VG">
                                </dx:ASPxButton>
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
<p style="text-align: right">
    &nbsp;</p>
                               <dx:ASPxLabel ID="msgASPxLabel" runat="server" ClientInstanceName="msgASPxLabel" Font-Bold="True">
                                </dx:ASPxLabel>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" ClientInstanceName="ASPxGridView1" CssFilePath="~/App_Themes/Office2010Black/{0}/styles.css" CssPostfix="Office2010Black" DataSourceID="coursesSqlDataSource" EnableTheming="True" KeyFieldName="CourseId" Theme="Youthful" Font-Bold="True">
            <ClientSideEvents EndCallback="function(s, e) {

}" RowClick="function(s, e) {

}" />

          
            <Columns>
                <dx:GridViewDataButtonEditColumn Caption="تسجيل" VisibleIndex="27" Name="Replay" Visible="False">
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
                <dx:GridViewDataTextColumn Caption="بداية الدورة" FieldName="StartDate" ToolTip="بداية الدورة" VisibleIndex="17">
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
                <dx:GridViewDataTextColumn FieldName="EndDate" VisibleIndex="2" Caption="نهاية الدورة">
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
                <dx:GridViewDataMemoColumn Caption="الرد" VisibleIndex="25" Visible="False">
                    <PropertiesMemoEdit>
                        <Style HorizontalAlign="Center">
                        </Style>
                    </PropertiesMemoEdit>
                    <HeaderStyle HorizontalAlign="Center" />
                </dx:GridViewDataMemoColumn>
                <dx:GridViewDataCheckColumn Caption="هل تعرض" FieldName="IsDisplay" VisibleIndex="21">
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataButtonEditColumn Caption="تقرير" Name="report" VisibleIndex="24">
                    <DataItemTemplate>
                        <dx:ASPxButton ID="readASPxButton2" runat="server" OnClick="readASPxButton2_Click" Text="التقرير" Theme="iOS">
                        </dx:ASPxButton>
                        <asp:HiddenField ID="msgIDHiddenField2" runat="server" Value='<%# Eval("CourseId") %>' />
                    </DataItemTemplate>
                    <EditItemTemplate>
                        <asp:HiddenField ID="msgIDHiddenField2" runat="server" Value='<%# Eval("CourseId") %>' />
                    </EditItemTemplate>
                </dx:GridViewDataButtonEditColumn>
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





            
            







            







            







            





