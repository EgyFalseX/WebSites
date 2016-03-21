<%@ Control Language="C#" AutoEventWireup="true" CodeFile="tblmember.ascx.cs" Inherits="tblmember" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>

<body style="direction: ltr">

<table align="center">
    <tr>
        <td dir="ltr">
            <dx:ASPxComboBox ID="CBExporter" runat="server" 
                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                onbuttonclick="CBExporter_ButtonClick" 
                SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" 
                Theme="Youthful">
                <Items>
                    <dx:ListEditItem Text="Rtf" Value="Rtf" />
                    <dx:ListEditItem Text="Pdf" Value="Pdf" />
                    <dx:ListEditItem Text="Xls" Value="Xls" />
                    <dx:ListEditItem Text="Xlsx" Value="Xlsx" />
                    <dx:ListEditItem Text="Csv" Value="Csv" />
                </Items>
                <LoadingPanelImage Url="../App_Themes/PlasticBlue/Editors/Loading.gif">
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
        <td>
            <dx:ASPxGridView ID="GVEditor" runat="server" AutoGenerateColumns="False" 
                Caption="البيــــــــــا نـــــــــــــــات" DataSourceID="DSData" 
                KeyFieldName="memberid" RightToLeft="True" 
                SummaryText="الملخص" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" 
                CssPostfix="PlasticBlue" EnableTheming="True" 
                onrowdeleted="GVEditor_RowDeleted" onrowupdated="GVEditor_RowUpdated" 
                onrowinserted="GVEditor_RowInserted" Font-Bold="True" 
                ondatabinding="GVEditor_DataBinding" Theme="Youthful">
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
                        <NewButton>
                            <Image Url="../images/insert.png" Width="26px">
                            </Image>
                        </NewButton>
                        <DeleteButton Text="حذف">
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
                    <dx:GridViewDataCheckColumn Caption="يحذف" FieldName="delmember" 
                        VisibleIndex="13">
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataTextColumn Caption="مسلسل" FieldName="mosalsal" 
                        VisibleIndex="4" ReadOnly="True">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn Caption="اللجنة النقابية" 
                        FieldName="SubCommitteId" VisibleIndex="5">
                        <PropertiesComboBox DataSourceID="DScdSubCommitte" DropDownStyle="DropDown" 
                            TextField="SubCommitte" ValueField="SubCommitteId" 
                            ValueType="System.Int32">
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn Caption="الرقم القومي" FieldName="mnid" 
                        VisibleIndex="7">
                        <PropertiesTextEdit MaxLength="14">
                            <MaskSettings Mask="00000000000000" />
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="موبيل" FieldName="mobil" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataMemoColumn Caption="ملاحظات" FieldName="remm" VisibleIndex="11">
                    </dx:GridViewDataMemoColumn>
                    <dx:GridViewDataTextColumn Caption="الاسم" FieldName="membername" 
                        VisibleIndex="2" ReadOnly="True">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="رقم الصرف" FieldName="sarfno" 
                        VisibleIndex="3" ReadOnly="True">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="كود" FieldName="memberid" ReadOnly="True" VisibleIndex="1">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
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
                <Images SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css">
                    <LoadingPanelOnStatusBar Url="../App_Themes/PlasticBlue/GridView/gvLoadingOnStatusBar.gif">
                    </LoadingPanelOnStatusBar>
                    <LoadingPanel Url="../App_Themes/PlasticBlue/GridView/Loading.gif">
                    </LoadingPanel>
                </Images>
                <ImagesFilterControl>
                    <LoadingPanel Url="../App_Themes/PlasticBlue/Editors/Loading.gif">
                    </LoadingPanel>
                </ImagesFilterControl>
                <Styles CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" 
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
             <%--DataFile="../../App_Data/7.mdb"--%> 
            <asp:AccessDataSource ID="DSData" runat="server" 
               DataFile="../../App_Data/7.mdb"
                DeleteCommand="DELETE FROM [tblmember] WHERE (([memberid] = ?) OR ([memberid] IS NULL AND ? IS NULL))" 
                InsertCommand="INSERT INTO [tblmember] ([memberid], [membername], [sarfno], [mosalsal], [SyndicateId], [SubCommitteId], [mnid], [mobil], [useredit], [dateedit], [delmember], [remm]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
                SelectCommand="SELECT [memberid], [membername], [sarfno], [mosalsal], [SyndicateId], [SubCommitteId], [mnid], [mobil], [useredit], [dateedit], [delmember], [remm] FROM [tblmember]
