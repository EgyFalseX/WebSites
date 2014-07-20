<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DailyEyabViewer.ascx.cs"
    Inherits="DailyEyabViewer" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGridView.v11.2.Export, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<table align="center">
    <tr>
        <td dir="ltr" style="text-align: right; direction: rtl">
            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="اختار تاريخ : ">
            </dx:ASPxLabel>
            <dx:ASPxDateEdit ID="DEdate" runat="server" AutoPostBack="True" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                CssPostfix="DevEx" DisplayFormatString="d/M/yyyy" EditFormat="Custom" Spacing="0"
                SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" Style="direction: rtl">
                <CalendarProperties>
                    <HeaderStyle Spacing="1px" />
                </CalendarProperties>
                <ButtonStyle Width="13px">
                </ButtonStyle>
            </dx:ASPxDateEdit>
        </td>
    </tr>
    <tr>
        <td dir="ltr">
            &nbsp;
        </td>
    </tr>
    <tr>
        <td dir="ltr">
            <dx:ASPxComboBox ID="CBExporter" runat="server" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                CssPostfix="DevEx" OnButtonClick="CBExporter_ButtonClick" Spacing="0" SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css">
                <Items>
                    <dx:ListEditItem Text="Rtf" Value="Rtf" />
                    <dx:ListEditItem Text="Pdf" Value="Pdf" />
                    <dx:ListEditItem Text="Xls" Value="Xls" />
                    <dx:ListEditItem Text="Xlsx" Value="Xlsx" />
                    <dx:ListEditItem Text="Csv" Value="Csv" />
                </Items>
                <LoadingPanelImage Url="../App_Themes/DevEx/Editors/Loading.gif">
                </LoadingPanelImage>
                <LoadingPanelStyle ImageSpacing="5px">
                </LoadingPanelStyle>
                <DropDownButton Position="Left">
                </DropDownButton>
                <Buttons>
                    <dx:EditButton Text="تصدير" Width="50px">
                    </dx:EditButton>
                </Buttons>
                <ButtonStyle Width="13px">
                </ButtonStyle>
            </dx:ASPxComboBox>
        </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxGridView ID="GVEditor" runat="server" AutoGenerateColumns="False" Caption="الغيـــــــــــاب اليومي"
                KeyFieldName="alsofof_code" RightToLeft="True" SummaryText="الملخص" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
                CssPostfix="DevEx" EnableTheming="True" Width="700px" 
                DataSourceID="DSData" 
                OnCustomUnboundColumnData="GVEditor_CustomUnboundColumnData">
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
                    <dx:ASPxSummaryItem DisplayFormat="العـدد : {0}" FieldName="calcall" ShowInColumn="العــدد"
                        ShowInGroupFooterColumn="العــدد" SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="العـدد : {0}" FieldName="clacout" 
                        ShowInColumn="الغائبين" ShowInGroupFooterColumn="الغائبين" 
                        SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="العـدد : {0}" FieldName="clacout" 
                        ShowInColumn="الحاضرين" ShowInGroupFooterColumn="الحاضرين" 
                        SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="العـدد : {0}" FieldName="clacper" 
                        ShowInColumn="نسبة الغياب" ShowInGroupFooterColumn="نسبة الغياب" 
                        SummaryType="Average" />
                </TotalSummary>
                <GroupSummary>
                    <dx:ASPxSummaryItem DisplayFormat="العـدد : {0}" FieldName="calcall" ShowInColumn="العــدد"
                        ShowInGroupFooterColumn="العــدد" SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="العـدد : {0}" FieldName="clacout" ShowInColumn="الغائبين"
                        ShowInGroupFooterColumn="الغائبين" SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="العـدد : {0}" FieldName="clacin" 
                        ShowInColumn="الحاضرين" ShowInGroupFooterColumn="الحاضرين" 
                        SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="العـدد : {0}" FieldName="clacper" 
                        ShowInColumn="نسبة الغياب" ShowInGroupFooterColumn="نسبة الغياب" 
                        SummaryType="Average" />
                </GroupSummary>
                <Columns>
                    <dx:GridViewDataComboBoxColumn Caption="الصف" FieldName="alsofof_code" VisibleIndex="1">
                        <PropertiesComboBox DataSourceID="DSsaf" TextField="alsofof_name" ValueField="alsofof_code"
                            ValueType="System.Int32">
                        </PropertiesComboBox>
                        <GroupFooterCellStyle ForeColor="Red" HorizontalAlign="Center">
                        </GroupFooterCellStyle>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="الفصل" FieldName="fasl_code" VisibleIndex="2">
                        <PropertiesComboBox DataSourceID="DSfasl" TextField="fasl_name" ValueField="fasl_code"
                            ValueType="System.Int32">
                        </PropertiesComboBox>
                        <GroupFooterCellStyle ForeColor="Red" HorizontalAlign="Center">
                        </GroupFooterCellStyle>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn Caption="العــدد" FieldName="calcall" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="الغائبين" FieldName="clacout" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="الحاضرين" FieldName="clacin" UnboundType="Integer"
                        VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="نسبة الغياب" FieldName="clacper" UnboundType="Decimal"
                        VisibleIndex="7">
                        <PropertiesTextEdit DisplayFormatString="P2">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" AutoExpandAllGroups="False" />
                <SettingsPager PageSize="50">
                    <Summary AllPagesText="صفحات :  {0} - {1} ({2} عناصر)" Position="Right" Text="صفحه {0} of {1} ({2} عنصر)" />
                </SettingsPager>
                <Settings ShowFilterBar="Visible" ShowFilterRow="True" ShowFilterRowMenu="True" ShowFooter="True"
                    ShowGroupPanel="True" ShowHeaderFilterButton="True" ShowTitlePanel="True" ShowGroupedColumns="True"
                    ShowGroupFooter="VisibleAlways" ShowStatusBar="Auto" />
                <SettingsText CommandCancel="الغاء" CommandClearFilter="مسح التصفيه" CommandDelete="حذف"
                    CommandEdit="تعديل" CommandNew="جديد" CommandSelect="اختار" CommandUpdate="تحديث"
                    ConfirmDelete="هل انت متأكد؟" CustomizationWindowCaption="خيارات" EmptyDataRow="فارغ"
                    EmptyHeaders="راس فارغ" FilterBarClear="مسح التصفبه" FilterBarCreateFilter="صناعة تصفيه"
                    FilterControlPopupCaption="خيارات التصفيه" GroupContinuedOnNextPage="تستكمل المجموعه في الصفحه القادمه"
                    GroupPanel="اسحب عمود ثم افلته هنا لصناعه مجموعه" HeaderFilterShowAll="اظهار الكل"
                    HeaderFilterShowBlanks="اظهار الفارغ" HeaderFilterShowNonBlanks="اظهار غير الفارغ"
                    PopupEditFormCaption="صفحة المحرر" />
                <SettingsCustomizationWindow Enabled="True" />
                <Images SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css">
                    <LoadingPanelOnStatusBar Url="../App_Themes/DevEx/GridView/StatusBarLoading.gif">
                    </LoadingPanelOnStatusBar>
                    <LoadingPanel Url="../App_Themes/DevEx/GridView/Loading.gif">
                    </LoadingPanel>
                </Images>
                <ImagesFilterControl>
                    <LoadingPanel Url="../App_Themes/DevEx/GridView/Loading.gif">
                    </LoadingPanel>
                </ImagesFilterControl>
                <Styles CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx">
                    <Header ImageSpacing="5px" SortingImageSpacing="5px" Font-Bold="False" Font-Size="Medium"
                        HorizontalAlign="Center">
                    </Header>
                    <AlternatingRow HorizontalAlign="Center">
                    </AlternatingRow>
                    <Cell HorizontalAlign="Center">
                    </Cell>
                    <Footer HorizontalAlign="Center">
                    </Footer>
                    <LoadingPanel ImageSpacing="5px">
                    </LoadingPanel>
                    <EditFormTable>
                        <Border BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                    </EditFormTable>
                    <EditFormColumnCaption BackColor="Gray" ForeColor="White">
                        <Border BorderColor="White" BorderStyle="Solid" BorderWidth="10px" />
                    </EditFormColumnCaption>
                </Styles>
                <StylesPager>
                    <CurrentPageNumber Font-Bold="False">
                    </CurrentPageNumber>
                    <PageNumber Font-Bold="False">
                    </PageNumber>
                    <Summary HorizontalAlign="Center">
                    </Summary>
                </StylesPager>
                <StylesEditors ButtonEditCellSpacing="0">
                    <ProgressBar Height="21px">
                    </ProgressBar>
                </StylesEditors>
            </dx:ASPxGridView>
            <asp:AccessDataSource ID="DSData" runat="server" DataFile="../App_Data/dataschool.mdb"
                SelectCommand="SELECT alsofof_code, fasl_code, asase_code, Count(*) AS calcall,
