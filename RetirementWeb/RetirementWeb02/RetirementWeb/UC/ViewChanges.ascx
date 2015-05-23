<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewChanges.ascx.cs" Inherits="ViewChanges" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxTabControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>

<style type="text/css">

    .style1
    {
        width: 100%;
    }
    </style>

<body style="direction: ltr">

<table align="center" width="100%">
    <tr>
        <td dir="ltr">
            <dx:ASPxComboBox ID="cbSyndicate" runat="server" DataSourceID="DSSyndicate" 
                DropDownStyle="DropDown" Height="23px" TextField="name" ValueField="SyndicateId" 
                Width="200px">
                <Columns>
                    <dx:ListBoxColumn Caption="كود النقابة" FieldName="SyndicateId" />
                    <dx:ListBoxColumn Caption="اسم النقابة" FieldName="name" />
                    <dx:ListBoxColumn Caption="اسم القاعدة" FieldName="dataname" />
                </Columns>
            </dx:ASPxComboBox>
            <asp:AccessDataSource ID="DSSyndicate" runat="server" 
               DataFile="../../App_Data/retdatalogin.mdb" 
                SelectCommand="SELECT [SyndicateId], [name], [dataname] FROM [UserInfo]">
            </asp:AccessDataSource>
        </td>
    </tr>
    <tr>
        <td dir="ltr">
            <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="1" 
                RightToLeft="True" Width="100%">
                <TabPages>
                    <dx:TabPage Text="الاعضاء">
                        <ContentCollection>
                            <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                <table class="style1">
                                    <tr>
                                        <td>
                                            <dx:ASPxButton ID="btnViewMember" runat="server" Height="32px" 
                                                OnClick="btnViewMember_Click" Text="عرض الاعضاء" Width="108px">
                                            </dx:ASPxButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dx:ASPxGridView ID="GVMember" runat="server" AutoGenerateColumns="False" 
                                                Caption="البيــــــــــا نـــــــــــــــات" 
                                                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                DataSourceID="DSDataMember" EnableTheming="True" Font-Bold="True" 
                                                KeyFieldName="memberid" RightToLeft="True" SummaryText="الملخص" 
                                                Width="100%">
                                                <ClientSideEvents BeginCallback="function(s, e) {
s.cpShowPopup = undefined;
}" EndCallback="function(s, e) {
	
	  if(typeof(s.cpShowPopup) != 'undefined')
		{
                popupeditor.SetContentHTML(s.cpShowPopup);
				popupeditor.Show();
		} 
}" />
                                                <TotalSummary>
                                                    <dx:ASPxSummaryItem DisplayFormat="العـدد : {0}" FieldName="addno" 
                                                        ShowInColumn="coname" ShowInGroupFooterColumn="coname" SummaryType="Count" />
                                                </TotalSummary>
                                                <Columns>
                                                    <dx:GridViewCommandColumn ButtonType="Image" Caption="العمليات" 
                                                        ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                        <EditButton>
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
                                                    <dx:GridViewDataTextColumn Caption="الاسم" FieldName="membername" 
                                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataDateColumn Caption="تاريخ التعديل" FieldName="dateedit" 
                                                        ShowInCustomizationForm="True" VisibleIndex="8">
                                                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                                                        </PropertiesDateEdit>
                                                    </dx:GridViewDataDateColumn>
                                                    <dx:GridViewDataTextColumn Caption="رقم الصرف" FieldName="sarfno" 
                                                        ShowInCustomizationForm="True" VisibleIndex="2">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="مسلسل" FieldName="mosalsal" 
                                                        ShowInCustomizationForm="True" VisibleIndex="3">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="اللجنة" FieldName="SubCommitte" 
                                                        ShowInCustomizationForm="True" VisibleIndex="4">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="الرقم القومي" FieldName="mnid" 
                                                        ShowInCustomizationForm="True" VisibleIndex="5">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="موبيل" FieldName="mobil" 
                                                        ShowInCustomizationForm="True" VisibleIndex="6">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataCheckColumn Caption="موقوف" FieldName="delmember" 
                                                        ShowInCustomizationForm="True" VisibleIndex="7">
                                                    </dx:GridViewDataCheckColumn>
                                                    <dx:GridViewDataTextColumn Caption="مسئول التعديل" FieldName="user" 
                                                        ShowInCustomizationForm="True" VisibleIndex="10">
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" 
                                                    ConfirmDelete="True" SortMode="DisplayText" />
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
                                                    <Header Font-Bold="False" Font-Size="Medium" ImageSpacing="10px" 
                                                        SortingImageSpacing="10px">
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
                                        </td>
                                    </tr>
                                </table>
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                    <dx:TabPage Text="الورثة">
                        <ContentCollection>
                            <dx:ContentControl runat="server" SupportsDisabledAttribute="True">
                                <table class="style1">
                                    <tr>
                                        <td>
                                            <dx:ASPxButton ID="btnViewWarasa" runat="server" Height="32px" 
                                                OnClick="btnViewWarasa_Click" Text="عرض الورثة" Width="108px">
                                            </dx:ASPxButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <dx:ASPxGridView ID="GVMemberWarasa" runat="server" AutoGenerateColumns="False" 
                                                Caption="البيــــــــــا نـــــــــــــــات" 
                                                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                                                DataSourceID="DSDataWarasa" EnableTheming="True" Font-Bold="True" 
                                                KeyFieldName="memberid" RightToLeft="True" SummaryText="الملخص" 
                                                Width="100%">
                                                <ClientSideEvents BeginCallback="function(s, e) {