WHERE (SubCommitteId = ? OR ? IS NULL)" 
                UpdateCommand="UPDATE [tblmember] SET [membername] = ?, [sarfno] = ?, [mosalsal] = ?, [SubCommitteId] = ?, [mnid] = ?, [mobil] = ?, [useredit] = ?, [dateedit] = DATE(), [delmember] = ?, [remm] = ? WHERE ([memberid] = ?)" 
                OnSelecting="DSData_Selecting">
                <DeleteParameters>
                    <asp:Parameter Name="memberid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="memberid" Type="Int32" />
                    <asp:Parameter Name="membername" Type="String" />
                    <asp:Parameter Name="sarfno" Type="Int32" />
                    <asp:Parameter Name="mosalsal" Type="Int32" />
                    <asp:Parameter Name="SyndicateId" Type="Int32" />
                    <asp:Parameter Name="SubCommitteId" Type="Int32" />
                    <asp:Parameter Name="mnid" Type="String" />
                    <asp:Parameter Name="mobil" Type="String" />
                    <asp:Parameter Name="useredit" Type="Int32" />
                    <asp:Parameter Name="dateedit" Type="DateTime" />
                    <asp:Parameter Name="delmember" Type="Boolean" />
                    <asp:Parameter Name="remm" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="SubCommitteId" SessionField="RetirementWebSubCommitteId" />
                    <asp:SessionParameter Name="SubCommitteId" SessionField="RetirementWebSubCommitteId" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="membername" Type="String" />
                    <asp:Parameter Name="sarfno" Type="Int32" />
                    <asp:Parameter Name="mosalsal" Type="Int32" />
                    <asp:Parameter Name="SubCommitteId" Type="Int32" />
                    <asp:Parameter Name="mnid" Type="String" />
                    <asp:Parameter Name="mobil" Type="String" />
                    <asp:SessionParameter Name="useredit" SessionField="RetirementWebUserID" 
                        Type="Int32" />
                    <asp:Parameter Name="delmember" Type="Boolean" />
                    <asp:Parameter Name="remm" Type="String" />
                    <asp:Parameter Name="memberid" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DScdSubCommitte" runat="server" 
                DataFile="../../App_Data/retdatalogin.mdb" 
                
                
                SelectCommand="SELECT [SubCommitteId], [SubCommitte], [SyndicateId] FROM [cdSubCommitte] WHERE ([SyndicateId] = ?)">
                <SelectParameters>
                    <asp:SessionParameter Name="SyndicateId" 
                        SessionField="RetirementWebSyndicateId" Type="Int32" />
                </SelectParameters>
            </asp:AccessDataSource>
            <dx:ASPxGridViewExporter ID="ASPxGridViewExporterEditor" runat="server" 
                FileName="ContactUSFX" GridViewID="GVEditor" PaperKind="A4">
            </dx:ASPxGridViewExporter>
        </td>
    </tr>
    </table>
    
<dx:ASPxPopupControl ID="ASPxPopupControlEditor" runat="server" 
    AllowDragging="True" ClientInstanceName="popupeditor" 
    CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
    HeaderText="رسالـــه" 
    Modal="True" PopupHorizontalAlign="WindowCenter" 
    PopupVerticalAlign="WindowCenter" RightToLeft="True" 
    SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" Height="120px" 
    Width="300px" style="text-align: center" 
    Font-Bold="False" Theme="Youthful">
    <LoadingPanelImage Url="../App_Themes/PlasticBlue/Web/dvLoading.gif">
    </LoadingPanelImage>
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

<dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server" SupportsDisabledAttribute="True">تم 
    التحميل</dx:PopupControlContentControl>

</ContentCollection>
</dx:ASPxPopupControl>


    
