<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ContactUsEditor.ascx.cs" Inherits="ContactUsEditor" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>

<table align="center">
    <tr>
        <td dir="ltr">
            <dx:ASPxComboBox ID="CBExporter" runat="server" 
                CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" 
                onbuttonclick="CBExporter_ButtonClick" Spacing="0" 
                SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css">
                <Items>
                    <dx:ListEditItem Text="Rtf" Value="Rtf" />
                    <dx:ListEditItem Text="Pdf" Value="Pdf" />
                    <dx:ListEditItem Text="Xls" Value="Xls" />
                    <dx:ListEditItem Text="Xlsx" Value="Xlsx" />
                    <dx:ListEditItem Text="Csv" Value="Csv" />
                </Items>
                <LoadingPanelImage Url="../App_Themes/DevEx/Editors/Loading.gif">
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
            </dx:ASPxComboBox>
        </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxGridView ID="GVEditor" runat="server" AutoGenerateColumns="False" 
                Caption="راســـــــــــــلنا" DataSourceID="DSData" 
                KeyFieldName="addno" RightToLeft="True" 
                SummaryText="الملخص" CssFilePath="../App_Themes/DevEx/{0}/styles.css" 
                CssPostfix="DevEx" EnableTheming="True" Width="850px" 
                onrowdeleted="GVEditor_RowDeleted" onrowupdated="GVEditor_RowUpdated" 
                onrowupdating="GVEditor_RowUpdating">
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
                            <Image Url="../images/insert.png">
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
                    <dx:GridViewDataTextColumn Caption="الاسم" FieldName="coname" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataComboBoxColumn Caption="الصفه" FieldName="sefaid" 
                        VisibleIndex="2">
                        <PropertiesComboBox DataSourceID="DSsefa" TextField="sefa" ValueField="sefaid" 
                            ValueType="System.Int32">
                            <Columns>
                                <dx:ListBoxColumn Caption="اسم الصفه" FieldName="sefa" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataComboBoxColumn Caption="نوع الرساله" FieldName="contypeid" 
                        VisibleIndex="3">
                        <PropertiesComboBox DataSourceID="DScontype" TextField="contype" 
                            ValueField="contypeid" ValueType="System.Int32">
                            <Columns>
                                <dx:ListBoxColumn Caption="اسم نوع الرساله" FieldName="contype" />
                            </Columns>
                        </PropertiesComboBox>
                    </dx:GridViewDataComboBoxColumn>
                    <dx:GridViewDataTextColumn Caption="تليفون" FieldName="tel" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="البريد" FieldName="mail" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataMemoColumn Caption="نص الرساله" FieldName="massage" 
                        VisibleIndex="7">
                        <PropertiesMemoEdit DisplayFormatInEditMode="True" Height="150px">
                        </PropertiesMemoEdit>
                        <CellStyle Wrap="False">
                        </CellStyle>
                    </dx:GridViewDataMemoColumn>
                    <dx:GridViewDataDateColumn Caption="تاريخ الرساله" FieldName="condate" 
                        VisibleIndex="6">
                        <PropertiesDateEdit DisplayFormatString="d/M/yyyy">
                        </PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataMemoColumn Caption="الـــرد" FieldName="rply" VisibleIndex="8">
                        <PropertiesMemoEdit DisplayFormatInEditMode="True" Height="150px">
                        </PropertiesMemoEdit>
                        <CellStyle Wrap="False">
                        </CellStyle>
                    </dx:GridViewDataMemoColumn>
                    <dx:GridViewDataCheckColumn Caption="اعرض رسالتي" FieldName="agreeshow" 
                        ReadOnly="True" VisibleIndex="9">
                    </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn Caption="موافق علي العرض" FieldName="adminagree" 
                        VisibleIndex="10">
                    </dx:GridViewDataCheckColumn>
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" ConfirmDelete="True" 
                    SortMode="DisplayText" ColumnResizeMode="Control" />
                <SettingsPager>
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
                <Images SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css">
                    <LoadingPanelOnStatusBar Url="../App_Themes/DevEx/GridView/StatusBarLoading.gif">
                    </LoadingPanelOnStatusBar>
                    <LoadingPanel Url="../App_Themes/DevEx/GridView/Loading.gif">
                    </LoadingPanel>
                </Images>
                <ImagesFilterControl>
                    <LoadingPanel Url="../App_Themes/DevEx/GridView/Loading.gif">
                    </LoadingPanel>
                </ImagesFilterControl>
                <Styles CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx">
                    <Header ImageSpacing="5px" SortingImageSpacing="5px" Font-Bold="False" 
                        Font-Size="Medium" HorizontalAlign="Center">
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
            </dx:ASPxGridView>
            <dx:ASPxGridViewExporter ID="ASPxGridViewExporterEditor" runat="server" 
                FileName="ContactUSFX" GridViewID="GVEditor" PaperKind="A4">
            </dx:ASPxGridViewExporter>
            <asp:AccessDataSource ID="DSData" runat="server" DataFile="../App_Data/ABOUT.mdb" 
                DeleteCommand="DELETE FROM [contact] WHERE [addno] = ?" 
                InsertCommand="INSERT INTO [contact] ([coname], [sefaid], [contypeid], [tel], [mail], [massage], [condate], [rply]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)" 
                SelectCommand="SELECT [addno], [coname], [sefaid], [contypeid], [tel], [mail], [massage], [condate], [rply], [agreeshow], [adminagree] FROM [contact]" 
                
                
                UpdateCommand="UPDATE [contact] SET [coname] = ?, [sefaid] = ?, [contypeid] = ?, [tel] = ?, [mail] = ?, [massage] = ?, [condate] = ?, [rply] = ?, [adminagree] = ? WHERE [addno] = ?">
                <DeleteParameters>
                    <asp:Parameter Name="addno" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="coname" Type="String" />
                    <asp:Parameter Name="sefaid" Type="Byte" />
                    <asp:Parameter Name="contypeid" Type="Byte" />
                    <asp:Parameter Name="tel" Type="String" />
                    <asp:Parameter Name="mail" Type="String" />
                    <asp:Parameter Name="massage" Type="String" />
                    <asp:Parameter Name="condate" Type="DateTime" />
                    <asp:Parameter Name="rply" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="coname" Type="String" />
                    <asp:Parameter Name="sefaid" Type="Byte" />
                    <asp:Parameter Name="contypeid" Type="Byte" />
                    <asp:Parameter Name="tel" Type="String" />
                    <asp:Parameter Name="mail" Type="String" />
                    <asp:Parameter Name="massage" Type="String" />
                    <asp:Parameter Name="condate" Type="DateTime" />
                    <asp:Parameter Name="rply" Type="String" />
                    <asp:Parameter Name="adminagree" />
                    <asp:Parameter Name="addno" Type="Int32" />
                </UpdateParameters>
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DSsefa" runat="server" DataFile="../App_Data/ABOUT.mdb"
                SelectCommand="SELECT [sefaid], [sefa] FROM [sefa]">
            </asp:AccessDataSource>
            <asp:AccessDataSource ID="DScontype" runat="server" DataFile="../App_Data/ABOUT.mdb"
                SelectCommand="SELECT [contypeid], [contype] FROM [contype]">
            </asp:AccessDataSource>
        </td>
    </tr>
    <tr>
        <td>
            <dx:ASPxCheckBox ID="CBSend" runat="server" CheckState="Unchecked" 
                CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" 
                SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" 
                Text="ارسال رسالة رد بعد الحفظ">
            </dx:ASPxCheckBox>
        </td>
    </tr>
</table>
    
<dx:ASPxPopupControl ID="ASPxPopupControlEditor" runat="server" 
    AllowDragging="True" ClientInstanceName="popupeditor" 
    CssFilePath="../App_Themes/DevEx/{0}/styles.css" CssPostfix="DevEx" 
    HeaderText="رسالـــه" MinHeight="80px" MinWidth="200px" 
    Modal="True" PopupHorizontalAlign="WindowCenter" 
    PopupVerticalAlign="WindowCenter" RightToLeft="True" 
    SpriteCssFilePath="../App_Themes/DevEx/{0}/sprite.css" Height="120px" 
    Width="300px" style="text-align: center" 
    Font-Bold="False">
    <LoadingPanelImage Url="../App_Themes/DevEx/Web/Loading.gif">
    </LoadingPanelImage>
    <ContentStyle Font-Bold="True" Font-Size="Medium" Font-Underline="False" 
        HorizontalAlign="Center" VerticalAlign="Middle">
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

<dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">تم 
    التحميل</dx:PopupControlContentControl>

</ContentCollection>
</dx:ASPxPopupControl>


    