(Select Count(*) From stu_eyab Where asase_code = student_t.asase_code And stu_code in (Select stu_code from student_t student_t2 Where alsofof_code = student_t.alsofof_code And fasl_code = student_t.fasl_code) And [date] = ?) AS clacout
FROM student_t WHERE (asase_code = (SELECT MAX(asase_code) AS Expr1 FROM student_t student_t_1))
GROUP BY alsofof_code, fasl_code, asase_code">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DEdate" Name="?" PropertyName="Value" />
                </SelectParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSsaf" runat="server" DataFile="../App_Data/code.mdb" SelectCommand="Select alsofof_code, alsofof_name From alsofof">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSfasl" runat="server" DataFile="../App_Data/code.mdb"
                SelectCommand="Select fasl_code, fasl_name From fasl"></asp:AccessDataSource>
            <dx:ASPxGridViewExporter ID="ASPxGridViewExporterEditor" runat="server" FileName="ContactUSFX"
                GridViewID="GVEditor" PaperKind="A4">
            </dx:ASPxGridViewExporter>
        </td>
    </tr>
</table>
<dx:ASPxPopupControl ID="ASPxPopupControlEditor" runat="server" AllowDragging="True"
    ClientInstanceName="popupeditor" CssFilePath="../App_Themes/DevEx/{0}/styles.css"
    CssPostfix="DevEx" HeaderText="رسالـــه" MinHeight="80px" MinWidth="200px" Modal="True"
    PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" RightToLeft="True"
    SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" Height="120px" Width="300px"
    Style="text-align: center" Font-Bold="False">
    <LoadingPanelImage Url="../App_Themes/DevEx/Web/Loading.gif">
    </LoadingPanelImage>
    <ContentStyle Font-Bold="True" Font-Size="Medium" Font-Underline="False" HorizontalAlign="Center"
        VerticalAlign="Middle">
        <Border BorderStyle="Solid" BorderWidth="10px" />
    </ContentStyle>
    <HeaderStyle>
        <Paddings PaddingLeft="7px" />
    </HeaderStyle>
    <LoadingPanelStyle ImageSpacing="5px">
    </LoadingPanelStyle>
    <ModalBackgroundStyle BackColor="Gray">
    </ModalBackgroundStyle>
    <ContentCollection>
        <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
            تم التحميل</dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>
