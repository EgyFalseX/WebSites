<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditorContractItems.ascx.cs" Inherits="EditorContractItems" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<style type="text/css">
    .style1
    {
        width: 100px;
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

</style>
<div>
    <table align="center" class="style1" dir="rtl">
        <tr>
            <td>
                <asp:Button ID="BtnBack" runat="server" onclick="BtnBack_Click" Text="عوده" 
                    Width="100px" />
            </td>
        </tr>
        <tr>
            <td>
                <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
                </telerik:RadScriptManager>
                <telerik:RadGrid ID="RadGridEditor" runat="server" DataSourceID="SqlDataSourceCodez" 
                    GridLines="None" AllowPaging="True" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" ShowStatusBar="True" 
                    AllowFilteringByColumn="True" AutoGenerateColumns="False" 
                    EnableTheming="True" Skin="Vista" 
                    onitemdeleted="RadGridEditor_ItemDeleted" 
                    oniteminserted="RadGridEditor_ItemInserted" 
                    onitemupdated="RadGridEditor_ItemUpdated" Width="800px">
                    <SortingSettings SortToolTip="اضغظ هنا للترتيب" />
                    <ValidationSettings EnableValidation="False" />
<SortingSettings SortToolTip="اضغظ هنا للترتيب"></SortingSettings>

                    <ValidationSettings EnableValidation="False" />
        <MasterTableView datakeynames="ContractId,CategoryId" datasourceid="SqlDataSourceCodez" 
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
                <telerik:GridTemplateColumn DataField="ContractId" DataType="System.Int32" 
                    HeaderText="العقد" SortExpression="ContractId" UniqueName="ContractId">
                    <EditItemTemplate>
                        <asp:HiddenField ID="HiddenFieldContractId" runat="server" 
                            onvaluechanged="HiddenFieldContractId_ValueChanged" 
                            Value="<%# Bind('ContractId') %>" />
                        <telerik:RadComboBox ID="RadComboBoxContractId" Runat="server" 
                            DataTextField="Customer" DataValueField="Customer" 
                            MarkFirstMatch="True" onload="RadComboBoxContractId_Load" 
                            onselectedindexchanged="RadComboBoxContractId_SelectedIndexChanged" 
                            SelectedValue='<%# Bind("ContractId") %>' Width="160px">
                        </telerik:RadComboBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="ContractIdLabel" runat="server" Text='<%# Eval("Contractes") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="CategoryId" DataType="System.Int32" 
                    HeaderText="التصنيف" SortExpression="CategoryId" UniqueName="CategoryId">
                    <EditItemTemplate>
                        <asp:HiddenField ID="HiddenFieldCategoryId" runat="server" 
                            onvaluechanged="HiddenFieldCategoryId_ValueChanged" 
                            Value="<%# Bind('CategoryId') %>" />
                        <telerik:RadComboBox ID="RadComboBoxCategoryId" Runat="server" 
                            DataTextField="Customer" DataValueField="Customer" 
                            MarkFirstMatch="True" onload="RadComboBoxCategoryId_Load" 
                            onselectedindexchanged="RadComboBoxCategoryId_SelectedIndexChanged" 
                            SelectedValue='<%# Bind("CategoryId") %>' Width="160px">
                        </telerik:RadComboBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="CategoryIdLabel" runat="server" Text='<%# Eval("Category") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="PricelistId" DataType="System.Int32" 
                    HeaderText="القائمه" SortExpression="PricelistId" UniqueName="PricelistId">
                    <EditItemTemplate>
                        <asp:HiddenField ID="HiddenFieldPricelistId" runat="server" 
                            onvaluechanged="HiddenFieldPricelistId_ValueChanged" 
                            Value="<%# Bind('PricelistId') %>" />
                        <telerik:RadComboBox ID="RadComboBoxPricelistId" Runat="server" 
                            DataTextField="Customer" DataValueField="Customer" 
                            MarkFirstMatch="True" onload="RadComboBoxPricelistId_Load" 
                            onselectedindexchanged="RadComboBoxPricelistId_SelectedIndexChanged" 
                            SelectedValue='<%# Bind("PricelistId") %>' Width="160px">
                        </telerik:RadComboBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="PricelistIdLabel" runat="server" 
                            Text='<%# Eval("Pricelists") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridTemplateColumn>
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
                    DeleteCommand="DELETE FROM [TblContractItems] WHERE [ContractId] = @original_ContractId AND [CategoryId] = @original_CategoryId" 
                    InsertCommand="INSERT INTO [TblContractItems] ([ContractId], [CategoryId], [PricelistId]) VALUES (@ContractId, @CategoryId, @PricelistId)" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [ContractId], [CategoryId], [PricelistId],
(Select Category From CdCategory Where CategoryId = TblContractItems.CategoryId) AS Category,

(Select Category From CdCategory Where CategoryId = (Select CategoryId From TblPricelists Where PricelistId = TblContractItems.PricelistId)) + ' - ' + 
(Select Convert(nvarchar, PricelistDatestart, 103) From TblPricelists Where PricelistId = TblContractItems.PricelistId ) + ' - ' + 
(Select Convert(nvarchar, PricelistDateEnd, 103) From TblPricelists Where PricelistId = TblContractItems.PricelistId ) AS Pricelists,

(Select Customer From TblCustomes Where CustomerId = (Select CustomerId From TblContractes Where ContractId = TblContractItems.ContractId)) + ' - ' + 
(Select Convert(nvarchar, ContractDate, 103) From TblContractes Where ContractId = TblContractItems.ContractId) + ' - ' + 
(Select Cast(ValueOrder as nvarchar) From TblContractes Where ContractId = TblContractItems.ContractId) + ' - ' + 
(Select Cast(CreditLimit  as nvarchar) From TblContractes Where ContractId = TblContractItems.ContractId) AS Contractes
 FROM [TblContractItems]" 
                    
                    
                    
                    
                    
                    
                    
                    
                    UpdateCommand="UPDATE [TblContractItems] SET [PricelistId] = @PricelistId, [ContractId] = @ContractId, [CategoryId] = @CategoryId WHERE [ContractId] = @original_ContractId AND [CategoryId] = @original_CategoryId">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ContractId" Type="Int32" />
                        <asp:Parameter Name="original_CategoryId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ContractId" Type="Int32" />
                        <asp:Parameter Name="CategoryId" Type="Int32" />
                        <asp:Parameter Name="PricelistId" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="PricelistId" Type="Int32" />
                        <asp:Parameter Name="ContractId" />
                        <asp:Parameter Name="CategoryId" />
                        <asp:Parameter Name="original_ContractId" Type="Int32" />
                        <asp:Parameter Name="original_CategoryId" Type="Int32" />
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