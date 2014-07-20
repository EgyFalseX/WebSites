<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PlanViewer.ascx.cs" Inherits="PlanViewer" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.2.Export, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>

<style type="text/css">
    .style1
    {
        width: 342px;
    }
    .style2
    {
        text-align: right;
    }
    .style3
    {
        width: 100px;
    }

.dxeButtonEdit_DevEx
{
	border-collapse: separate!important;
}

.dxeButtonEdit_DevEx
{
	background-color: white;
	border-top: 1px solid #9da0aa;
	border-right: 1px solid #c2c4cb;
	border-bottom: 1px solid #d9dae0;
	border-left: 1px solid #c2c4cb;
	width: 170px;
}
.dxeTrackBar_DevEx, 
.dxeIRadioButton_DevEx, 
.dxeButtonEdit_DevEx, 
.dxeTextBox_DevEx, 
.dxeRadioButtonList_DevEx, 
.dxeCheckBoxList_DevEx, 
.dxeMemo_DevEx, 
.dxeListBox_DevEx, 
.dxeCalendar_DevEx, 
.dxeColorTable_DevEx
{
	-webkit-tap-highlight-color: rgba(0,0,0,0);
}

.dxeButtonEdit_DevEx .dxeButtonLeft
{
	border-top-width: 0;
	border-right-width: 1px;
	border-bottom-width: 0;
	border-left-width: 0;
}

.dxeButtonEditButton_DevEx,
.dxeSpinLargeIncButton_DevEx,
.dxeSpinLargeDecButton_DevEx,
.dxeSpinIncButton_DevEx,
.dxeSpinDecButton_DevEx
{
	background: White none;
}

.dxeButtonEditButton_DevEx
{
	border-top-width: 0;
	border-right-width: 0;
	border-bottom-width: 0;
	border-left-width: 1px;
}
.dxeButtonEditButton_DevEx,
.dxeButtonEdit_DevEx .dxeSBC
{
	border-style: solid;
	border-color: Transparent;
	-border-color: White;
}

.dxeButtonEditButton_DevEx,
.dxeCalendarButton_DevEx,
.dxeSpinIncButton_DevEx,
.dxeSpinDecButton_DevEx,
.dxeSpinLargeIncButton_DevEx,
.dxeSpinLargeDecButton_DevEx
{
	vertical-align: middle;
	cursor: pointer;
}
.dxeHyperlink_DevEx
{
	font: normal 11px Verdana;
	color: #1b3f91;
	text-decoration: none;
}
.dxpControl_DevEx
{
	font: 11px Verdana;
	color: #201f35;
}
.dxpDisabled_DevEx
{
	color: #b1b1b8;
	border-color: #f2f2f4;
	cursor: default;
}

.dxpDisabledButton_DevEx
{
	color: #b1b1b8;
	text-decoration: none;
}
.dxpButton_DevEx
{
	text-decoration: none;
	white-space: nowrap;
	text-align: center;
	vertical-align: middle;
}
.dxpCurrentPageNumber_DevEx
{
	background-color: #e2eafd;
	text-decoration: none;
	padding: 1px 4px 2px;
	border: 1px solid #c9d7fb;
	white-space: nowrap;
}
.dxpPageNumber_DevEx
{
	text-decoration: none;
	text-align: center;
	vertical-align: middle;
	padding: 1px 6px 2px;
}
.dxpSummary_DevEx
{
	white-space: nowrap;
	text-align: center;
	vertical-align: middle;
	padding: 1px 4px;
}
    </style>

<table align="center" class="style1">
    <tr>
        <td colspan="2" style="text-align: center">
            <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="البـحــث عــن خطـــــــــه" 
                style="font-size: 16pt; color: #666666">
            </dx:ASPxLabel>
        </td>
    </tr>
    <tr>
        <td class="style2">
            <dx:ASPxComboBox ID="cbCDLagna" runat="server" DataSourceID="DSCDLagna" 
                TextField="LagnaName" ValueField="LagnaId" ValueType="System.Int32">
                <Columns>
                    <dx:ListBoxColumn Caption="اختار اسم" FieldName="LagnaName" />
                </Columns>
            </dx:ASPxComboBox>
        </td>
        <td class="style2">
            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="اللجنة النقابية">
            </dx:ASPxLabel>
        </td>
    </tr>
    <tr>
        <td class="style2">
            <dx:ASPxComboBox ID="cbCDLagnaNoaea" runat="server" 
                DataSourceID="DSCDLagnaNoaea" TextField="LagnaNoaeaName" 
                ValueField="LagnaNoaeaId" ValueType="System.Int32" TabIndex="1">
                <Columns>
                    <dx:ListBoxColumn Caption="اختار اسم" FieldName="LagnaNoaeaName" />
                </Columns>
            </dx:ASPxComboBox>
        </td>
        <td class="style2">
            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="اللجنة النوعية">
            </dx:ASPxLabel>
        </td>
    </tr>
    <tr>
        <td class="style2">
            <dx:ASPxComboBox ID="cbcdyear" runat="server" DataSourceID="DScdyear" 
                TextField="yearName" ValueField="yearId" ValueType="System.Int32" 
                TabIndex="2">
                <Columns>
                    <dx:ListBoxColumn Caption="اختار اسم" FieldName="yearName" />
                </Columns>
            </dx:ASPxComboBox>
        </td>
        <td class="style2">
            <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="اختر السنة">
            </dx:ASPxLabel>
        </td>
    </tr>
    <tr>
        <td class="style2">
            <dx:ASPxComboBox ID="cbcdmonth" runat="server" DataSourceID="DScdmonth" 
                TextField="monthName" ValueField="monthId" ValueType="System.Int32" 
                TabIndex="3">
                <Columns>
                    <dx:ListBoxColumn Caption="اختار اسم" FieldName="monthName" />
                </Columns>
            </dx:ASPxComboBox>
        </td>
        <td class="style2">
            <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="الشهر">
            </dx:ASPxLabel>
        </td>
    </tr>
    <tr>
        <td class="style2">
            <dx:ASPxButton ID="btnSearch" runat="server" Text="عرض" Width="170px" 
                onclick="btnSearch_Click" TabIndex="4">
            </dx:ASPxButton>
        </td>
        <td class="style2">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2">
            &nbsp;</td>
        <td class="style2">
            &nbsp;</td>
    </tr>
