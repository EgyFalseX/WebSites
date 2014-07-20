<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ExportTBLMembers.ascx.cs" Inherits="ExportTBLMembers" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>

<table align="center">
    <tr>
        <td dir="ltr">
            <dx:ASPxComboBox ID="CBExporter" runat="server" 
                CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                onbuttonclick="CBExporter_ButtonClick" 
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
        <td>
            <dx:ASPxGridView ID="GVEditor" runat="server" AutoGenerateColumns="False" 
                Caption="البيــــــــــا نـــــــــــــــات" DataSourceID="DSData" 
                KeyFieldName="MemberId" RightToLeft="True" 
                SummaryText="الملخص" CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" 
                CssPostfix="PlasticBlue" EnableTheming="True" 
                onrowdeleted="GVEditor_RowDeleted" onrowupdated="GVEditor_RowUpdated" 
                onrowinserted="GVEditor_RowInserted" Font-Bold="True" style="direction: ltr">
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
                    <dx:GridViewDataTextColumn Caption="MemberName" FieldName="MemberName" VisibleIndex="3" Name="MemberName">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="Bdate" FieldName="Bdate" VisibleIndex="6" Name="Bdate">
                        <PropertiesDateEdit DisplayFormatString="{0: dd/MM/yyyy}">
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn Caption="NID" FieldName="NID" VisibleIndex="7" Name="NID">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="NIDEndDate" FieldName="NIDEndDate" VisibleIndex="9" Name="NIDEndDate">
                        <PropertiesDateEdit DisplayFormatString="{0: dd/MM/yyyy}">
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn Caption="Street" FieldName="Street" VisibleIndex="10" Name="Street">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="HomeNo" FieldName="HomeNo" VisibleIndex="11" Name="HomeNo">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="FlatNo" FieldName="FlatNo" VisibleIndex="12" Name="FlatNo">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Area" FieldName="Area" VisibleIndex="15" Name="Area">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="City" FieldName="City" VisibleIndex="14" Name="City">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Mobile" FieldName="Mobile" VisibleIndex="16" Name="Mobile">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="HomeTel" FieldName="HomeTel" VisibleIndex="17" Name="HomeTel">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="WorkTel" FieldName="WorkTel" VisibleIndex="18" Name="WorkTel">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="EMail" FieldName="EMail" VisibleIndex="19" Name="EMail">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="KidNO" FieldName="KidNO" VisibleIndex="20" Name="KidNO">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="ReceiptNo" FieldName="ReceiptNo" VisibleIndex="21" Name="ReceiptNo">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="SubCommitte" FieldName="SubCommitte" 
                        VisibleIndex="2" Name="SubCommitte">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Syndicate" FieldName="Syndicate" VisibleIndex="1" Name="Syndicate">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Gender" FieldName="Gender" VisibleIndex="4" Name="Gender">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="MaritalStatus" FieldName="MaritalStatus" VisibleIndex="5" Name="MaritalStatus">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="IdType" FieldName="IdType" VisibleIndex="8" Name="IdType">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="GOV" FieldName="GOV" VisibleIndex="13" Name="GOV">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="ContactType" FieldName="ContactType" VisibleIndex="22" Name="ContactType">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="MemberId" FieldName="MemberId" VisibleIndex="0" Name="MemberId">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="MemberImage" FieldName="MemberImage" VisibleIndex="23" Name="MemberImage">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="UserName" FieldName="UserName" 
                        VisibleIndex="24" Name="UserName">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="datein" FieldName="datein" 
                        VisibleIndex="25" Name="datein">
                        <PropertiesDateEdit DisplayFormatString="{0: dd/MM/yyyy}">
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataCheckColumn Caption="cardr" FieldName="cardr" 
                        VisibleIndex="26" Name="cardr">
                        <PropertiesCheckEdit DisplayTextChecked="-1" DisplayTextUnchecked="0">
                        </PropertiesCheckEdit>
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataDateColumn Caption="dater" FieldName="dater" 
                        VisibleIndex="28" Name="dater">
                        <PropertiesDateEdit DisplayFormatString="{0: dd/MM/yyyy}">
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn Caption="فرعية المشترك" FieldName="MemberSyndicate" VisibleIndex="30">
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
                DataFile="~/App_Data/ETST.mdb" SelectCommand="SELECT [MemberId], [MemberName], [Bdate], [NID], [NIDEndDate], [Street], [HomeNo], [FlatNo], [Area], [City], [Mobile], [HomeTel], [WorkTel], [EMail], [KidNO], [ReceiptNo], MemberImage, (SELECT SubCommitte FROM CDSubCommitte WHERE SubCommitteId = TBLMembers.SubCommitteId) AS SubCommitte, (SELECT Syndicate FROM CDSyndicate WHERE SyndicateId = TBLMembers.SyndicateId) AS Syndicate, (SELECT Gender FROM CDGender WHERE GenderId = TBLMembers.GenderId) AS Gender, (SELECT MaritalStatus FROM CDMaritalStatus WHERE MaritalStatusId = TBLMembers.MaritalStatusId) AS MaritalStatus, (SELECT IdType FROM CDIdType WHERE IdTypeId = TBLMembers.IdTypeId) AS IdType, (SELECT GOV FROM CDGov WHERE GovId = TBLMembers.GovId) AS GOV, (SELECT ContactType FROM CDContactType WHERE ContactTypeID = TBLMembers.ContactTypeID) AS ContactType, (SELECT UserName FROM Users WHERE UserID = TBLMembers.userin) AS UserName, datein, cardr, dater, (SELECT Syndicate FROM CDSyndicate WHERE SyndicateId = TBLMembers.MemberSyndicateId) AS MemberSyndicate FROM [TBLMembers]">
            </asp:AccessDataSource>
        </td>
    </tr>
    </table>
    
<dx:ASPxPopupControl ID="ASPxPopupControlEditor" runat="server" 
    AllowDragging="True" ClientInstanceName="popupeditor" 
    CssFilePath="~/App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
    HeaderText="رسالـــه" 
    Modal="True" PopupHorizontalAlign="WindowCenter" 
    PopupVerticalAlign="WindowCenter" RightToLeft="True" 
    SpriteCssFilePath="~/App_Themes/PlasticBlue/{0}/sprite.css" Height="120px" 
    Width="300px" style="text-align: center" 
    Font-Bold="False">
    <LoadingPanelImage Url="~/App_Themes/PlasticBlue/Web/dvLoading.gif">
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


    
