<%@ Control Language="C#" AutoEventWireup="true" CodeFile="tblwarasason.ascx.cs" Inherits="tblwarasason" %>
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
                KeyFieldName="sonid" RightToLeft="True" 
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
                    <dx:GridViewDataCheckColumn Caption="يحذف" FieldName="delson" 
                        VisibleIndex="15">
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataTextColumn Caption="مسلسل" FieldName="mosalsal" 
                        VisibleIndex="13" ReadOnly="True">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataMemoColumn Caption="ملاحظات" FieldName="remm" VisibleIndex="17">
                    </dx:GridViewDataMemoColumn>
                    <dx:GridViewDataTextColumn Caption="اسم الوريث" FieldName="sonname" 
                        VisibleIndex="5" ReadOnly="True">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn Caption="الفئة" 
                        FieldName="sontype" VisibleIndex="7" ReadOnly="True">
                        <PropertiesComboBox DataSourceID="DScdsontype" DropDownStyle="DropDown" 
                            TextField="sontype" ValueField="sontypeid" 
                            ValueType="System.Int32">
                            <Columns>
                                <dx:ListBoxColumn Caption="النوع" FieldName="sontype" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn Caption="الاسم" FieldName="membername" VisibleIndex="3" ReadOnly="True">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="اللجنة" FieldName="SubCommitte" VisibleIndex="2" ReadOnly="True">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="رقم الصرف" FieldName="sarfno" VisibleIndex="4" ReadOnly="True">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="الرقم القومي" FieldName="sonnid" 
                        VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="كود" FieldName="sonid" ReadOnly="True" VisibleIndex="1">
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
                DeleteCommand="DELETE FROM [tblwarasason] WHERE (([memberid] = ?) OR ([memberid] IS NULL AND ? IS NULL)) AND (([sonid] = ?) OR ([sonid] IS NULL AND ? IS NULL))" 
                InsertCommand="INSERT INTO [tblwarasason] ([memberid], [sonid], [sontype], [sonname], [sonnid], [mosalsal], [useredit], [dateedit], [delson], [remm]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" 
                SelectCommand="SELECT tblwarasason.memberid, tblwarasason.sonid, tblwarasason.sontype, tblwarasason.sonname, tblwarasason.sonnid, tblwarasason.mosalsal, tblwarasason.useredit, tblwarasason.dateedit, tblwarasason.delson, tblwarasason.remm, tblwarasa.membername, cdSubCommitte.SubCommitte, tblwarasa.sarfno FROM ((tblwarasa LEFT OUTER JOIN cdSubCommitte ON tblwarasa.SubCommitteId = cdSubCommitte.SubCommitteId) RIGHT OUTER JOIN tblwarasason ON tblwarasa.memberid = tblwarasason.memberid) 
order by  tblwarasa.sarfno" 
                UpdateCommand="UPDATE [tblwarasason] SET [sontype] = ?, [sonname] = ?, [sonnid] = ?, [mosalsal] = ?, [useredit] = ?,  [delson] = ?, [remm] = ? WHERE 
[sonid] = ?" 
                OnSelecting="DSData_Selecting">
                <DeleteParameters>
                    <asp:Parameter Name="memberid" Type="Int32" />
                    <asp:Parameter Name="sonid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="memberid" Type="Int32" />
                    <asp:Parameter Name="sonid" Type="Int32" />
                    <asp:Parameter Name="sontype" Type="Byte" />
                    <asp:Parameter Name="sonname" Type="String" />
                    <asp:Parameter Name="sonnid" Type="String" />
                    <asp:Parameter Name="mosalsal" Type="Int32" />
                    <asp:Parameter Name="useredit" Type="Int32" />
                    <asp:Parameter Name="dateedit" Type="DateTime" />
                    <asp:Parameter Name="delson" Type="Boolean" />
                    <asp:Parameter Name="remm" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="sontype" Type="Byte" />
                    <asp:Parameter Name="sonname" Type="String" />
                    <asp:Parameter Name="sonnid" Type="String" />
                    <asp:Parameter Name="mosalsal" Type="Int32" />
                    <asp:SessionParameter Name="useredit" SessionField="RetirementWebUserID" 
                        Type="Int32" />
                    <asp:Parameter Name="delson" Type="Boolean" />
                    <asp:Parameter Name="remm" Type="String" />
                    <asp:Parameter Name="sonid" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DScdsontype" runat="server" 
                DataFile="../../App_Data/7.mdb" 
                
                
                SelectCommand="SELECT [sontypeid], [sontype] FROM [cdsontype]">
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


    
