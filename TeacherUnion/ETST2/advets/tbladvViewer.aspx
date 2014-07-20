<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="tbladvViewer.aspx.cs" Inherits="tbladvViewer" %>

<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx1" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHiddenField" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1
        {
            width: 504px;
        }
        .auto-style2
        {
            text-align: right;
        }
        
    </style>
    <script>
    function OnGetRowValues(values) {
        advdate.SetText(new Date(Date.parse(values[0])).toLocaleDateString());
	    IdType.SetText(values[1]);
        placce.SetText(values[2]);
	    remmarks.SetText(values[3]);
	    number.SetText(values[4]);
	    egabeat.SetText(values[5]);
	    salbeat.SetText(values[6]);
	    sugeest.SetText(values[7]);
	    resmobile.SetText(values[8]);
	    adminrem.SetText(values[9]);
	    adminlike.SetChecked(values[10]);
	    HFIdCS.Set("Id", values[11]);
        }
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">


    <table align="center">
        <tr>
            <td dir="ltr">
                <dx:ASPxComboBox ID="CBExporter" runat="server"
                    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue"
                    OnButtonClick="CBExporter_ButtonClick"
                    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                    <Items>
                        <dx:ListEditItem Text="Rtf" Value="Rtf" />
                        <dx:ListEditItem Text="Pdf" Value="Pdf" />
                        <dx:ListEditItem Text="Xls" Value="Xls" />
                        <dx:ListEditItem Text="Xlsx" Value="Xlsx" />
                        <dx:ListEditItem Text="Csv" Value="Csv" />
                    </Items>
                    <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
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
            <td style="direction: ltr">
                <dx:ASPxGridView ID="GVEditor" runat="server" AutoGenerateColumns="False"
                    Caption="البيــــــــــا نـــــــــــــــات" DataSourceID="DSData"
                    KeyFieldName="Id" RightToLeft="True"
                    SummaryText="الملخص" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"
                    CssPostfix="PlasticBlue" EnableTheming="True"
                    OnRowDeleted="GVEditor_RowDeleted" OnRowUpdated="GVEditor_RowUpdated"
                    OnRowInserted="GVEditor_RowInserted" Font-Bold="True" ClientInstanceName="gridv">
                    <ClientSideEvents CustomButtonClick="function(s, e) {
	  if (e.buttonID != 'ViewBtn') return;  
      popupDetails.Show();
}" />
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="الفرعية" FieldName="Syndicate"
                            VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="نوع الفعالية" FieldName="IdType"
                            VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="الصفة" FieldName="placce"
                            VisibleIndex="4" Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewCommandColumn ButtonType="Image" Caption="التفاصيل" VisibleIndex="0">
                            <EditButton>
                                <Image Url="../images/edit.png">
                                </Image>
                            </EditButton>
                            <ClearFilterButton Visible="True">
                            </ClearFilterButton>
                            <CustomButtons>
                                <dx:GridViewCommandColumnCustomButton ID="ViewBtn">
                                    <Image Url="../images/edit.png">
                                    </Image>
                                </dx:GridViewCommandColumnCustomButton>
                            </CustomButtons>
                        </dx:GridViewCommandColumn>
                        <dx:GridViewDataDateColumn Caption="تاريخ الفعالية" FieldName="advdate" VisibleIndex="1">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn Caption="عدد الحضور" FieldName="number" VisibleIndex="5" Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="موبيل (موبيلات) المشاركين" FieldName="resmobile" VisibleIndex="6" Visible="False">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataMemoColumn Caption="ملخص ما تم" FieldName="remmarks" Visible="False" VisibleIndex="7">
                        </dx:GridViewDataMemoColumn>
                        <dx:GridViewDataMemoColumn Caption="الايجابيات" FieldName="egabeat" Visible="False" VisibleIndex="9">
                            <EditFormSettings ColumnSpan="2" RowSpan="2" />
                        </dx:GridViewDataMemoColumn>
                        <dx:GridViewDataMemoColumn Caption="السلبيات" FieldName="salbeat" Visible="False" VisibleIndex="11">
                            <EditFormSettings ColumnSpan="2" RowSpan="2" />
                        </dx:GridViewDataMemoColumn>
                        <dx:GridViewDataMemoColumn Caption="المقترحات" FieldName="sugeest" Visible="False" VisibleIndex="13">
                            <EditFormSettings ColumnSpan="2" RowSpan="2" />
                        </dx:GridViewDataMemoColumn>
                        <dx:GridViewDataCheckColumn Caption="اعجاب" FieldName="adminlike" VisibleIndex="15">
                        </dx:GridViewDataCheckColumn>
                        <dx:GridViewDataMemoColumn Caption="ملاحظات الادارة" FieldName="adminrem" VisibleIndex="17">
                            <EditFormSettings ColumnSpan="2" RowSpan="2" />
                        </dx:GridViewDataMemoColumn>
                        <dx:GridViewDataImageColumn Caption="صوره" FieldName="attachpath" VisibleIndex="19">
                            <PropertiesImage ImageUrlFormatString="../Assets/advetsImages/{0}">
                            </PropertiesImage>
                        </dx:GridViewDataImageColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True"
                        SortMode="DisplayText" ColumnResizeMode="Control" />
                    <SettingsPager ShowDefaultImages="False">
                        <AllButton Text="All">
                        </AllButton>
                        <NextPageButton Text="Next &gt;">
                        </NextPageButton>
                        <PrevPageButton Text="&lt; Prev">
                        </PrevPageButton>
                        <Summary AllPagesText="صفحات :  {0} - {1} ({2} عناصر)" Position="Right"
                            Text="صفحه {0} of {1} ({2} عنصر)" />
                    </SettingsPager>
                    <SettingsEditing Mode="PopupEditForm" />
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
                    <SettingsLoadingPanel Text="جاري التحميل&amp;hellip;" />
                    <SettingsPopup>
                        <EditForm AllowResize="True" Modal="True" />
                    </SettingsPopup>
                    <Images SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css">
                        <LoadingPanelOnStatusBar Url="~/App_Themes/PlasticBlue/GridView/gvLoadingOnStatusBar.gif">
                        </LoadingPanelOnStatusBar>
                        <LoadingPanel Url="~/App_Themes/PlasticBlue/GridView/Loading.gif">
                        </LoadingPanel>
                    </Images>
                    <ImagesFilterControl>
                        <LoadingPanel Url="~/App_Themes/PlasticBlue/Editors/Loading.gif">
                        </LoadingPanel>
                    </ImagesFilterControl>
                    <Styles CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css"
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
                <dx:ASPxGridViewExporter ID="ASPxGridViewExporterEditor" runat="server"
                    FileName="ContactUSFX" GridViewID="GVEditor" PaperKind="A4">
                </dx:ASPxGridViewExporter>
                <asp:AccessDataSource ID="DSData" runat="server"
                    DataFile="~/App_Data/advets.mdb"
                    SelectCommand="SELECT tbladv.Id, tbladv.advdate, tbladv.SyndicateId, tbladv.IdTypeId, tbladv.placce, tbladv.remmarks, tbladv.[number], tbladv.egabeat, tbladv.salbeat, tbladv.sugeest, tbladv.resmobile, tbladv.datein, tbladv.userin, CDSyndicate.Syndicate, CDIdType.IdType, Users.Uname, tbladv.adminlike, tbladv.adminrem, tbladv.attachpath FROM (((tbladv INNER JOIN CDIdType ON tbladv.IdTypeId = CDIdType.IdTypeId) INNER JOIN CDSyndicate ON tbladv.SyndicateId = CDSyndicate.SyndicateId) LEFT OUTER JOIN Users ON tbladv.userin = Users.UserID)" OnSelecting="DSData_Selecting"></asp:AccessDataSource>
            </td>
        </tr>
    </table>

    <dx:ASPxPopupControl ID="ASPxPopupControlEditor" runat="server"
        AllowDragging="True" ClientInstanceName="popupDetails"
        CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue"
        HeaderText="التفاصيل"
        Modal="True" PopupHorizontalAlign="WindowCenter"
        PopupVerticalAlign="WindowCenter" RightToLeft="True"
        SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Height="500px"
        Width="560px" Style="text-align: center"
        Font-Bold="False" ScrollBars="Auto">
        <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Web/dvLoading.gif">
        </LoadingPanelImage>
        <ClientSideEvents PopUp="function(s, e) {
	gridv.GetRowValues(gridv.GetFocusedRowIndex(), 'advdate;IdType;placce;remmarks;number;egabeat;salbeat;sugeest;resmobile;adminrem;adminlike;Id', OnGetRowValues);
}
" />
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

            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">
                <table align="center" class="auto-style1" dir="rtl">
                    <tr>
                        <td class="auto-style2">
                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Size="12pt" Text="تاريخ الفعالية">
                            </dx:ASPxLabel>
                        </td>
                        <td class="auto-style2">
                            <dx:ASPxTextBox ID="tbadvdate" runat="server" ClientInstanceName="advdate" Font-Size="12pt" TabIndex="2" Theme="PlasticBlue" Width="250px" ReadOnly="True">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Size="12pt" Text="نوع الفعالية">
                            </dx:ASPxLabel>
                        </td>
                        <td>
                            <dx:ASPxTextBox ID="tbIdType" runat="server" ClientInstanceName="IdType" Font-Size="12pt" TabIndex="2" Theme="PlasticBlue" Width="250px" ReadOnly="True">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Size="12pt" Text="المكان">
                            </dx:ASPxLabel>
                        </td>
                        <td>
                            <dx:ASPxTextBox ID="tbplacce" runat="server" Font-Size="12pt" TabIndex="2" Width="250px" Theme="PlasticBlue" ClientInstanceName="placce" ReadOnly="True">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" class="auto-style2">
                            <dx:ASPxLabel ID="ASPxLabel4" runat="server" Font-Size="12pt" Text="ملخص ما تم">
                            </dx:ASPxLabel>
                        </td>
                        <td>
                            <dx:ASPxMemo ID="tbremmarks" runat="server" Font-Size="12pt" Height="80px" TabIndex="3" Width="250px" Theme="PlasticBlue" ClientInstanceName="remmarks" ReadOnly="True">
                            </dx:ASPxMemo>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <dx:ASPxLabel ID="ASPxLabel5" runat="server" Font-Size="12pt" Text="عدد الحضور">
                            </dx:ASPxLabel>
                        </td>
                        <td>
                            <dx:ASPxTextBox ID="tbnumber" runat="server" Font-Size="12pt" TabIndex="4" Width="250px" Theme="PlasticBlue" ClientInstanceName="number" ReadOnly="True">
                                <MaskSettings Mask="&lt;1..1000&gt;" />
                                <ValidationSettings ValidationGroup="gv">
                                    <RequiredField ErrorText="يجب ادخال عدد الحضور" IsRequired="True" />
                                </ValidationSettings>
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" class="auto-style2">
                            <dx:ASPxLabel ID="ASPxLabel6" runat="server" Font-Size="12pt" Text="الايجابيات">
                            </dx:ASPxLabel>
                        </td>
                        <td>
                            <dx:ASPxMemo ID="tbegabeat" runat="server" Font-Size="12pt" Height="80px" TabIndex="5" Width="250px" Theme="PlasticBlue" ClientInstanceName="egabeat" ReadOnly="True">
                            </dx:ASPxMemo>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" class="auto-style2">
                            <dx:ASPxLabel ID="ASPxLabel7" runat="server" Font-Size="12pt" Text="السلبيات">
                            </dx:ASPxLabel>
                        </td>
                        <td>
                            <dx:ASPxMemo ID="tbsalbeat" runat="server" Font-Size="12pt" Height="80px" TabIndex="6" Width="250px" Theme="PlasticBlue" ClientInstanceName="salbeat" ReadOnly="True">
                            </dx:ASPxMemo>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" class="auto-style2">
                            <dx:ASPxLabel ID="ASPxLabel8" runat="server" Font-Size="12pt" Text="المقترحات">
                            </dx:ASPxLabel>
                        </td>
                        <td>
                            <dx:ASPxMemo ID="tbsugeest" runat="server" Font-Size="12pt" Height="80px" TabIndex="7" Width="250px" Theme="PlasticBlue" ClientInstanceName="sugeest" ReadOnly="True">
                            </dx:ASPxMemo>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <dx:ASPxLabel ID="ASPxLabel9" runat="server" Font-Size="12pt" Text="موبيل (موبيلات) المشاركين">
                            </dx:ASPxLabel>
                        </td>
                        <td>
                            <dx:ASPxTextBox ID="tbresmobile" runat="server" Font-Size="12pt" TabIndex="8" Width="250px" Theme="PlasticBlue" ClientInstanceName="resmobile" ReadOnly="True">
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2" style="border: thin solid #FF0000;" valign="top">
                            <dx:ASPxLabel ID="ASPxLabel10" runat="server" Font-Size="12pt" Text="ملاحظات الادارة">
                            </dx:ASPxLabel>
                        </td>
                        <td style="border: thin solid #FF0000;">
                            <dx:ASPxMemo ID="tbadminrem" runat="server" ClientInstanceName="adminrem" Font-Size="12pt" Height="80px" ReadOnly="True" TabIndex="7" Theme="PlasticBlue" Width="250px">
                            </dx:ASPxMemo>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2" style="border: thin solid #FF0000;">
                            <dx:ASPxLabel ID="ASPxLabel11" runat="server" Font-Size="12pt" Text="اعجاب">
                            </dx:ASPxLabel>
                        </td>
                        <td style="border: thin solid #FF0000; text-align: right;">
                            <dx:ASPxCheckBox ID="cbadminlike" runat="server" CheckState="Unchecked" ClientInstanceName="adminlike" ReadOnly="True">
                            </dx:ASPxCheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2" style="border: thin solid #FF0000;">
                            <dx:ASPxHiddenField ID="HFId" runat="server" ClientInstanceName="HFIdCS">
                            </dx:ASPxHiddenField>
                        </td>
                        <td style="border: thin solid #FF0000; text-align: right;">
                            <dx:ASPxButton ID="btnSave" runat="server" Font-Size="12pt" OnClick="btnSave_Click" TabIndex="9" Text="حفظ" Theme="PlasticBlue" Visible="False" Width="200px">
                            </dx:ASPxButton>
                        </td>
                    </tr>
                </table>
            </dx:PopupControlContentControl>

        </ContentCollection>
    </dx:ASPxPopupControl>




</asp:Content>

