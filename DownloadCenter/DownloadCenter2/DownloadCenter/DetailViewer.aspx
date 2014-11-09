<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="DetailViewer.aspx.cs" Inherits="centerEditor" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
<body>

<table align="center">
    <tr>
        <td dir="ltr" colspan="2">
            <dx:ASPxComboBox ID="CBExporter" runat="server" 
                CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue" 
                onbuttonclick="CBExporter_ButtonClick" 
                SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css">
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
        <td colspan="2" style="text-align: center">
            <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="Large" NavigateUrl="~/DownloadCenter/centerEditor.aspx">رجوع للمكتبة</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td style="text-align: right">
            <asp:Label ID="lblParentName" runat="server" Text="Label"></asp:Label>
        </td>
        <td style="text-align: right">
            <asp:Label ID="lblParentName0" runat="server" Text="المؤسسة"></asp:Label>
        </td>
    </tr>
    <tr>
        <td style="text-align: right">
            <asp:Label ID="lblNumber" runat="server" Text="Label"></asp:Label>
        </td>
        <td style="text-align: right">
            <asp:Label ID="lblParentName1" runat="server" Text="رقم الاستمارة"></asp:Label>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <dx:ASPxGridView ID="GVEditor" runat="server" AutoGenerateColumns="False" 
                Caption="البيــــــــــا نـــــــــــــــات" DataSourceID="DSData" 
                KeyFieldName="aa" RightToLeft="True" 
                SummaryText="الملخص" CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" 
                CssPostfix="PlasticBlue" EnableTheming="True" 
                onrowdeleted="GVEditor_RowDeleted" onrowupdated="GVEditor_RowUpdated" 
                onrowinserted="GVEditor_RowInserted" Font-Bold="True" 
                oncancelrowediting="GVEditor_CancelRowEditing" 
                onrowdeleting="GVEditor_RowDeleting" 
                onstartrowediting="GVEditor_StartRowEditing" Theme="SoftOrange">
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
                            <Image Url="images/edit.png" Width="26px">
                            </Image>
                        </EditButton>
                        <NewButton Visible="True">
                            <Image Url="images/insert.png" Width="26px">
                            </Image>
                        </NewButton>
                        <DeleteButton Text="حذف" Visible="True">
                            <Image Url="images/delete.png" Width="26px">
                            </Image>
                        </DeleteButton>
                        <SelectButton>
                            <Image Url="images/accept.png">
                            </Image>
                        </SelectButton>
                        <CancelButton>
                            <Image Url="images/delete.png">
                            </Image>
                        </CancelButton>
                        <UpdateButton>
                            <Image Url="images/accept.png">
                            </Image>
                        </UpdateButton>
                        <ClearFilterButton Visible="True">
                        </ClearFilterButton>
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataComboBoxColumn Caption="نوع المهمة" FieldName="type_prog_id" VisibleIndex="1">
                        <PropertiesComboBox TextField="faslname" ValueField="faslcode" Width="200px" DataSourceID="DStype_prog" DropDownStyle="DropDown">
                        </PropertiesComboBox>
                        <EditFormSettings ColumnSpan="2" CaptionLocation="Top" />
                        <EditCellStyle Font-Size="Large">
                        </EditCellStyle>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn Caption="المهمة" FieldName="task" VisibleIndex="2">
                        <PropertiesTextEdit Width="200px">
                        </PropertiesTextEdit>
                        <EditFormSettings ColumnSpan="2" CaptionLocation="Top" />
                        <EditCellStyle Font-Size="Large">
                        </EditCellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn Caption="التاريخ المقدر الانتهاء" FieldName="datetofinsh" VisibleIndex="3">
                        <PropertiesDateEdit Width="200px">
                        </PropertiesDateEdit>
                        <EditFormSettings ColumnSpan="2" CaptionLocation="Top" />
                        <EditCellStyle Font-Size="Large">
                        </EditCellStyle>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn Caption="تاريخ الانتهاء" FieldName="finishdate" VisibleIndex="4">
                        <PropertiesDateEdit Width="200px">
                        </PropertiesDateEdit>
                        <EditFormSettings ColumnSpan="2" CaptionLocation="Top" />
                        <EditCellStyle Font-Size="Large">
                        </EditCellStyle>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataCheckColumn Caption="تم الانتهاء" FieldName="finish" VisibleIndex="5">
                        <EditFormSettings ColumnSpan="2" CaptionLocation="Top" />
                        <EditCellStyle Font-Size="Large">
                        </EditCellStyle>
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataComboBoxColumn Caption="المسئول" FieldName="empid" VisibleIndex="6">
                        <PropertiesComboBox DataSourceID="DScode_fasl" TextField="name_al_fasl" ValueField="code_al_fasl" Width="200px" DropDownStyle="DropDown">
                        </PropertiesComboBox>
                        <EditFormSettings ColumnSpan="2" CaptionLocation="Top" />
                        <EditCellStyle Font-Size="Large">
                        </EditCellStyle>
                    </dx:GridViewDataComboBoxColumn>
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
                <SettingsEditing EditFormColumnCount="4" />
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
                DataFile="~/App_Data/egycsfolow.mdb" 
                DeleteCommand="DELETE FROM [download] WHERE [aa] = ?" 
                InsertCommand="INSERT INTO [download] ([id_prog], [type_prog_id], [task], [datetofinsh], [finishdate], [finish], [empid]) VALUES (?, ?, ?, ?, ?, ?, ?)" 
                SelectCommand="SELECT [id_prog], [type_prog_id], [task], [datetofinsh], [finishdate], [finish], [empid], [aa] FROM [download] WHERE ([id_prog] = ?)" 
                UpdateCommand="UPDATE [download] SET  [type_prog_id] = ?, [task] = ?, [datetofinsh] = ?, [finishdate] = ?, [finish] = ?, [empid] = ? WHERE [aa] = ?" 
                OnSelecting="DSData_Selecting" oninserting="DSData_Inserting" 
                onupdating="DSData_Updating">
                <DeleteParameters>
                    <asp:Parameter Name="aa" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:QueryStringParameter DefaultValue="0" Name="id_prog" QueryStringField="id" Type="Int32" />
                    <asp:Parameter Name="type_prog_id" Type="Byte" />
                    <asp:Parameter Name="task" Type="String" />
                    <asp:Parameter Name="datetofinsh" Type="DateTime" />
                    <asp:Parameter Name="finishdate" Type="DateTime" />
                    <asp:Parameter Name="finish" Type="Boolean" />
                    <asp:Parameter Name="empid" Type="Byte" />
                </InsertParameters>
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="0" Name="id_prog" QueryStringField="id" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="type_prog_id" Type="Byte" />
                    <asp:Parameter Name="task" Type="String" />
                    <asp:Parameter Name="datetofinsh" Type="DateTime" />
                    <asp:Parameter Name="finishdate" Type="DateTime" />
                    <asp:Parameter Name="finish" Type="Boolean" />
                    <asp:Parameter Name="empid" Type="Byte" />
                    <asp:Parameter Name="aa" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DScode_fasl" runat="server" 
                DataFile="~/App_Data/egycsfolow.mdb" 
                
                
                SelectCommand="SELECT [code_al_fasl], [name_al_fasl] FROM [code_fasl]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSalsofof" runat="server" 
                DataFile="~/App_Data/egycsfolow.mdb" 
                
                
                SelectCommand="SELECT [alsofof_code], [alsofof_name] FROM [alsofof]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DStype_prog" runat="server" 
                DataFile="~/App_Data/egycsfolow.mdb" 
                
                
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

