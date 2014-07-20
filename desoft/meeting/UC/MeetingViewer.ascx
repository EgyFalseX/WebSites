<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MeetingViewer.ascx.cs" Inherits="MeetingViewer" %>

<%@ Register assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxDataView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx1" %>

<table align="center">
    <tr>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td style="text-align: center">
            <dx1:ASPxGridView ID="GVEditor" runat="server" AutoGenerateColumns="False" 
                Caption="البيــــــــــا نـــــــــــــــات" DataSourceID="DSData" RightToLeft="True" 
                SummaryText="الملخص" CssFilePath="../App_Themes/DevEx/{0}/styles.css" 
                CssPostfix="DevEx" EnableTheming="True" Width="700px" Font-Bold="True" 
                KeyFieldName="MId">
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
                    <dx1:aspxsummaryitem DisplayFormat="العـدد : {0}" FieldName="addno" 
                        ShowInColumn="coname" ShowInGroupFooterColumn="coname" 
                        SummaryType="Count" />
                </TotalSummary>
                <Columns>
                    <dx1:gridviewdatadatecolumn Caption="تاريخ الاجتماع" FieldName="MDate" 
                        VisibleIndex="3">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" 
                            EditFormatString="dd/MM/yyyy">
                        </PropertiesDateEdit>
                    </dx1:gridviewdatadatecolumn>
                    <dx1:gridviewdatatextcolumn Caption="اللجنه النقابيه" FieldName="LagnaName" 
                        VisibleIndex="0">
                    </dx1:gridviewdatatextcolumn>
                    <dx1:gridviewdatatextcolumn Caption="اللجنه النوعيه" FieldName="LagnaNoaeaName" 
                        VisibleIndex="1">
                    </dx1:gridviewdatatextcolumn>
                    <dx1:GridViewDataMemoColumn Caption="القرارات" FieldName="desc" 
                        VisibleIndex="7">
                    </dx1:GridViewDataMemoColumn>
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" 
                    SortMode="DisplayText" ColumnResizeMode="NextColumn" />
                <SettingsPager PageSize="20">
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
                </Styles>
                <StylesPager>
                    <CurrentPageNumber Font-Bold="False">
                    </CurrentPageNumber>
                    <PageNumber Font-Bold="False">
                    </PageNumber>
                </StylesPager>
                <StylesEditors ButtonEditCellSpacing="0">
                    <ProgressBar Height="21px">
                    </ProgressBar>
                </StylesEditors>
            </dx1:ASPxGridView>

            <asp:AccessDataSource ID="DSData" runat="server" 
                DataFile="../App_Data/Synricate.mdb" 
                
                
                
                
                SelectCommand="SELECT MId, MDate, LagnaId, counthodor, countabsent, filepath, 
(SELECT LagnaName FROM CDLagna WHERE LagnaId = TBLMetting.LagnaId) AS LagnaName,
(SELECT LagnaNoaeaName FROM CDLagnaNoaea WHERE LagnaNoaeaId = TBLMetting.LagnaNoaeaId) AS LagnaNoaeaName,
(SELECT [desc] FROM TBLmdescion WHERE MId = TBLMetting.MId) AS [desc]
FROM TBLMetting ">
            </asp:AccessDataSource>
        </td>
    </tr>
</table>


