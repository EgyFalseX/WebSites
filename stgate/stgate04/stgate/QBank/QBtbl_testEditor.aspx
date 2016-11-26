<%@ Page Title="" Language="C#" MasterPageFile="../masterst.master" AutoEventWireup="true" CodeFile="QBtbl_testEditor.aspx.cs" Inherits="QBtbl_testEditor" %>
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
                    datasourceid="DSData" keyfieldname="testId" righttoleft="True" summarytext="الملخص"
                    cssfilepath="../App_Themes/PlasticBlue/{0}/styles.css"
                    csspostfix="PlasticBlue" enabletheming="True"
                    onrowdeleted="GVEditor_RowDeleted" onrowupdated="GVEditor_RowUpdated"
                    onrowinserted="GVEditor_RowInserted"
                    font-bold="True" enablecallbacks="False" OnRowInserting="GVEditor_RowInserting" OnRowUpdating="GVEditor_RowUpdating">
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
                    <dx:GridViewDataComboBoxColumn Caption="العام الدراسي" FieldName="asasecode" VisibleIndex="1">
                        <PropertiesComboBox DataSourceID="DSDataasase" TextField="asase_year" ValueField="asase_code">
                            <Columns>
                                <dx:ListBoxColumn FieldName="asase_year" />
                            </Columns>
                        </PropertiesComboBox>
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="الترم" FieldName="code_al_fasl" VisibleIndex="2">
                        <PropertiesComboBox DataSourceID="DSDatacode_fasl" TextField="name_al_fasl" ValueField="code_al_fasl">
                            <Columns>
                                <dx:ListBoxColumn FieldName="name_al_fasl" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="الصف" FieldName="alsofof_code" VisibleIndex="3">
                        <PropertiesComboBox DataSourceID="DSDataalsofof" TextField="alsofof_name" ValueField="alsofof_code">
                            <Columns>
                                <dx:ListBoxColumn FieldName="alsofof_name" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="المادة" FieldName="mawad_no" VisibleIndex="4">
                        <PropertiesComboBox DataSourceID="DSDatamawad" TextField="mowad_name" ValueField="mawad_no">
                            <Columns>
                                <dx:ListBoxColumn FieldName="mowad_name" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="المستوى" FieldName="levelid" VisibleIndex="5">
                        <PropertiesComboBox DataSourceID="DSDatacdlevel" TextField="levelname" ValueField="levelid">
                            <Columns>
                                <dx:ListBoxColumn FieldName="levelname" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="نوع الاختبار" FieldName="testtypeid" VisibleIndex="6">
                        <PropertiesComboBox DataSourceID="DSDatacd_testtype" TextField="testtypename" ValueField="testtypeid">
                            <Columns>
                                <dx:ListBoxColumn FieldName="testtypename" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn Caption="رقم الاختبار" FieldName="testorder" VisibleIndex="7">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn Caption="مفعل" FieldName="testactive" VisibleIndex="8">
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataDateColumn Caption="تاريخ التفعيل" FieldName="activedate" VisibleIndex="9">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy">
                        </PropertiesDateEdit>
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataDateColumn>
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
                    DeleteCommand="DELETE FROM [tbl_test] WHERE [testId] = ?" InsertCommand="INSERT INTO [tbl_test] ([asasecode], [code_al_fasl], [alsofof_code], [mawad_no], [levelid], [testtypeid], [testorder], [testactive], [activedate], [datein], [userin]) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
                    SelectCommand="SELECT [testId], [asasecode], [code_al_fasl], [alsofof_code], [mawad_no], [levelid], [testtypeid], [testorder], [testactive], [activedate], [datein], [userin] FROM [tbl_test]"
                    UpdateCommand="UPDATE [tbl_test] SET [asasecode] = ?, [code_al_fasl] = ?, [alsofof_code] = ?, [mawad_no] = ?, [levelid] = ?, [testtypeid] = ?, [testorder] = ?, [testactive] = ?, [activedate] = ?, [datein] = ?, [userin] = ? WHERE [testId] = ?" OnInserting="DSData_Inserting">
                    <DeleteParameters>
                        <asp:Parameter Name="testId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="asasecode" Type="Int32" />
                        <asp:Parameter Name="code_al_fasl" Type="Int32" />
                        <asp:Parameter Name="alsofof_code" Type="Byte" />
                        <asp:Parameter Name="mawad_no" Type="Int16" />
                        <asp:Parameter Name="levelid" Type="Byte" />
                        <asp:Parameter Name="testtypeid" Type="Byte" />
                        <asp:Parameter Name="testorder" Type="Byte" />
                        <asp:Parameter Name="testactive" Type="Boolean" />
                        <asp:Parameter Name="activedate" Type="DateTime" />
                        <asp:Parameter Name="datein" Type="DateTime" />
                        <asp:Parameter Name="userin" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="asasecode" Type="Int32" />
                        <asp:Parameter Name="code_al_fasl" Type="Int32" />
                        <asp:Parameter Name="alsofof_code" Type="Byte" />
                        <asp:Parameter Name="mawad_no" Type="Int16" />
                        <asp:Parameter Name="levelid" Type="Byte" />
                        <asp:Parameter Name="testtypeid" Type="Byte" />
                        <asp:Parameter Name="testorder" Type="Byte" />
                        <asp:Parameter Name="testactive" Type="Boolean" />
                        <asp:Parameter Name="activedate" Type="DateTime" />
                        <asp:Parameter Name="datein" Type="DateTime" />
                        <asp:Parameter Name="userin" Type="Int32" />
                        <asp:Parameter Name="testId" Type="Int32" />
                    </UpdateParameters>
                </asp:AccessDataSource>
                <asp:AccessDataSource ID="DSDataasase" runat="server" DataFile="../data/asase.mdb"
                    SelectCommand="SELECT [asase_code], [asase_year] FROM [asase]">
                </asp:AccessDataSource>
                <asp:AccessDataSource ID="DSDatacode_fasl" runat="server" DataFile="../data/QBank.mdb"
                    SelectCommand="SELECT [code_al_fasl], [name_al_fasl] FROM [code_fasl]">
                </asp:AccessDataSource>
                <asp:AccessDataSource ID="DSDataalsofof" runat="server" DataFile="../data/QBank.mdb"
                    SelectCommand="SELECT [alsofof_code], [alsofof_name] FROM [alsofof]">
                </asp:AccessDataSource>
                <asp:AccessDataSource ID="DSDatamawad" runat="server" DataFile="../data/QBank.mdb"
                    SelectCommand="SELECT [mawad_no], [mowad_name] FROM [mawad]">
                </asp:AccessDataSource>
                <asp:AccessDataSource ID="DSDatacdlevel" runat="server" DataFile="../data/QBank.mdb"
                    SelectCommand="SELECT [levelid], [levelname] FROM [cdlevel]">
                </asp:AccessDataSource>
                <asp:AccessDataSource ID="DSDatacd_testtype" runat="server" DataFile="../data/QBank.mdb"
                    SelectCommand="SELECT [testtypeid], [testtypename] FROM [cd_testtype]">
                </asp:AccessDataSource>
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