s.cpShowPopup = undefined;
}" EndCallback="function(s, e) {
	
	  if(typeof(s.cpShowPopup) != 'undefined')
		{
                popupeditor.SetContentHTML(s.cpShowPopup);
				popupeditor.Show();
		} 
}" />
                                                <TotalSummary>
                                                    <dx:ASPxSummaryItem DisplayFormat="العـدد : {0}" FieldName="addno" 
                                                        ShowInColumn="coname" ShowInGroupFooterColumn="coname" SummaryType="Count" />
                                                </TotalSummary>
                                                <Columns>
                                                    <dx:GridViewCommandColumn ButtonType="Image" Caption="العمليات" 
                                                        ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                                        <EditButton>
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
                                                    <dx:GridViewDataTextColumn Caption="اسم الاب" FieldName="membername" 
                                                        ShowInCustomizationForm="True" VisibleIndex="6">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataDateColumn Caption="تاريخ التعديل" FieldName="dateedit" 
                                                        ShowInCustomizationForm="True" VisibleIndex="12">
                                                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                                                        </PropertiesDateEdit>
                                                    </dx:GridViewDataDateColumn>
                                                    <dx:GridViewDataTextColumn Caption="رقم الصرف" FieldName="sarfno" 
                                                        ShowInCustomizationForm="True" VisibleIndex="7">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataCheckColumn Caption="حذف الاب" FieldName="delmember" 
                                                        ShowInCustomizationForm="True" VisibleIndex="10">
                                                    </dx:GridViewDataCheckColumn>
                                                    <dx:GridViewDataTextColumn Caption="مسئول التعديل" FieldName="user" 
                                                        ShowInCustomizationForm="True" VisibleIndex="14">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="اسم الابن" FieldName="sonname" 
                                                        ShowInCustomizationForm="True" VisibleIndex="1">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="الرقم القومي" FieldName="sonnid" 
                                                        ShowInCustomizationForm="True" VisibleIndex="3">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataCheckColumn Caption="حزف الابن" FieldName="delson" 
                                                        ShowInCustomizationForm="True" VisibleIndex="5">
                                                    </dx:GridViewDataCheckColumn>
                                                    <dx:GridViewDataTextColumn Caption="نوع الابن" FieldName="sontype" 
                                                        ShowInCustomizationForm="True" VisibleIndex="2">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="مسلسل" FieldName="mosalsal" 
                                                        ShowInCustomizationForm="True" VisibleIndex="4">
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" 
                                                    ConfirmDelete="True" SortMode="DisplayText" />
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
                                                    <Header Font-Bold="False" Font-Size="Medium" ImageSpacing="10px" 
                                                        SortingImageSpacing="10px">
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
                                        </td>
                                    </tr>
                                </table>
                            </dx:ContentControl>
                        </ContentCollection>
                    </dx:TabPage>
                </TabPages>
            </dx:ASPxPageControl>
        </td>
    </tr>
    <tr>
        <td>
            <%--DataFile="../../App_Data/7.mdb"--%> 
            <asp:AccessDataSource ID="DSDataMember" runat="server" 
               DataFile="../../App_Data/7.mdb" 
                
                
                
                SelectCommand="SELECT tblmember.memberid, tblmember.membername, tblmember.sarfno, tblmember.mosalsal, tblmember.SyndicateId, tblmember.SubCommitteId, tblmember.mnid, tblmember.mobil, tblmember.useredit, tblmember.dateedit, tblmember.delmember, tblmember.remm, UserInfo.[user], cdSubCommitte.SubCommitte FROM ((tblmember LEFT OUTER JOIN cdSubCommitte ON tblmember.SubCommitteId = cdSubCommitte.SubCommitteId) LEFT OUTER JOIN UserInfo ON tblmember.useredit = UserInfo.id) WHERE (tblmember.SyndicateId = ?) AND (tblmember.dateedit IS NOT NULL)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="-100" Name="?" />
                </SelectParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSDataWarasa" runat="server" 
               DataFile="../../App_Data/7.mdb" 
                
                
                
                SelectCommand="SELECT tblwarasa.SyndicateId, tblwarasason.dateedit, tblwarasason.useredit, UserInfo.[user], tblwarasason.memberid, tblwarasason.sonid, tblwarasason.sonname, tblwarasason.sonnid, tblwarasason.mosalsal, tblwarasason.delson, tblwarasa.membername, tblwarasa.sarfno, tblwarasa.delmember, cdsontype.sontype FROM (((tblwarasason LEFT OUTER JOIN cdsontype ON tblwarasason.sontype = cdsontype.sontypeid) LEFT OUTER JOIN UserInfo ON tblwarasason.useredit = UserInfo.id) LEFT OUTER JOIN tblwarasa ON tblwarasason.memberid = tblwarasa.memberid) WHERE (tblwarasa.SyndicateId = ?) AND (tblwarasason.dateedit IS NOT NULL)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="-100" Name="?" />
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
    Font-Bold="False">
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


    
