<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="GeneralfollowViewer.aspx.cs" Inherits="GeneralfollowViewer" %>
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
        <td dir="ltr">
            <dx:ASPxComboBox ID="CBExporter" runat="server" 
                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                onbuttonclick="CBExporter_ButtonClick" 
                SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css" 
                Theme="SoftOrange">
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
        <td style="text-align: center">
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            <dx:ASPxGridView ID="GVEditor" runat="server" AutoGenerateColumns="False" 
                Caption="البيــــــــــا نـــــــــــــــات" DataSourceID="DSData" 
                KeyFieldName="gfollowid" RightToLeft="True" 
                SummaryText="الملخص" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" 
                CssPostfix="PlasticBlue" EnableTheming="True" 
                onrowdeleted="GVEditor_RowDeleted" onrowupdated="GVEditor_RowUpdated" 
                onrowinserted="GVEditor_RowInserted" Font-Bold="True" Theme="SoftOrange">
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
                    <dx:GridViewDataComboBoxColumn Caption="نوع المتابعة" FieldName="followtypeid" VisibleIndex="4">
                        <PropertiesComboBox DataSourceID="DSfollowtype" DropDownStyle="DropDown" IncrementalFilteringMode="Contains" TextField="followtype" ValueField="followtypeid" EnableCallbackMode="True">
                        </PropertiesComboBox>
                        <Settings AllowAutoFilter="True" AllowHeaderFilter="True" AllowSort="True" ShowFilterRowMenu="True" ShowInFilterControl="True" />
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataDateColumn Caption="تاريخ المتابعة" FieldName="followdate" VisibleIndex="5">
                        <PropertiesDateEdit DisplayFormatString="d/M/yyyy">
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataMemoColumn Caption="المتابعة" FieldName="followtext" VisibleIndex="7">
                        <PropertiesMemoEdit Height="80px">
                        </PropertiesMemoEdit>
                    </dx:GridViewDataMemoColumn>
                    <dx:GridViewDataComboBoxColumn Caption="الصف" FieldName="alsofof_code" VisibleIndex="2">
                        <PropertiesComboBox DataSourceID="DSSaf" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="Contains" TextField="alsofof_name" ValueField="alsofof_code">
                        </PropertiesComboBox>
                        <Settings AllowAutoFilter="True" AllowHeaderFilter="True" AllowSort="True" AutoFilterCondition="BeginsWith" ShowFilterRowMenu="True" ShowFilterRowMenuLikeItem="True" ShowInFilterControl="True" />
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="الفصل" FieldName="faslcode" VisibleIndex="3">
                        <PropertiesComboBox DataSourceID="DSFasl" DropDownStyle="DropDown" EnableCallbackMode="True" IncrementalFilteringMode="Contains" TextField="faslname" ValueField="faslcode">
                        </PropertiesComboBox>
                        <Settings AllowAutoFilter="True" AllowHeaderFilter="True" AllowSort="True" AutoFilterCondition="BeginsWith" ShowFilterRowMenu="True" ShowFilterRowMenuLikeItem="True" ShowInFilterControl="True" />
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="العام الدراسي" FieldName="asase_code" VisibleIndex="1">
                        <PropertiesComboBox DataSourceID="DSasase" TextField="asase_year" ValueField="asase_code">
                        </PropertiesComboBox>
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataComboBoxColumn>
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" 
                    SortMode="DisplayText" ColumnResizeMode="Control" />
                <SettingsPager ShowDefaultImages="False" PageSize="40">
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
                <SettingsPopup>
                    <EditForm AllowResize="True" HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="Above" />
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
                DataFile="Data/studentfollow.mdb" 
                DeleteCommand="DELETE FROM [Generalfollow] WHERE [gfollowid] = ?" 
                InsertCommand="INSERT INTO [Generalfollow] ( [asase_code], [alsofof_code], [faslcode], [followtypeid], [followdate], [followtext], [id]) VALUES (?, ?, ?, ?, ?, ?, ?)" 
                SelectCommand="SELECT [gfollowid], [asase_code], [alsofof_code], [faslcode], [followtypeid], [followdate], [followtext], [id] FROM [Generalfollow] ORDER BY [gfollowid] DESC" 
                UpdateCommand="UPDATE [Generalfollow] SET [asase_code] = ?, [alsofof_code] = ?, [faslcode] = ?, [followtypeid] = ?, [followdate] = ?, [followtext] = ?, [id] = ? WHERE [gfollowid] = ?" OnInserting="DSData_Inserting" OnUpdating="DSData_Updating">
                <DeleteParameters>
                    <asp:Parameter Name="gfollowid" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="asase_code" Type="Byte" />
                    <asp:Parameter Name="alsofof_code" Type="Byte" />
                    <asp:Parameter Name="faslcode" Type="Byte" />
                    <asp:Parameter Name="followtypeid" Type="Byte" />
                    <asp:Parameter Name="followdate" Type="DateTime" />
                    <asp:Parameter Name="followtext" Type="String" />
                    <asp:SessionParameter Name="id" SessionField="UserIDstudentfollow" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="asase_code" Type="Byte" />
                    <asp:Parameter Name="alsofof_code" Type="Byte" />
                    <asp:Parameter Name="faslcode" Type="Byte" />
                    <asp:Parameter Name="followtypeid" Type="Byte" />
                    <asp:Parameter Name="followdate" Type="DateTime" />
                    <asp:Parameter Name="followtext" Type="String" />
                    <asp:SessionParameter Name="id" SessionField="UserIDstudentfollow" Type="Int32" />
                    <asp:Parameter Name="gfollowid" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSfollowtype" runat="server" 
                DataFile="Data/studentfollow.mdb" 
                SelectCommand="SELECT [followtypeid], [followtype] FROM [followtype]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSasase" runat="server" 
                DataFile="~/desoft/code/asase.mdb" 
                SelectCommand="SELECT [asase_code], [asase_year] FROM [asase] ORDER BY [alsofof_code] DESC">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSSaf" runat="server" 
                DataFile="Data/studentfollow.mdb" 
                SelectCommand="SELECT [alsofof_code], [alsofof_name] FROM [alsofof]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSFasl" runat="server" 
                DataFile="Data/studentfollow.mdb" 
                SelectCommand="SELECT [faslcode], [faslname] FROM [fasl]">
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
    Font-Bold="False" Theme="SoftOrange">
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

