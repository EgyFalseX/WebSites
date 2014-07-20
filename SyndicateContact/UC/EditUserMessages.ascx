<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditUserMessages.ascx.cs" Inherits="EditUserMessages" %>
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
                    <td>
                <dx1:ASPxValidationSummary ID="ASPxVSGroup" runat="server" RightToLeft="True" 
                    ShowErrorsInEditors="True" ValidationGroup="VGroup">
                </dx1:ASPxValidationSummary>
                    </td>
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
                Font-Bold="True" Width="750px" onrowupdated="GVEditor_RowUpdated">
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
                    <dx:GridViewDataTextColumn Caption="الاسم" FieldName="coname" 
                        VisibleIndex="1" ReadOnly="True">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="النقابه" FieldName="LagnaName" 
                        VisibleIndex="7" ReadOnly="True">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="الاداره" FieldName="EdaraName" 
                        VisibleIndex="8" ReadOnly="True">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="التاريخ الرساله" FieldName="condate" 
                        VisibleIndex="5" ReadOnly="True">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataMemoColumn Caption="الرساله" FieldName="massage" 
                        VisibleIndex="4" ReadOnly="True">
                        <PropertiesMemoEdit Height="150px">
                        </PropertiesMemoEdit>
                    </dx:GridViewDataMemoColumn>
                    <dx:GridViewDataMemoColumn Caption="الرد" FieldName="reply" VisibleIndex="11">
                        <PropertiesMemoEdit Height="200px">
                        </PropertiesMemoEdit>
                    </dx:GridViewDataMemoColumn>
                    <dx:GridViewDataTextColumn Caption="التليفون" FieldName="tel" ReadOnly="True" 
                        VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="بريد اليكتروني" FieldName="mail" 
                        VisibleIndex="3" ReadOnly="True">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn Caption="اوافق على العرض" FieldName="agreeshow" 
                        ReadOnly="True" VisibleIndex="6">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataDateColumn Caption="تاريخ الرد" FieldName="replydate" 
                        ReadOnly="True" VisibleIndex="9">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy">
                        </PropertiesDateEdit>
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataCheckColumn Caption="اوافق على العرض" FieldName="adminclose" 
                        VisibleIndex="10" ReadOnly="True">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataCheckColumn>
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
                SelectCommand="SELECT addno, LagnaId, EdaraId, coname, massage, tel, mail, condate, agreeshow, adminagree, replydate, LagnaIdr, EdaraIdr, adminclose, 
                condate, reply, 
                (SELECT EdaraName FROM CDEdara WHERE EdaraId = contact_ask.EdaraId) AS EdaraName, 
                (SELECT LagnaName FROM CDLagna WHERE LagnaId = contact_ask.LagnaId) AS LagnaName 
                FROM contact_ask
WHERE adminclose = false
ORDER BY condate DESC" DeleteCommand="DELETE FROM [contact_ask] WHERE [addno] = ?" 
                UpdateCommand="UPDATE [contact_ask] SET [LagnaIdr] = ?, [EdaraIdr] = ?, [reply] = ?, [replydate] = NOW(), [adminagree] = true, [adminclose] = true ,
mail = ?
WHERE [addno] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="addno" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:SessionParameter Name="LagnaId" SessionField="LagnaId" />
                    <asp:SessionParameter Name="EdaraId" SessionField="EdaraId" />
                    <asp:Parameter Name="reply" />
                    <asp:Parameter Name="mail" />
                    <asp:Parameter Name="addno" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSData2" runat="server" DataFile="../App_Data/contact.mdb" 
                SelectCommand="SELECT addno, LagnaId, EdaraId, coname, massage, tel, mail, condate, agreeshow, adminagree, replydate, LagnaIdr, EdaraIdr, adminclose, 
                 condate, reply, 
                (SELECT EdaraName FROM CDEdara WHERE EdaraId = contact_suggest.EdaraId) AS EdaraName, 
                (SELECT LagnaName FROM CDLagna WHERE LagnaId = contact_suggest.LagnaId) AS LagnaName 
                FROM contact_suggest
WHERE adminclose = false
ORDER BY condate DESC" DeleteCommand="DELETE FROM [contact_suggest] WHERE [addno] = ?" 
                UpdateCommand="UPDATE [contact_suggest] SET [LagnaIdr] = ?, [EdaraIdr] = ?, [reply] = ?, [replydate] = NOW(), [adminagree] = true, [adminclose] = true,
