<%@ Page Title="" Language="C#" MasterPageFile="../masterst.master" AutoEventWireup="true" CodeFile="QBLoginEditor.aspx.cs" Inherits="QBLoginEditor" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView.Export" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">


    <table align="center">
        <tr>
            <td dir="ltr">
                <dx:aspxcombobox id="CBExporter" runat="server" cssfilepath="../App_Themes/PlasticBlue/{0}/styles.css"
                    csspostfix="PlasticBlue" onbuttonclick="CBExporter_ButtonClick" spacing="0" spritecssfilepath="../App_Themes/PlasticBlue/{0}/sprite.css">
                <Items>
                    <dx:ListEditItem Text="Rtf" Value="Rtf" />
                    <dx:ListEditItem Text="Pdf" Value="Pdf" />
                    <dx:ListEditItem Text="Xls" Value="Xls" />
                    <dx:ListEditItem Text="Xlsx" Value="Xlsx" />
                    <dx:ListEditItem Text="Csv" Value="Csv" />
                </Items>
                <LoadingPanelImage Url="../App_Themes/PlasticBlue/Editors/Loading.gif">
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
            </dx:aspxcombobox>
            </td>
        </tr>
        <tr>
            <td style="direction: ltr">
                <dx:aspxgridview id="GVEditor" runat="server" autogeneratecolumns="False" caption="البيــــــــــا نـــــــــــــــات"
                    datasourceid="DSData" keyfieldname="id" righttoleft="True" summarytext="الملخص"
                    cssfilepath="../App_Themes/PlasticBlue/{0}/styles.css"
                    csspostfix="PlasticBlue" enabletheming="True"
                    onrowdeleted="GVEditor_RowDeleted" onrowupdated="GVEditor_RowUpdated"
                    onrowinserted="GVEditor_RowInserted"
                    font-bold="True" enablecallbacks="False">
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
                    <dx:ASPxSummaryItem DisplayFormat="العـدد : {0}" FieldName="addno" ShowInColumn="coname"
                        ShowInGroupFooterColumn="coname" SummaryType="Count" />
                </TotalSummary>
                <Columns>
                    <dx:GridViewCommandColumn ButtonType="Image" Caption="العمليات" VisibleIndex="0">
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
                    <dx:GridViewDataCheckColumn Caption="مدير" FieldName="isadmin" VisibleIndex="3">
                        <PropertiesCheckEdit DisplayFormatString="dd/MM/yyyy">
                        </PropertiesCheckEdit>
                        <EditFormSettings CaptionLocation="Top" RowSpan="1" />
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataTextColumn VisibleIndex="1" Caption="الاسم" FieldName="user">
                        <EditFormSettings CaptionLocation="Top" RowSpan="1" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="كلمة المرور" VisibleIndex="2" 
                        FieldName="pass">
                        <EditFormSettings CaptionLocation="Top" RowSpan="1" />
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" SortMode="DisplayText"
                    ColumnResizeMode="NextColumn" />
                <SettingsPager>
                    <Summary AllPagesText="صفحات :  {0} - {1} ({2} عناصر)" Position="Right" Text="صفحه {0} of {1} ({2} عنصر)" />
                </SettingsPager>
                <Settings ShowFilterBar="Visible" ShowFilterRow="True" ShowFilterRowMenu="True" ShowFooter="True"
                    ShowGroupPanel="True" ShowHeaderFilterButton="True" ShowTitlePanel="True" />
                <SettingsText CommandCancel="الغاء" CommandClearFilter="مسح التصفيه" CommandDelete="حذف"
                    CommandEdit="تعديل" CommandNew="جديد" CommandSelect="اختار" CommandUpdate="تحديث"
                    ConfirmDelete="هل انت متأكد؟" CustomizationWindowCaption="خيارات" EmptyDataRow="فارغ"
                    EmptyHeaders="راس فارغ" FilterBarClear="مسح التصفبه" FilterBarCreateFilter="صناعة تصفيه"
                    FilterControlPopupCaption="خيارات التصفيه" GroupContinuedOnNextPage="تستكمل المجموعه في الصفحه القادمه"
                    GroupPanel="اسحب عمود ثم افلته هنا لصناعه مجموعه" HeaderFilterShowAll="اظهار الكل"
                    HeaderFilterShowBlanks="اظهار الفارغ" HeaderFilterShowNonBlanks="اظهار غير الفارغ"
                    PopupEditFormCaption="صفحة المحرر" />
                <Images SpriteCssFilePath="../App_Themes/PlasticBlue/{0}/sprite.css">
                    <LoadingPanelOnStatusBar Url="../App_Themes/PlasticBlue/GridView/StatusBarLoading.gif">
                    </LoadingPanelOnStatusBar>
                    <LoadingPanel Url="../App_Themes/PlasticBlue/GridView/Loading.gif">
                    </LoadingPanel>
                </Images>
                <ImagesFilterControl>
                    <LoadingPanel Url="../App_Themes/PlasticBlue/GridView/Loading.gif">
                    </LoadingPanel>
                </ImagesFilterControl>
                <Styles CssFilePath="../App_Themes/PlasticBlue/{0}/styles.css" CssPostfix="PlasticBlue">
                    <Header ImageSpacing="5px" SortingImageSpacing="5px" Font-Bold="False" Font-Size="Medium"
                        HorizontalAlign="Center">
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
            </dx:aspxgridview>
                <dx:aspxgridviewexporter id="ASPxGridViewExporterEditor" runat="server" filename="ContactUSFX"
                    gridviewid="GVEditor" paperkind="A4">
            </dx:aspxgridviewexporter>
                <asp:AccessDataSource ID="DSData" runat="server" DataFile="../data/QBank.mdb"
                    DeleteCommand="DELETE FROM anasadmin WHERE (id = ?)" InsertCommand="INSERT INTO anasadmin([user], pass, isadmin) VALUES (?, ?, ?)"
                    SelectCommand="SELECT [id], [user], [pass], [isadmin] FROM [anasadmin]"
                    UpdateCommand="UPDATE anasadmin SET [user] = ?, pass = ?, isadmin = ? WHERE (id = ?)">
                    <DeleteParameters>
                        <asp:Parameter Name="id" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="user" />
                        <asp:Parameter Name="pass" />
                        <asp:Parameter Name="isadmin" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="user" />
                        <asp:Parameter Name="pass" />
                        <asp:Parameter Name="isadmin" />
                        <asp:Parameter Name="id" />
                    </UpdateParameters>
                </asp:AccessDataSource>
                <asp:AccessDataSource ID="DSalsofof" runat="server" DataFile="../App_Data/home_work.mdb"
                    SelectCommand="SELECT [alsofof_code], [alsofof_name] FROM [alsofof]"></asp:AccessDataSource>
                <asp:AccessDataSource ID="DSfasl" runat="server" DataFile="../App_Data/home_work.mdb"
                    SelectCommand="SELECT [fasl_code], [fasl_name] FROM [fasl]"></asp:AccessDataSource>
            </td>
        </tr>
    </table>
    <dx:aspxpopupcontrol id="ASPxPopupControlEditor" runat="server" allowdragging="True"
        clientinstancename="popupeditor" cssfilepath="../App_Themes/PlasticBlue/{0}/styles.css"
        csspostfix="PlasticBlue" headertext="رسالـــه" minheight="80px" minwidth="200px" modal="True"
        popuphorizontalalign="WindowCenter" popupverticalalign="WindowCenter" righttoleft="True"
        spritecssfilepath="../App_Themes/PlasticBlue/{0}/sprite.css" height="120px" width="300px"
        style="text-align: center" font-bold="False">
    <LoadingPanelImage Url="../App_Themes/PlasticBlue/Web/Loading.gif">
    </LoadingPanelImage>
    <ContentStyle Font-Bold="True" Font-Size="Medium" Font-Underline="False" HorizontalAlign="Center"
        VerticalAlign="Middle">
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
</dx:aspxpopupcontrol>


</asp:Content>

