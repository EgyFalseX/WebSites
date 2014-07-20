<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditorPriceListDetails.ascx.cs" Inherits="EditorPriceListDetails" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<style type="text/css">
    .style1
    {
        width: 337px;
    }

.radInput_Default
{
	font:11px arial,tahoma,verdana,sans-serif;
	vertical-align:middle;
}

.radEnabledCss_Default 
{
	border:1px solid #626262;
}

.radEnabledCss_Default
{
	font:11px arial,tahoma,verdana,sans-serif;
	padding:2px 0 2px 1px;
	color:#333;
}

    .style2
    {
        width: 43px;
    }
    .style3
    {
        width: 155px;
        height: 29px;
        text-align: right;
    }
    .style6
    {
        width: 89px;
        text-align: left;
        direction: rtl;
    }
    
</style>
<div>
                <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
                </telerik:RadScriptManager>
    <table align="center" dir="rtl" style="width: 330px">
        <tr>
            <td colspan="2" style="text-align: center">
                <asp:Button ID="BtnBack" runat="server" onclick="BtnBack_Click" Text="عوده" 
                    Width="100px" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="14px" 
                    Text="القوائم"></asp:Label>
            </td>
            <td style="text-align: right">
                        <telerik:RadComboBox ID="RadComboBoxPricelistId" Runat="server" Skin="Default" 
                    Width="200px" MarkFirstMatch="True" AutoPostBack="True">
                        </telerik:RadComboBox>
            </td>
        </tr>
        </table>
    <p>
    </p>
    <table align="center" class="style1" dir="rtl">
        <tr>
            <td>
                <telerik:RadGrid ID="RadGridEditor" runat="server" DataSourceID="SqlDataSourceCodez" 
                    GridLines="None" AllowPaging="True" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" ShowStatusBar="True" 
                    AllowFilteringByColumn="True" AutoGenerateColumns="False" 
                    EnableTheming="True" Skin="Vista" 
                    onitemdeleted="RadGridEditor_ItemDeleted" 
                    oniteminserted="RadGridEditor_ItemInserted" 
                    onitemupdated="RadGridEditor_ItemUpdated">
                    <SortingSettings SortToolTip="اضغظ هنا للترتيب" />
                    <ValidationSettings EnableValidation="False" />
<SortingSettings SortToolTip="اضغظ هنا للترتيب"></SortingSettings>

                    <ValidationSettings EnableValidation="False" />
        <MasterTableView datakeynames="PricelistId,MaterialId" datasourceid="SqlDataSourceCodez" 
                                CommandItemDisplay="TopAndBottom" AllowAutomaticDeletes="True" 
                        AllowAutomaticInserts="True" AllowAutomaticUpdates="True" Dir="RTL" 
                        ForeColor="Black" GridLines="None" HorizontalAlign="NotSet" 
                        NoDetailRecordsText="لا يوجد سجلات داخليه" 
                        NoMasterRecordsText="لا يوجد سجلات" Font-Bold="True" Font-Size="14px" 
                        Font-Names="Arial">
         <CommandItemSettings AddNewRecordText="اضافه" 
                RefreshText="تجديد البيانات" />
<CommandItemSettings AddNewRecordText="اضافه" RefreshText="تجديد البيانات"></CommandItemSettings>

        <RowIndicatorColumn Visible="False">
        <HeaderStyle Width="20px"></HeaderStyle>
        </RowIndicatorColumn>
        <ExpandCollapseColumn Visible="False" Resizable="False" ButtonType="ImageButton">
        <HeaderStyle Width="20px" ForeColor="Black"></HeaderStyle>
            <ItemStyle ForeColor="Black" />
        </ExpandCollapseColumn>

            <Columns>
                <telerik:GridTemplateColumn DataField="MaterialId" DataType="System.Int32" 
                    HeaderText="الصنف" SortExpression="MaterialId" UniqueName="MaterialId">
                    <EditItemTemplate>
                        <table dir="ltr">
                            <tr>
                                <td style="text-align: right">
                                    <asp:Panel ID="PnlPop" runat="server" BackColor="White" BorderColor="#3399FF" 
                                        BorderStyle="Solid" Height="200px" HorizontalAlign="NotSet" ScrollBars="Auto" 
                                        style="direction: ltr">
                                        <telerik:RadPanelBar ID="RadPanelBarItems" Runat="server" 
                                            onload="RadPanelBarItems_Load" Skin="Vista" style="text-align: left">
                                        </telerik:RadPanelBar>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    <asp:Label ID="LblItemName" runat="server" Text='<%# bind("Material") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style6">
                                    <asp:TextBox ID="TxtItemCatID" runat="server" style="direction: rtl" 
                                        Text='<%# Bind("CategoryId") %>' Width="100px"></asp:TextBox>
                                    <asp:Button ID="BtnOk" runat="server" onclick="BtnOk_Click" Text="موافق" 
                                        Width="100px" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right; direction: rtl">
                                    <asp:HiddenField ID="HiddenFieldMaterialId" runat="server" 
                                        Value='<%# bind("MaterialId") %>' />
                                </td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="MaterialIdLabel" runat="server" Text='<%# Eval("Material") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="listpriceout" DataType="System.Double" 
                    HeaderText="السعر" SortExpression="listpriceout" UniqueName="listpriceout">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridButtonColumn  UniqueName="EditColumn" ButtonType="ImageButton" CommandName="Edit" />
                <telerik:GridButtonColumn  UniqueName="DeleteColumn" ConfirmText="هل انت متأكد؟" ConfirmDialogType="RadWindow"
                ConfirmTitle="تحـــزير" ButtonType="ImageButton" CommandName="Delete" />
            </Columns>

        <EditFormSettings>
            <EditColumn ButtonType="ImageButton" CancelText="الغاء" EditText="تعديل" 
                InsertText="اضافه" UpdateText="حفظ التعديل" 
                InsertImageUrl="~/Images/AddTGrid.png">
                <FooterStyle ForeColor="Black" />
            </EditColumn>
            <FormTableStyle ForeColor="Black" />
            <FormMainTableStyle ForeColor="Black" />
            <FormTableItemStyle Font-Size="18px" />
            <FormTableAlternatingItemStyle ForeColor="Black" />
            <FormTableButtonRowStyle ForeColor="Black" />

