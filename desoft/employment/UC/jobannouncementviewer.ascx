﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="jobannouncementviewer.ascx.cs" Inherits="jobannouncementviewer" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.2.Export, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>

<table align="center">
    <tr>
        <td dir="ltr">
            <dx:ASPxComboBox ID="CBExporter" runat="server" 
                CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" 
                onbuttonclick="CBExporter_ButtonClick" Spacing="0" 
                SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css">
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
            <dx:ASPxGridView ID="GVEditor" runat="server" AutoGenerateColumns="False" 
                Caption="الوظائف المعلن عنهــــــــــــــــا" 
                KeyFieldName="advid" RightToLeft="True" 
                SummaryText="الملخص" CssFilePath="../App_Themes/DevEx/{0}/styles.css" 
                CssPostfix="DevEx" EnableTheming="True" Width="700px" 
                DataSourceID="DSData" onrowdeleted="GVEditor_RowDeleted" 
                onrowinserted="GVEditor_RowInserted" onrowupdated="GVEditor_RowUpdated">
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
                    <dx:ASPxSummaryItem DisplayFormat="العـدد : {0}" FieldName="advsubject" 
                        ShowInColumn="الوظيفه" ShowInGroupFooterColumn="الوظيفه" 
                        SummaryType="Count" />
                </TotalSummary>
                <GroupSummary>
                    <dx:ASPxSummaryItem DisplayFormat="العـدد : {0}" FieldName="advsubject" 
                        ShowInColumn="الوظيفه" ShowInGroupFooterColumn="الوظيفه" 
                        SummaryType="Count" />
                    <dx:ASPxSummaryItem DisplayFormat="العـدد : {0}" FieldName="showonsite" 
                        ShowInColumn="يعرض علي الموقع" ShowInGroupFooterColumn="يعرض علي الموقع" 
                        SummaryType="Count" />
                </GroupSummary>
                <Columns>
                    <dx:GridViewDataTextColumn Caption="الوظيفه" FieldName="advsubject" 
                        VisibleIndex="2">
                        <GroupFooterCellStyle ForeColor="Red" HorizontalAlign="Center">
                        </GroupFooterCellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataMemoColumn Caption="شروط الوظيفه" FieldName="advconditions" 
                        VisibleIndex="3">
                        <GroupFooterCellStyle ForeColor="Red" HorizontalAlign="Center">
                        </GroupFooterCellStyle>
                    </dx:GridViewDataMemoColumn>
                    <dx:GridViewDataTextColumn Caption="طرق الوظيفه" FieldName="advrecive" 
                        VisibleIndex="5">
                        <PropertiesTextEdit DisplayFormatString="d/M/yyyy">
                        </PropertiesTextEdit>
                        <GroupFooterCellStyle ForeColor="Red" HorizontalAlign="Center">
                        </GroupFooterCellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataHyperLinkColumn Caption="استمارة التسجيل" FieldName="advid" 
                        VisibleIndex="1">
                        <PropertiesHyperLinkEdit NavigateUrlFormatString="../jobregistration.aspx?advid={0}" 
                            TextFormatString="استمارة التسجيل">
                        </PropertiesHyperLinkEdit>
                    </dx:GridViewDataHyperLinkColumn>
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" 
                    AutoExpandAllGroups="False" />
                <SettingsPager PageSize="50">
                    <Summary AllPagesText="صفحات :  {0} - {1} ({2} عناصر)" Position="Right" 
                        Text="صفحه {0} of {1} ({2} عنصر)" />
                </SettingsPager>
                <Settings 
                    ShowFooter="True" ShowStatusBar="Auto" />
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
            <asp:AccessDataSource ID="DSData" runat="server" 
                DataFile="../App_Data/tawzif.mdb" 
                
                SelectCommand="SELECT [advid], [advsubject], [advconditions], [advrecive], [showonsite] FROM [advjob] Where showonsite = true" 
                DeleteCommand="DELETE FROM [advjob] WHERE [advid] = ?" 
                InsertCommand="INSERT INTO [advjob] ([advsubject], [advconditions], [advrecive], [showonsite]) VALUES (?, ?, ?, ?)" 
                UpdateCommand="UPDATE [advjob] SET [advsubject] = ?, [advconditions] = ?, [advrecive] = ?, [showonsite] = ? WHERE [advid] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="advid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="advsubject" Type="String" />
                    <asp:Parameter Name="advconditions" Type="String" />
                    <asp:Parameter Name="advrecive" Type="String" />
                    <asp:Parameter Name="showonsite" Type="Boolean" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="advsubject" Type="String" />
                    <asp:Parameter Name="advconditions" Type="String" />
                    <asp:Parameter Name="advrecive" Type="String" />
                    <asp:Parameter Name="showonsite" Type="Boolean" />
                    <asp:Parameter Name="advid" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <dx:ASPxGridViewExporter ID="ASPxGridViewExporterEditor" runat="server" 
                FileName="ContactUSFX" GridViewID="GVEditor" PaperKind="A4">
            </dx:ASPxGridViewExporter>
        </td>
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
    <LoadingPanelImage Url="../App_Themes/DevEx/Web/Loading.gif">
    </LoadingPanelImage>
    <ContentStyle Font-Bold="True" Font-Size="Medium" Font-Underline="False" 
        HorizontalAlign="Center" VerticalAlign="Middle">
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
    FX2012</dx:PopupControlContentControl>

</ContentCollection>
</dx:ASPxPopupControl>


    