<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DgreeEditor.ascx.cs" Inherits="DgreeEditor" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>


<table align="center">
    <tr>
        <td dir="ltr">
            <dx:ASPxComboBox ID="CBExporter" runat="server"
                CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx"
                onbuttonclick="CBExporter_ButtonClick" Spacing="0"
                SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css">
                <items>
                    <dx:ListEditItem Text="Rtf" Value="Rtf" />
                    <dx:ListEditItem Text="Pdf" Value="Pdf" />
                    <dx:ListEditItem Text="Xls" Value="Xls" />
                    <dx:ListEditItem Text="Xlsx" Value="Xlsx" />
                    <dx:ListEditItem Text="Csv" Value="Csv" />
                </items>
                <loadingpanelimage url="../App_Themes/DevEx/Editors/Loading.gif">
                </loadingpanelimage>
                <loadingpanelstyle imagespacing="5px">
                </loadingpanelstyle>
                <dropdownbutton position="Left">
                </dropdownbutton>
                <buttons>
                    <dx:EditButton Text="تصدير" Width="50px">
                    </dx:EditButton>
                </buttons>
                <buttonstyle width="13px">
                </buttonstyle>
            </dx:ASPxComboBox>
        </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxGridView ID="GVEditor" runat="server" AutoGenerateColumns="False" DataSourceID="DSData" RightToLeft="True" ClientInstanceName="grid"
                OnCustomCallback="GVEditor_CustomCallback"
                SummaryText="الملخص" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                CssPostfix="DevEx" EnableTheming="True" Width="850px"
                onrowdeleted="GVEditor_RowDeleted" onrowupdated="GVEditor_RowUpdated"
                onrowupdating="GVEditor_RowUpdating" KeyboardSupport="True" KeyFieldName="tarteeb">
                <clientsideevents endcallback="function(s, e) {
	
	  if(typeof(s.cpShowPopup) != 'undefined')
		{
                popupeditor.SetContentHTML(s.cpShowPopup);
				popupeditor.Show();
		} 
}"
                    begincallback="function(s, e) {