mail = ? WHERE [addno] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="addno" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:SessionParameter Name="LagnaId" SessionField="LagnaId" />
                    <asp:SessionParameter Name="EdaraId" SessionField="EdaraId" />
                    <asp:Parameter Name="reply" />
                    <asp:Parameter Name="mail" />
                    <asp:Parameter Name="addno" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSData3" runat="server" DataFile="../App_Data/contact.mdb" 
                SelectCommand="SELECT addno, LagnaId, EdaraId, coname, massage, tel, mail, condate, agreeshow, adminagree, replydate, LagnaIdr, EdaraIdr, adminclose, 
                condate, reply, 
                (SELECT EdaraName FROM CDEdara WHERE EdaraId = contact_shkwa.EdaraId) AS EdaraName, 
                (SELECT LagnaName FROM CDLagna WHERE LagnaId = contact_shkwa.LagnaId) AS LagnaName 
                FROM contact_shkwa
WHERE adminclose = false
ORDER BY condate DESC" DeleteCommand="DELETE FROM [contact_shkwa] WHERE [addno] = ?" 
                UpdateCommand="UPDATE [contact_shkwa] SET [LagnaIdr] = ?, [EdaraIdr] = ?, [reply] = ?, [replydate] = NOW(), [adminagree] = true, [adminclose] = true,
mail = ? WHERE [addno] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="addno" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:SessionParameter Name="LagnaId" SessionField="LagnaId" />
                    <asp:SessionParameter Name="EdaraId" SessionField="EdaraId" />
                    <asp:Parameter Name="reply" />
                    <asp:Parameter Name="mail" />
                    <asp:Parameter Name="addno" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSData4" runat="server" DataFile="../App_Data/contact.mdb" 
                SelectCommand="SELECT addno, LagnaId, EdaraId, coname, massage, tel, mail, condate, agreeshow, adminagree, replydate, LagnaIdr, EdaraIdr, adminclose, 
                condate, reply, 
                (SELECT EdaraName FROM CDEdara WHERE EdaraId = contact_thanks.EdaraId) AS EdaraName, 
                (SELECT LagnaName FROM CDLagna WHERE LagnaId = contact_thanks.LagnaId) AS LagnaName 
                FROM contact_thanks
WHERE adminclose = false
ORDER BY condate DESC" DeleteCommand="DELETE FROM [contact_thanks] WHERE [addno] = ?" 
                UpdateCommand="UPDATE [contact_thanks] SET [LagnaIdr] = ?, [EdaraIdr] = ?, [reply] = ?, [replydate] = NOW(), [adminagree] = true, [adminclose] = true,
mail = ? WHERE [addno] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="addno" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:SessionParameter Name="LagnaId" SessionField="LagnaId" />
                    <asp:SessionParameter Name="EdaraId" SessionField="EdaraId" />
                    <asp:Parameter Name="reply" />
                    <asp:Parameter Name="mail" />
                    <asp:Parameter Name="addno" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSData1User" runat="server" DataFile="../App_Data/contact.mdb" 
                SelectCommand="SELECT addno, LagnaId, EdaraId, coname, massage, tel, mail, condate, agreeshow, adminagree, replydate, LagnaIdr, EdaraIdr, adminclose, 
                condate, reply, 
                (SELECT EdaraName FROM CDEdara WHERE EdaraId = contact_ask.EdaraId) AS EdaraName, 
                (SELECT LagnaName FROM CDLagna WHERE LagnaId = contact_ask.LagnaId) AS LagnaName 
                FROM contact_ask
WHERE adminclose = false AND LagnaId = ? AND EdaraId = ?
ORDER BY condate DESC" DeleteCommand="DELETE FROM [contact_ask] WHERE [addno] = ?" 
                
                UpdateCommand="UPDATE [contact_ask] SET [LagnaIdr] = ?, [EdaraIdr] = ?, [reply] = ?, [replydate] = NOW(), [adminagree] = true, [adminclose] = true,
mail = ? WHERE [addno] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="addno" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="LagnaId" SessionField="LagnaId" />
                    <asp:SessionParameter Name="EdaraId" SessionField="EdaraId" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:SessionParameter Name="LagnaId" SessionField="LagnaId" />
                    <asp:SessionParameter Name="EdaraId" SessionField="EdaraId" />
                    <asp:Parameter Name="reply" />
                    <asp:Parameter Name="mail" />
                    <asp:Parameter Name="addno" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSData2User" runat="server" DataFile="../App_Data/contact.mdb" 
                SelectCommand="SELECT addno, LagnaId, EdaraId, coname, massage, tel, mail, condate, agreeshow, adminagree, replydate, LagnaIdr, EdaraIdr, adminclose, 
                 condate, reply, 
                (SELECT EdaraName FROM CDEdara WHERE EdaraId = contact_suggest.EdaraId) AS EdaraName, 
                (SELECT LagnaName FROM CDLagna WHERE LagnaId = contact_suggest.LagnaId) AS LagnaName 
                FROM contact_suggest