<FormTableStyle ForeColor="Black"></FormTableStyle>

<FormMainTableStyle ForeColor="Black"></FormMainTableStyle>

<FormTableItemStyle Font-Size="18px"></FormTableItemStyle>

<FormTableAlternatingItemStyle ForeColor="Black"></FormTableAlternatingItemStyle>

<FormTableButtonRowStyle ForeColor="Black"></FormTableButtonRowStyle>

        <PopUpSettings ScrollBars="None"></PopUpSettings>
            
        </EditFormSettings>
            <ItemStyle ForeColor="Black" />
            <GroupHeaderItemStyle ForeColor="Black" />

<GroupHeaderItemStyle ForeColor="Black"></GroupHeaderItemStyle>

            <EditItemStyle ForeColor="Black" />
            <PagerStyle NextPagesToolTip="الصفحات التاليه" NextPageToolTip="الصفحه التاليه" 
                PagerTextFormat="تغير الصفحه: {4} &amp;nbsp;الصفحه المعروضه {0} من {1}, الصف {2} الي {3} من {5}." 
                PrevPagesToolTip="الصفحات السابقه" PrevPageToolTip="صفحه السابقه" />
            <HeaderStyle ForeColor="Black" />
            <CommandItemStyle Font-Bold="False" />

<CommandItemStyle Font-Bold="False"></CommandItemStyle>
        </MasterTableView>
                    <EditItemStyle Font-Bold="True" ForeColor="Black" />
                    <CommandItemStyle Font-Bold="False" ForeColor="Black" />

<CommandItemStyle Font-Bold="False" ForeColor="Black"></CommandItemStyle>

                    <ItemStyle ForeColor="Black" />
                    <StatusBarSettings LoadingText="تحميل....." ReadyText="جاهز" />

<StatusBarSettings ReadyText="جاهز" LoadingText="تحميل....."></StatusBarSettings>
                </telerik:RadGrid>
                <asp:SqlDataSource ID="SqlDataSourceCodez" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=E_STORE;Integrated Security=True" 
                    DeleteCommand="DELETE FROM [TblPriceListDetails] WHERE [PricelistId] = @original_PricelistId AND [MaterialId] = @original_MaterialId" 
                    InsertCommand="INSERT INTO [TblPriceListDetails] ([PricelistId], [MaterialId], [listpriceout]) VALUES (@PricelistId, @MaterialId, @listpriceout)" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT PricelistId, MaterialId, listpriceout, (SELECT Material FROM TblMaterialDetiels WHERE (MaterialId = TblPriceListDetails.MaterialId)) AS Material,
(SELECT CategoryId FROM TblMaterialDetiels WHERE (MaterialId = TblPriceListDetails.MaterialId)) AS CategoryId
 FROM TblPriceListDetails
Where PricelistId = @PricelistId" 
                    
                    
                    
                    
                    
                    
                    
                    
                    UpdateCommand="UPDATE [TblPriceListDetails] SET [listpriceout] = @listpriceout WHERE [PricelistId] = @original_PricelistId AND [MaterialId] = @original_MaterialId">
                    <DeleteParameters>
                        <asp:Parameter Name="original_PricelistId" Type="Int32" />
                        <asp:Parameter Name="original_MaterialId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:ControlParameter ControlID="RadComboBoxPricelistId" Name="PricelistId" 
                            PropertyName="SelectedValue" Type="Int32" />
                        <asp:Parameter Name="MaterialId" Type="Int32" />
                        <asp:Parameter Name="listpriceout" Type="Double" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RadComboBoxPricelistId" Name="PricelistId" 
                            PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="listpriceout" Type="Double" />
                        <asp:Parameter Name="original_PricelistId" Type="Int32" />
                        <asp:Parameter Name="original_MaterialId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td bgcolor="Yellow" style="text-align: center">
                <asp:Label ID="LblState" runat="server" Font-Bold="True" Font-Size="14px"></asp:Label>
            </td>
        </tr>
    </table>
</div>