</table>
<table align="center" class="style3">
    <tr>
        <td style="direction: ltr">
            &nbsp;</td>
    </tr>
    <tr>
        <td style="direction: ltr">
            <dx:ASPxGridView ID="GVEditor" runat="server" AutoGenerateColumns="False" 
                Caption="البيــــــــــا نـــــــــــــــات" DataSourceID="DSData" 
                KeyFieldName="planId" RightToLeft="True" 
                SummaryText="الملخص" CssFilePath="../App_Themes/DevEx/{0}/styles.css" 
                CssPostfix="DevEx" EnableTheming="True" Width="700px" TabIndex="5" 
                Visible="False" Font-Bold="True">
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
                    <dx:GridViewDataComboBoxColumn Caption="السنه" FieldName="yearId" 
                        VisibleIndex="1">
                        <PropertiesComboBox DataSourceID="DScdyear" TextField="yearName" 
                            ValueField="yearId" ValueType="System.Int32">
                            <Columns>
                                <dx:ListBoxColumn Caption="اختار اسم" FieldName="yearName" />
                            </Columns>
                            <Style HorizontalAlign="Center">
                            </Style>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="الشهر" FieldName="monthId" 
                        VisibleIndex="2">
                        <PropertiesComboBox DataSourceID="DScdmonth" TextField="monthName" 
                            ValueField="monthId" ValueType="System.Int32">
                            <Columns>
                                <dx:ListBoxColumn Caption="اختار اسم" FieldName="monthName" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="اللجنه" FieldName="LagnaId" 
                        VisibleIndex="3">
                        <PropertiesComboBox DataSourceID="DSCDLagna" TextField="LagnaName" 
                            ValueField="LagnaId" ValueType="System.Int32">
                            <Columns>
                                <dx:ListBoxColumn Caption="اختار اسم" FieldName="LagnaName" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="اللجنه النوعيه" 
                        FieldName="LagnaNoaeaId" VisibleIndex="5">
                        <PropertiesComboBox DataSourceID="DSCDLagnaNoaea" TextField="LagnaNoaeaName" 
                            ValueField="LagnaNoaeaId" ValueType="System.Int32">
                            <Columns>
                                <dx:ListBoxColumn Caption="اختار اسم" FieldName="LagnaNoaeaName" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataHyperLinkColumn Caption="تفاصيل الخطه" FieldName="planId" 
                        VisibleIndex="7">
                        <PropertiesHyperLinkEdit NavigateUrlFormatString="../PlanDetailsEditor.aspx?id={0}" 
                            TextFormatString="تفاصيل الخطه">
                        </PropertiesHyperLinkEdit>
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataHyperLinkColumn>
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" 
                    SortMode="DisplayText" ColumnResizeMode="NextColumn" />
                <SettingsPager>
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
            </dx:ASPxGridView>
            </td>
    </tr>
</table>
            <asp:AccessDataSource ID="DSData" runat="server" DataFile="../App_Data/Synricate.mdb" 
                
    SelectCommand="SELECT planId, yearId, monthId, LagnaId, LagnaNoaeaId FROM tblplan">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DScdyear" runat="server" DataFile="../App_Data/Synricate.mdb"
                
                SelectCommand="SELECT [yearId], [yearName] FROM [cdyear]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DScdmonth" runat="server" DataFile="../App_Data/Synricate.mdb"
                
                SelectCommand="SELECT [monthId], [monthName] FROM [cdmonth]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSCDLagna" runat="server" DataFile="../App_Data/Synricate.mdb"
                
                SelectCommand="SELECT [LagnaId], [LagnaName] FROM [CDLagna]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSCDLagnaNoaea" runat="server" DataFile="../App_Data/Synricate.mdb"
                
                
                SelectCommand="SELECT [LagnaNoaeaId], [LagnaNoaeaName] FROM [CDLagnaNoaea]">
            </asp:AccessDataSource>
        