WHERE adminclose = false AND LagnaId = ? AND EdaraId = ?
ORDER BY condate DESC" DeleteCommand="DELETE FROM [contact_suggest] WHERE [addno] = ?" 
                
                UpdateCommand="UPDATE [contact_suggest] SET [LagnaIdr] = ?, [EdaraIdr] = ?, [reply] = ?, [replydate] = NOW(), [adminagree] = true, [adminclose] = true,
mail = ? WHERE [addno] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="addno" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="LagnaId" SessionField="LagnaId" />
                    <asp:SessionParameter Name="EdaraId" SessionField="EdaraId" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:SessionParameter Name="LagnaId" SessionField="LagnaId" />
                    <asp:SessionParameter Name="EdaraId" SessionField="EdaraId" />
                    <asp:Parameter Name="reply" />
                    <asp:Parameter Name="mail" />
                    <asp:Parameter Name="addno" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSData3User" runat="server" DataFile="../App_Data/contact.mdb" 
                SelectCommand="SELECT addno, LagnaId, EdaraId, coname, massage, tel, mail, condate, agreeshow, adminagree, replydate, LagnaIdr, EdaraIdr, adminclose, 
                condate, reply, 
                (SELECT EdaraName FROM CDEdara WHERE EdaraId = contact_shkwa.EdaraId) AS EdaraName, 
                (SELECT LagnaName FROM CDLagna WHERE LagnaId = contact_shkwa.LagnaId) AS LagnaName 
                FROM contact_shkwa
WHERE adminclose = false AND LagnaId = ? AND EdaraId = ?
ORDER BY condate DESC" DeleteCommand="DELETE FROM [contact_shkwa] WHERE [addno] = ?" 
                
                UpdateCommand="UPDATE [contact_shkwa] SET [LagnaIdr] = ?, [EdaraIdr] = ?, [reply] = ?, [replydate] = NOW(), [adminagree] = true, [adminclose] = true,
mail = ? WHERE [addno] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="addno" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="LagnaId" SessionField="LagnaId" />
                    <asp:SessionParameter Name="EdaraId" SessionField="EdaraId" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:SessionParameter Name="LagnaId" SessionField="LagnaId" />
                    <asp:SessionParameter Name="EdaraId" SessionField="EdaraId" />
                    <asp:Parameter Name="reply" />
                    <asp:Parameter Name="mail" />
                    <asp:Parameter Name="addno" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSData4User" runat="server" DataFile="../App_Data/contact.mdb" 
                SelectCommand="SELECT addno, LagnaId, EdaraId, coname, massage, tel, mail, condate, agreeshow, adminagree, replydate, LagnaIdr, EdaraIdr, adminclose, 
                condate, reply, 
                (SELECT EdaraName FROM CDEdara WHERE EdaraId = contact_thanks.EdaraId) AS EdaraName, 
                (SELECT LagnaName FROM CDLagna WHERE LagnaId = contact_thanks.LagnaId) AS LagnaName 
                FROM contact_thanks
WHERE adminclose = false AND LagnaId = ? AND EdaraId = ?
ORDER BY condate DESC" DeleteCommand="DELETE FROM [contact_thanks] WHERE [addno] = ?" 
                
                UpdateCommand="UPDATE [contact_thanks] SET [LagnaIdr] = ?, [EdaraIdr] = ?, [reply] = ?, [replydate] = NOW(), [adminagree] = true, [adminclose] = true,
mail = ? WHERE [addno] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="addno" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:SessionParameter Name="LagnaId" SessionField="LagnaId" />
                    <asp:SessionParameter Name="EdaraId" SessionField="EdaraId" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:SessionParameter Name="LagnaId" SessionField="LagnaId" />
                    <asp:SessionParameter Name="EdaraId" SessionField="EdaraId" />
                    <asp:Parameter Name="reply" />
                    <asp:Parameter Name="mail" />
                    <asp:Parameter Name="addno" />
                </UpdateParameters>
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


    
