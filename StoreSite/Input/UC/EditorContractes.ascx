<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditorContractes.ascx.cs" Inherits="EditorContractes" %>
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
                    onitemupdated="RadGridEditor_ItemUpdated">
                    <SortingSettings SortToolTip="اضغظ هنا للترتيب" />
                    <ValidationSettings EnableValidation="False" />
<SortingSettings SortToolTip="اضغظ هنا للترتيب"></SortingSettings>

                    <ValidationSettings EnableValidation="False" />
        <MasterTableView datakeynames="ContractId" datasourceid="SqlDataSourceCodez" 
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
                <telerik:GridTemplateColumn DataField="CustomerId" DataType="System.Int32" 
                    HeaderText="العميل" SortExpression="CustomerId" UniqueName="CustomerId">
                    <EditItemTemplate>
                        <asp:HiddenField ID="HiddenFieldCustomerId" runat="server" 
                            onvaluechanged="HiddenFieldCustomerId_ValueChanged" 
                            Value="<%# Bind('CustomerId') %>" />
                        <telerik:RadComboBox ID="RadComboBoxCustomerId" Runat="server" 
                            MarkFirstMatch="True" SelectedValue='<%# Bind("CustomerId") %>' 
                            Width="160px" AutoPostBack="True" DataTextField="Customer" 
                            DataValueField="Customer" onload="RadComboBoxCustomerId_Load" 
                            onselectedindexchanged="RadComboBoxCustomerId_SelectedIndexChanged">
                        </telerik:RadComboBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="CustomerIdLabel" runat="server" Text='<%# Eval("Customer") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="ContractDate" 
                    HeaderText="تاريخ العقد" SortExpression="ContractDate" 
                    UniqueName="ContractDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TxtStart" runat="server" Text="<%# bind('ContractDate') %>" 
                            Width="150px"></asp:TextBox>
                        <cc1:CalendarExtender ID="TxtStart_CalendarExtender" runat="server" 
                            Enabled="True" Format="dd/MM/yyyy" TargetControlID="TxtStart">
                        </cc1:CalendarExtender>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="ContractDateLabel" runat="server" 
                            Text='<%# Eval("ContractDate") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="ValueOrder" 
                    HeaderText="قيمة الطلبيه" SortExpression="ValueOrder" 
                    UniqueName="ValueOrder" DataType="System.Double">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="CreditLimit" 
                    HeaderText="حد الائتمان" SortExpression="CreditLimit" 
                    UniqueName="CreditLimit" DataType="System.Double">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="RepeatValue" HeaderText="قيمة الريبيت" 
                    SortExpression="RepeatValue" UniqueName="RepeatValue" 
                    DataType="System.Double">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridButtonColumn  UniqueName="EditColumn" ButtonType="ImageButton" 
                    CommandName="Edit" >
                    <HeaderStyle HorizontalAlign="Center" />
                </telerik:GridButtonColumn>
                <telerik:GridButtonColumn  UniqueName="DeleteColumn" 
                    ConfirmText="هل انت متأكد؟" ConfirmDialogType="RadWindow"
                ConfirmTitle="تحـــزير" ButtonType="ImageButton" CommandName="Delete" >
                    <HeaderStyle HorizontalAlign="Center" />
                </telerik:GridButtonColumn>
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
                    DeleteCommand="DELETE FROM [TblContractes] WHERE [ContractId] = @original_ContractId" 
                    InsertCommand="INSERT INTO TblContractes(ContractId, CustomerId, ContractDate, ValueOrder, CreditLimit, RepeatValue) SELECT (SELECT ISNULL(MAX(ContractId) + 1, 1) AS Expr1 FROM TblContractes), @CustomerId,  CONVERT(nvarchar, @ContractDate, 103), @ValueOrder, @CreditLimit, @RepeatValue" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT ContractId, CustomerId, CONVERT (nvarchar, ContractDate, 103) AS ContractDate, ValueOrder, CreditLimit, RepeatValue,
(SELECT Customer FROM TblCommercialCustomers Where CustomerId = TblContractes.CustomerId) AS Customer
 FROM TblContractes" 
                    
                    
                    
                    
                    
                    
                    UpdateCommand="UPDATE [TblContractes] SET [CustomerId] = @CustomerId, [ContractDate] = CONVERT(nvarchar, @ContractDate, 103), [ValueOrder] = @ValueOrder, [CreditLimit] = @CreditLimit, [RepeatValue] = @RepeatValue WHERE [ContractId] = @original_ContractId">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ContractId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ContractId" Type="Int32" />
                        <asp:Parameter Name="CustomerId" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="ContractDate" />
                        <asp:Parameter Name="ValueOrder" Type="Double" />
                        <asp:Parameter Name="CreditLimit" Type="Double" />
                        <asp:Parameter Name="RepeatValue" Type="Double" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CustomerId" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="ContractDate" />
                        <asp:Parameter Name="ValueOrder" Type="Double" />
                        <asp:Parameter Name="CreditLimit" Type="Double" />
                        <asp:Parameter Name="RepeatValue" Type="Double" />
                        <asp:Parameter Name="original_ContractId" Type="Int32" />
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