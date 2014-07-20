<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewAllMessages.ascx.cs" Inherits="ViewAllMessages" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGridView.v11.2.Export, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxEditors.v11.2, Version=11.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx1" %>
<style type="text/css">
    .style1
    {
        width: 325px;
    }
    
.dxvsValidationSummary
{
	font: 12px Tahoma;
	color: Red;
}
    </style>

                <asp:AccessDataSource ID="DScontype" runat="server" 
                    DataFile="../App_Data/contact.mdb" 
                    
    SelectCommand="SELECT [contypeid], [contype] FROM [contype]">
                </asp:AccessDataSource>

<table align="center">
    <tr>
        <td dir="ltr" style="text-align: center">
            <table class="style1" align="right">
                <tr>
                    <td colspan="2">
                <dx1:ASPxValidationSummary ID="ASPxVSGroup" runat="server" RightToLeft="True" 
                    ShowErrorsInEditors="True" ValidationGroup="VGroup">
                </dx1:ASPxValidationSummary>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#CCD9EB">
            <dx1:ASPxComboBox ID="ASPxCBLagnaId" runat="server" 
                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                DataSourceID="DScontype" 
                SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" 
                TextField="contype" ValueField="contypeid" ValueType="System.Int32" 
                Width="250px" style="direction: rtl">
                <Columns>
                    <dx1:listboxcolumn Caption="الاسم" FieldName="contype" />
                </Columns>
                <ItemStyle HorizontalAlign="Center" />
                <LoadingPanelImage Url="../App_Themes/PlasticBlue/Editors/Loading.gif">
                </LoadingPanelImage>
                <ValidationSettings ErrorText="عنصر خطاء" ErrorTextPosition="Bottom">
                    <ErrorFrameStyle ImageSpacing="4px">
                        <ErrorTextPaddings PaddingLeft="4px" />
<ErrorTextPaddings PaddingLeft="4px"></ErrorTextPaddings>
                    </ErrorFrameStyle>
                    <RequiredField ErrorText="اختر اسم النقابه" IsRequired="True" />

