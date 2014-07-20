<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="zdataEditor.aspx.cs" Inherits="zdataEditor" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    

<table align="center">
    <tr>
        <td>
            <dx:ASPxGridView ID="GVEditor" runat="server" AutoGenerateColumns="False" 
                Caption="البيــــــــــا نـــــــــــــــات" DataSourceID="DSData" 
                KeyFieldName="memberid" RightToLeft="True" 
                SummaryText="الملخص" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" 
                CssPostfix="PlasticBlue" EnableTheming="True" Font-Bold="True" ClientInstanceName="GVEditor">
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
<dx:GridViewDataTextColumn FieldName="memberid" Caption="كود" VisibleIndex="0" Name="memberid">
    <DataItemTemplate>
        <dx:ASPxLabel ID="lbl" runat="server" Text='<%# Eval("memberid") %>' ClientInstanceName="lbl">
        </dx:ASPxLabel>
    </DataItemTemplate>
</dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="المرتب" FieldName="salary" VisibleIndex="5" Name="salary">
                        <DataItemTemplate>
                            <dx:ASPxTextBox ID="txt" runat="server" Text='<%# Eval("salary") %>' Width="170px">
                            </dx:ASPxTextBox>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="ملاحظات" FieldName="rema" VisibleIndex="7">
                        <DataItemTemplate>
                            <dx:ASPxTextBox ID="txt" runat="server" Text='<%# Eval("rema") %>' Width="170px">
                            </dx:ASPxTextBox>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" 
                    SortMode="DisplayText" ColumnResizeMode="Control" />
                <SettingsPager ShowDefaultImages="False" NumericButtonCount="40" PageSize="40">
                    <AllButton Text="All">
                    </AllButton>
                    <NextPageButton Text="Next &gt;">
                    </NextPageButton>
                    <PrevPageButton Text="&lt; Prev">
                    </PrevPageButton>
                    <Summary AllPagesText="صفحات :  {0} - {1} ({2} عناصر)" Position="Right" 
                        Text="صفحه {0} of {1} ({2} عنصر)" />
                </SettingsPager>
                <SettingsEditing Mode="PopupEditForm" />
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
                <SettingsPopup>
                    <EditForm AllowResize="True" HorizontalAlign="Center" Modal="True" />
                </SettingsPopup>
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
            <asp:AccessDataSource ID="DSData" runat="server" 
                DataFile="~/App_Data/41.mdb" 
                SelectCommand="SELECT memberid, membernid, schoolcode, NAME, bdate, taeendate, salary, userin, datein, rema FROM zdata ORDER BY memberid" UpdateCommand="UPDATE zdata SET salary = ?, rema  = ?, userin = ?, datein = ? WHERE (memberid = ?)">
                <UpdateParameters>
                    <asp:Parameter Name="salary" />
                    <asp:Parameter Name="rema" />
                    <asp:SessionParameter DefaultValue="-1" Name="userin" SessionField="UserIDZamala" />
                    <asp:Parameter Name="datein" />
                    <asp:Parameter Name="memberid" />
                </UpdateParameters>
            </asp:AccessDataSource>
        </td>
    </tr>
    </table>
    <p>
    </p>
    <table align="center">
    <tr>
        <td style="text-align: center">
            <dx:ASPxLabel ID="lblState" runat="server" Font-Bold="True" ForeColor="Green" Font-Size="Large">
            </dx:ASPxLabel>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            <dx:ASPxButton ID="btnSave" runat="server" OnClick="btnSave_Click" Text="حفظ" Width="150px">
            </dx:ASPxButton>
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


 
</asp:Content>