s.cpShowPopup = undefined;
}" />
                <totalsummary>
                    <dx:ASPxSummaryItem DisplayFormat="العـدد : {0}" FieldName="addno" 
                        ShowInColumn="coname" ShowInGroupFooterColumn="coname" SummaryType="Count" />
                </totalsummary>
                <columns>
                    <dx:GridViewCommandColumn VisibleIndex="0">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="tarteeb" VisibleIndex="1" Caption="ترتيب" SortIndex="0" SortOrder="Ascending" Visible="False">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="monthid" VisibleIndex="2" Caption="شهر"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="studentid" VisibleIndex="3" Caption="رقم الطالب"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="stuname" VisibleIndex="4" Caption="الاسم">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="degree" VisibleIndex="5" Caption="الدرجة">
                        <DataItemTemplate>
                            <dx:ASPxTextBox ID="txtDgree" Width="100%" runat="server" Value='<%# Bind("degree") %>'>
                            </dx:ASPxTextBox>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="datein"
                        VisibleIndex="6" Caption="تاريخ الادخال">
                    </dx:GridViewDataDateColumn></columns>
                <settingsbehavior allowfocusedrow="True" confirmdelete="True"
                    sortmode="DisplayText" columnresizemode="Control" AllowGroup="False" />
                <settingspager Mode="ShowAllRecords">
                    <Summary AllPagesText="صفحات :  {0} - {1} ({2} عناصر)" Position="Right" 
                        Text="صفحه {0} of {1} ({2} عنصر)" />
                </settingspager>
                <settingsediting mode="Inline" />
                <settings showfilterbar="Visible" showfilterrow="True" showfilterrowmenu="True"
                    showfooter="True" showheaderfilterbutton="True" />
                <settingstext commandcancel="الغاء" commandclearfilter="مسح التصفيه"
                    commanddelete="حذف" commandedit="تعديل" commandnew="جديد" commandselect="اختار"
                    commandupdate="تحديث" confirmdelete="هل انت متأكد؟"
                    customizationwindowcaption="خيارات" emptydatarow="فارغ" emptyheaders="راس فارغ"
                    filterbarclear="مسح التصفبه" filterbarcreatefilter="صناعة تصفيه"
                    filtercontrolpopupcaption="خيارات التصفيه"
                    groupcontinuedonnextpage="تستكمل المجموعه في الصفحه القادمه"
                    grouppanel="اسحب عمود ثم افلته هنا لصناعه مجموعه"
                    headerfiltershowall="اظهار الكل" headerfiltershowblanks="اظهار الفارغ"
                    headerfiltershownonblanks="اظهار غير الفارغ"
                    popupeditformcaption="صفحة المحرر" />
                <settingscookies enabled="True" />
                <images spritecssfilepath="../App_Themes/DevEx/{0}/sprite.css">
                    <LoadingPanelOnStatusBar Url="../App_Themes/DevEx/GridView/StatusBarLoading.gif">
                    </LoadingPanelOnStatusBar>
                    <LoadingPanel Url="../App_Themes/DevEx/GridView/Loading.gif">
                    </LoadingPanel>
                </images>
                <imagesfiltercontrol>
                    <LoadingPanel Url="../App_Themes/DevEx/GridView/Loading.gif">
                    </LoadingPanel>
                </imagesfiltercontrol>
                <styles cssfilepath="../App_Themes/DevEx/{0}/styles.css" csspostfix="DevEx">
                    <Header ImageSpacing="5px" SortingImageSpacing="5px" Font-Bold="False" 
                        Font-Size="Medium" HorizontalAlign="Center">
                    </Header>
                    <Cell HorizontalAlign="Center">
                    </Cell>
                    <LoadingPanel ImageSpacing="5px">
                    </LoadingPanel>
                    <EditFormTable>
                        <Border BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                    </EditFormTable>
                    <EditFormColumnCaption BackColor="Gray" ForeColor="White">
                        <Border BorderColor="White" BorderStyle="Solid" BorderWidth="10px" />
                    </EditFormColumnCaption>
                </styles>
                <stylespager>
                    <CurrentPageNumber Font-Bold="False">
                    </CurrentPageNumber>
                    <PageNumber Font-Bold="False">
                    </PageNumber>
                </stylespager>
                <styleseditors buttoneditcellspacing="0">
                    <ProgressBar Height="21px">
                    </ProgressBar>
                </styleseditors>
            </dx:ASPxGridView>
            <dx:ASPxGridViewExporter ID="ASPxGridViewExporterEditor" runat="server" FileName="Data" GridViewID="GVEditor" PaperKind="A4"></dx:ASPxGridViewExporter>
            <asp:AccessDataSource ID="DSData" runat="server" DataFile="../App_Data/datarsd.mdb"
                SelectCommand="SELECT tarteeb, monthid, studentid, stuname, degree, datein, subjectid FROM tbldegree1 WHERE (faslid = ?) AND (safid = ?) AND (subjectid = ?) ORDER BY tarteeb" 
                UpdateCommand="UPDATE tbldegree1 SET degree = ?, datein = Now() WHERE (tarteeb = ?)">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="0" Name="faslid" QueryStringField="fasl" Type="Int16" />
                    <asp:QueryStringParameter DefaultValue="0" Name="safid" QueryStringField="saf" Type="Byte" />
                    <asp:QueryStringParameter DefaultValue="0" Name="subjectid" QueryStringField="sub" Type="Byte" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="dgree" />
                    <asp:Parameter Name="tarteeb" />
                </UpdateParameters>
            </asp:AccessDataSource>

        </td>
        <tr>
            <td>
                <dx:ASPxButton ID="btnSave" runat="server" Text="حفـــظ" AutoPostBack="false" OnClick="btnSave_Click">
                    <ClientSideEvents Click="function(s, e) {
	grid.PerformCallback('post');
}" />
                </dx:ASPxButton>
            </td>
        </tr>
    </tr>
    </table>

<dx:ASPxPopupControl ID="ASPxPopupControlEditor" runat="server"
    AllowDragging="True" ClientInstanceName="popupeditor"
    CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx"
    HeaderText="رسالـــه" MinHeight="80px" MinWidth="200px"
    Modal="True" PopupHorizontalAlign="WindowCenter"
    PopupVerticalAlign="WindowCenter" RightToLeft="True"
    SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" Height="120px"
    Width="300px" style="text-align: center"
    Font-Bold="False">
    <loadingpanelimage url="../App_Themes/DevEx/Web/Loading.gif">
    </loadingpanelimage>
    <contentstyle font-bold="True" font-size="Medium" font-underline="False"
        horizontalalign="Center" verticalalign="Middle">
        <Border BorderStyle="Solid" BorderWidth="10px" />
    </contentstyle>
    <headerstyle>
    <Paddings PaddingLeft="7px" />
    </headerstyle>
    <loadingpanelstyle imagespacing="5px">
    </loadingpanelstyle>
    <modalbackgroundstyle backcolor="Gray">
    </modalbackgroundstyle>
    <contentcollection>

<dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">تم 
    التحميل</dx:PopupControlContentControl>

</contentcollection>
</dx:ASPxPopupControl>



