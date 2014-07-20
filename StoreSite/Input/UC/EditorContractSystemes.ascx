<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditorContractSystemes.ascx.cs" Inherits="EditorContractSystemes" %>
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
        <MasterTableView datakeynames="SystemId,ContractId" datasourceid="SqlDataSourceCodez" 
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
                    HeaderText="العقـــد" SortExpression="ContractId" UniqueName="ContractId">
                    <EditItemTemplate>
                        <asp:HiddenField ID="HiddenFieldContractId" runat="server" 
                            onvaluechanged="HiddenFieldContractId_ValueChanged" 
                            Value='<%# Bind("ContractId") %>' />
                        <telerik:RadComboBox ID="RadComboBoxContractId" Runat="server" 
                            AutoPostBack="True" DataTextField="Details" DataValueField="ContractId" 
                            MarkFirstMatch="True" onload="RadComboBoxContractId_Load" 
                            onselectedindexchanged="RadComboBoxContractId_SelectedIndexChanged" 
                            SelectedValue='<%# Bind("ContractId") %>' Width="160px">
                        </telerik:RadComboBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="ContractIdLabel" runat="server" Text='<%# Eval("ContractId") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="LastDate" HeaderText="اخر تـاريخ للسـحب" 
                    SortExpression="LastDate" UniqueName="LastDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TxtStart" runat="server" Text='<%# Bind("LastDate") %>'></asp:TextBox>
                        <cc1:CalendarExtender ID="TxtStart_CalendarExtender" runat="server" 
                            Enabled="True" Format="dd/MM/yyyy" TargetControlID="TxtStart">
                        </cc1:CalendarExtender>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LastDateLabel" runat="server" Text='<%# Eval("LastDate") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridTemplateColumn>
                <telerik:GridDropDownColumn DataField="PaidId" DataSourceID="SqlDataSourcepaid" 
                    DropDownControlType="DropDownList" HeaderText="طريقــة الدفـــع" 
                    ListTextField="Paidname" ListValueField="PaidId" SortExpression="PaidId" 
                    UniqueName="PaidId">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridDropDownColumn>
                <telerik:GridBoundColumn DataField="SystemValue" DataType="System.Double" 
                    HeaderText="القيــمه" SortExpression="SystemValue" UniqueName="SystemValue">
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
                    DeleteCommand="DELETE FROM [TblContractSystemes] WHERE [SystemId] = @original_SystemId AND [ContractId] = @original_ContractId" 
                    InsertCommand="INSERT INTO [TblContractSystemes] ([SystemId], [ContractId], [LastDate], [PaidId], [SystemValue]) Select (Select ISNULL(MAX(SystemId) +1, 1) From TblContractSystemes), @ContractId, @LastDate, @PaidId, @SystemValue" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [SystemId], [ContractId], CONVERT(nvarchar, LastDate, 103) AS LastDate, [PaidId], [SystemValue] FROM [TblContractSystemes]" 
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    UpdateCommand="UPDATE [TblContractSystemes] SET [LastDate] = @LastDate, [PaidId] = @PaidId, [SystemValue] = @SystemValue WHERE [SystemId] = @original_SystemId AND [ContractId] = @original_ContractId" 
                    oninserting="SqlDataSourceCodez_Inserting">
                    <DeleteParameters>
                        <asp:Parameter Name="original_SystemId" Type="Int32" />
                        <asp:Parameter Name="original_ContractId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="SystemId" Type="Int32" />
                        <asp:Parameter Name="ContractId" Type="Int32" />
                        <asp:Parameter DbType="Date" Name="LastDate" />
                        <asp:Parameter Name="PaidId" Type="Byte" />
                        <asp:Parameter Name="SystemValue" Type="Double" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="LastDate" DbType="Date" />
                        <asp:Parameter Name="PaidId" Type="Byte" />
                        <asp:Parameter Name="SystemValue" Type="Double" />
                        <asp:Parameter Name="original_SystemId" Type="Int32" />
                        <asp:Parameter Name="original_ContractId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourcepaid" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=E_STORE;Integrated Security=True" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    
                    SelectCommand="SELECT [PaidId], [Paidname] FROM [codepaid]">
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