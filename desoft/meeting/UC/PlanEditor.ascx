<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PlanEditor.ascx.cs" Inherits="PlanEditor" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>

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
                Caption="البيــــــــــا نـــــــــــــــات" DataSourceID="DSData" 
                KeyFieldName="planId" RightToLeft="True" 
                SummaryText="الملخص" CssFilePath="../App_Themes/DevEx/{0}/styles.css" 
                CssPostfix="DevEx" EnableTheming="True" 
                onrowdeleted="GVEditor_RowDeleted" onrowupdated="GVEditor_RowUpdated" 
                onrowinserted="GVEditor_RowInserted" Width="700px" 
                onrowupdating="GVEditor_RowUpdating" 
                oncancelrowediting="GVEditor_CancelRowEditing" 
                onrowinserting="GVEditor_RowInserting" 
                onstartrowediting="GVEditor_StartRowEditing" Font-Bold="True">
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
                    <dx:GridViewCommandColumn ButtonType="Image" Caption="العمليات" 
                        VisibleIndex="0">
                        <EditButton Visible="True">
                            <Image Url="../images/edit.png" Width="26px">
                            </Image>
                        </EditButton>
                        <NewButton Visible="True">
                            <Image Url="../images/insert.png" Width="26px">
                            </Image>
                        </NewButton>
                        <DeleteButton Visible="True" Text="حذف">
                            <Image Url="../images/delete.png" Width="26px">
                            </Image>
                        </DeleteButton>
                        <SelectButton>
                            <Image Url="../images/accept.png">
                            </Image>
                        </SelectButton>
                        <CancelButton>
                            <Image Url="../images/delete.png">
                            </Image>
                        </CancelButton>
                        <UpdateButton>
                            <Image Url="../images/accept.png">
                            </Image>
                        </UpdateButton>
                        <ClearFilterButton Visible="True">
                        </ClearFilterButton>
                    </dx:GridViewCommandColumn>
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
            <dx:ASPxGridViewExporter ID="ASPxGridViewExporterEditor" runat="server" 
                FileName="ContactUSFX" GridViewID="GVEditor" PaperKind="A4">
            </dx:ASPxGridViewExporter>
            <asp:AccessDataSource ID="DSData" runat="server" DataFile="../App_Data/Synricate.mdb" 
                DeleteCommand="DELETE FROM [tblplan] WHERE [planId] = ?" 
                InsertCommand="INSERT INTO [tblplan] ([yearId], [monthId], [LagnaId], [LagnaNoaeaId]) VALUES (?, ?, ?, ?)" 
                SelectCommand="SELECT planId, yearId, monthId, LagnaId, LagnaNoaeaId FROM tblplan WHERE EXISTS (SELECT id FROM UserMeeting WHERE (LagnaId = tblplan.LagnaId) AND (id = ?))" 
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                UpdateCommand="UPDATE [tblplan] SET [yearId] = ?, [monthId] = ?, [LagnaId] = ?, [LagnaNoaeaId] = ? WHERE [planId] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="planId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="yearId" Type="Byte" />
                    <asp:Parameter Name="monthId" Type="Byte" />
                    <asp:Parameter Name="LagnaId" Type="Byte" />
                    <asp:Parameter Name="LagnaNoaeaId" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="?" SessionField="meetingID" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="yearId" Type="Byte" />
                    <asp:Parameter Name="monthId" Type="Byte" />
                    <asp:Parameter Name="LagnaId" Type="Byte" />
                    <asp:Parameter Name="LagnaNoaeaId" Type="Int32" />
                    <asp:Parameter Name="planId" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DScdyear" runat="server" DataFile="../App_Data/Synricate.mdb"
                
                SelectCommand="SELECT [yearId], [yearName] FROM [cdyear]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DScdmonth" runat="server" DataFile="../App_Data/Synricate.mdb"
                
                SelectCommand="SELECT [monthId], [monthName] FROM [cdmonth]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSCDLagna" runat="server" DataFile="../App_Data/Synricate.mdb"
                
                SelectCommand="SELECT [LagnaId], [LagnaName] FROM [CDLagna]
 WHERE EXISTS (SELECT id FROM UserMeeting 
WHERE (LagnaId = CDLagna.LagnaId) AND (id = ?))">
                <SelectParameters>
                    <asp:SessionParameter Name="?" SessionField="meetingID" />
                </SelectParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSCDLagnaNoaea" runat="server" DataFile="../App_Data/Synricate.mdb"
                
                
                SelectCommand="SELECT [LagnaNoaeaId], [LagnaNoaeaName] FROM [CDLagnaNoaea]">
            </asp:AccessDataSource>
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
    FalseX2012</dx:PopupControlContentControl>

</ContentCollection>
</dx:ASPxPopupControl>