<RequiredField IsRequired="True" ErrorText="اختر اسم النقابه"></RequiredField>
                </ValidationSettings>
            </dx1:ASPxComboBox>
                    </td>
                    <td bgcolor="#2A5A8E">
            <asp:Label ID="Label15" runat="server" Text="اسم النقابة" ForeColor="White"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td bgcolor="#CCD9EB">
                        <dx:ASPxButton ID="btnSearch" runat="server" 
                            CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                            SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" Text="عرض" 
                            Width="150px" onclick="btnSearch_Click">
                        </dx:ASPxButton>
                    </td>
                    <td bgcolor="#2A5A8E">
                        &nbsp;</td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxGridView ID="GVEditor" runat="server" AutoGenerateColumns="False" 
                Caption="البيــــــــــا نـــــــــــــــات" DataSourceID="DSData1" 
                KeyFieldName="addno" RightToLeft="True" 
                SummaryText="الملخص" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" 
                CssPostfix="PlasticBlue" EnableTheming="True" 
                Font-Bold="True" Visible="False">
                <ClientSideEvents EndCallback="function(s, e) {
	
	  if(typeof(s.cpShowPopup) != 'undefined')
		{
                popupeditor.SetContentHTML(s.cpShowPopup);
				popupeditor.Show();
		} 
}" BeginCallback="function(s, e) {
s.cpShowPopup = undefined;
}" />
<ClientSideEvents BeginCallback="function(s, e) {
s.cpShowPopup = undefined;
}" EndCallback="function(s, e) {
	
	  if(typeof(s.cpShowPopup) != &#39;undefined&#39;)
		{
                popupeditor.SetContentHTML(s.cpShowPopup);
				popupeditor.Show();
		} 
}"></ClientSideEvents>
                <TotalSummary>
                    <dx:ASPxSummaryItem DisplayFormat="العـدد : {0}" FieldName="addno" 
                        ShowInColumn="coname" ShowInGroupFooterColumn="coname" SummaryType="Count" />
                </TotalSummary>
                <Columns>
                    <dx:GridViewDataTextColumn Caption="الاسم" FieldName="coname" 
                        VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="النقابه" FieldName="LagnaName" 
                        VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="الاداره" FieldName="EdaraName" 
                        VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="التاريخ" FieldName="condate" 
                        VisibleIndex="3">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataMemoColumn Caption="الرساله" FieldName="massage" 
                        VisibleIndex="4">
                    </dx:GridViewDataMemoColumn>
                    <dx:GridViewDataMemoColumn Caption="الرد" FieldName="reply" VisibleIndex="5">
                    </dx:GridViewDataMemoColumn>
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" 
                    SortMode="DisplayText" ColumnResizeMode="Control" />

<SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" ConfirmDelete="True" 
                    SortMode="DisplayText"></SettingsBehavior>

                <SettingsPager ShowDefaultImages="False">
                    <AllButton Text="All">
                    </AllButton>
                    <NextPageButton Text="Next &gt;">
                    </NextPageButton>
                    <PrevPageButton Text="&lt; Prev">
                    </PrevPageButton>
                    <Summary AllPagesText="صفحات :  {0} - {1} ({2} عناصر)" Position="Right" 
                        Text="صفحه {0} of {1} ({2} عنصر)" />

<Summary AllPagesText="صفحات :  {0} - {1} ({2} عناصر)" Position="Right" 
                        Text="صفحه {0} of {1} ({2} عنصر)"></Summary>
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

<Settings ShowTitlePanel="True" ShowFilterRow="True" ShowFilterRowMenu="True" 
                    ShowHeaderFilterButton="True" ShowGroupPanel="True" ShowFooter="True" 
                    ShowFilterBar="Visible"></Settings>

<SettingsText GroupPanel="اسحب عمود ثم افلته هنا لصناعه مجموعه" ConfirmDelete="هل انت متأكد؟" 
                    CustomizationWindowCaption="خيارات" PopupEditFormCaption="صفحة المحرر" 
                    EmptyHeaders="راس فارغ" 
                    GroupContinuedOnNextPage="تستكمل المجموعه في الصفحه القادمه" 
                    EmptyDataRow="فارغ" CommandEdit="تعديل" CommandNew="جديد" CommandDelete="حذف" 
                    CommandSelect="اختار" CommandCancel="الغاء" CommandUpdate="تحديث" 
                    CommandClearFilter="مسح التصفيه" HeaderFilterShowAll="اظهار الكل" 
                    HeaderFilterShowBlanks="اظهار الفارغ" 
                    HeaderFilterShowNonBlanks="اظهار غير الفارغ" 
                    FilterControlPopupCaption="خيارات التصفيه" FilterBarClear="مسح التصفبه" 
                    FilterBarCreateFilter="صناعة تصفيه"></SettingsText>

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
            <dx:ASPxGridViewExporter ID="ASPxGridViewExporterEditor" runat="server" 
                FileName="ContactUSFX" GridViewID="GVEditor" PaperKind="A4">
            </dx:ASPxGridViewExporter>
            <asp:AccessDataSource ID="DSData1" runat="server" DataFile="../App_Data/contact.mdb" 
                SelectCommand="SELECT addno, LagnaId, EdaraId, coname, massage, 
                condate, reply, 
                (SELECT EdaraName FROM CDEdara WHERE EdaraId = contact_ask.EdaraId) AS EdaraName, 
                (SELECT LagnaName FROM CDLagna WHERE LagnaId = contact_ask.LagnaId) AS LagnaName 
                FROM contact_ask
WHERE agreeshow = true AND adminagree = true
ORDER BY condate DESC">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSData2" runat="server" DataFile="../App_Data/contact.mdb" 
                SelectCommand="SELECT addno, LagnaId, EdaraId, coname, massage, 
                 condate, reply, 
                (SELECT EdaraName FROM CDEdara WHERE EdaraId = contact_suggest.EdaraId) AS EdaraName, 
                (SELECT LagnaName FROM CDLagna WHERE LagnaId = contact_suggest.LagnaId) AS LagnaName 
                FROM contact_suggest
WHERE agreeshow = true AND adminagree = true
ORDER BY condate DESC">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSData3" runat="server" DataFile="../App_Data/contact.mdb" 
                SelectCommand="SELECT addno, LagnaId, EdaraId, coname, massage, 
                condate, reply, 
                (SELECT EdaraName FROM CDEdara WHERE EdaraId = contact_shkwa.EdaraId) AS EdaraName, 
                (SELECT LagnaName FROM CDLagna WHERE LagnaId = contact_shkwa.LagnaId) AS LagnaName 
                FROM contact_shkwa
WHERE agreeshow = true AND adminagree = true
ORDER BY condate DESC">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSData4" runat="server" DataFile="../App_Data/contact.mdb" 
                SelectCommand="SELECT addno, LagnaId, EdaraId, coname, massage, 
                condate, reply, 
                (SELECT EdaraName FROM CDEdara WHERE EdaraId = contact_thanks.EdaraId) AS EdaraName, 
                (SELECT LagnaName FROM CDLagna WHERE LagnaId = contact_thanks.LagnaId) AS LagnaName 
                FROM contact_thanks
WHERE agreeshow = true AND adminagree = true
ORDER BY condate DESC">
            </asp:AccessDataSource>
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

<dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">تم 
    التحميل</dx:PopupControlContentControl>

</ContentCollection>
</dx:ASPxPopupControl>


    
