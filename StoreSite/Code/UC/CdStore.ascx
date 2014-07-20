<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CdStore.ascx.cs" Inherits="CdStore" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<style type="text/css">
    .style1
    {
        width: 100px;
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
                    <ValidationSettings CommandsToValidate="Insert,Update" />
        <MasterTableView datakeynames="StoreId" datasourceid="SqlDataSourceCodez" 
                                CommandItemDisplay="TopAndBottom" AllowAutomaticDeletes="True" 
                        AllowAutomaticInserts="True" AllowAutomaticUpdates="True" Dir="RTL" 
                        ForeColor="Black" GridLines="None" HorizontalAlign="NotSet" 
                        NoDetailRecordsText="لا يوجد سجلات داخليه" 
                        NoMasterRecordsText="لا يوجد سجلات" Font-Size="14pt" Font-Names="Arial">
         <CommandItemSettings AddNewRecordText="اضافه" 
                RefreshText="تجديد البيانات" />
        <RowIndicatorColumn Visible="False">
        <HeaderStyle Width="20px"></HeaderStyle>
        </RowIndicatorColumn>
        <ExpandCollapseColumn Visible="False" Resizable="False" ButtonType="ImageButton">
        <HeaderStyle Width="20px" ForeColor="Black"></HeaderStyle>
            <ItemStyle ForeColor="Black" />
        </ExpandCollapseColumn>

            <Columns>
                <telerik:GridBoundColumn DataField="Storename" 
                    HeaderText="إسم المخزن" SortExpression="Storename" 
                    UniqueName="Storename">
                    <HeaderStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="storeAddres" HeaderText="عنوان المخزن" 
                    SortExpression="storeAddres" UniqueName="storeAddres">
                    <HeaderStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="storeTel" HeaderText="تليفون المخزن" 
                    SortExpression="storeTel" UniqueName="storeTel">
                    <HeaderStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="storeMobil" HeaderText="موبايل المخزن" 
                    SortExpression="storeMobil" UniqueName="storeMobil">
                    <HeaderStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="storeFax" HeaderText="فاكس المخزن" 
                    SortExpression="storeFax" UniqueName="storeFax">
                    <HeaderStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="storeMail" HeaderText="إيميل المخزن" 
                    SortExpression="storeMail" UniqueName="storeMail">
                    <HeaderStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridDropDownColumn DataField="EmpID" DataSourceID="SqlDataSourceEmp" 
                    ListTextField="EmpName" ListValueField="EmpID" SortExpression="EmpID" 
                    UniqueName="EmpID" HeaderText="المسئول">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridDropDownColumn>
                <telerik:GridButtonColumn  UniqueName="EditColumn" ButtonType="ImageButton" CommandName="Edit" />
                <telerik:GridButtonColumn  UniqueName="DeleteColumn" ConfirmText="هل انت متأكد؟" ConfirmDialogType="RadWindow"
                ConfirmTitle="تحـــزير" ButtonType="ImageButton" CommandName="Delete" />
            </Columns>

        <EditFormSettings>
            <EditColumn ButtonType="ImageButton" CancelText="الغاء" EditText="تعديل" 
                InsertImageUrl="~/Images/AddTGrid.png" InsertText="اضافه" UpdateText="حفظ التعديل">
                <FooterStyle ForeColor="Black" />
                <HeaderStyle ForeColor="Black" />
                <ItemStyle ForeColor="Black" />
            </EditColumn>
            <FormStyle ForeColor="Black" />
            <FormTableStyle ForeColor="Black" />
            <FormMainTableStyle ForeColor="Black" />
            <FormTableItemStyle ForeColor="Black" Font-Size="18px" />
            <FormTableAlternatingItemStyle ForeColor="Black" />
            <FormTableButtonRowStyle ForeColor="Black" />
        <PopUpSettings ScrollBars="None"></PopUpSettings>
            
        </EditFormSettings>
            <ItemStyle ForeColor="Black" />
            <GroupHeaderItemStyle ForeColor="Black" />
            <EditItemStyle ForeColor="Black" />
            <PagerStyle NextPagesToolTip="الصفحات التاليه" NextPageToolTip="الصفحه التاليه" 
                PagerTextFormat="تغير الصفحه: {4} &amp;nbsp;الصفحه المعروضه {0} من {1}, الصف {2} الي {3} من {5}." 
                PrevPagesToolTip="الصفحات السابقه" PrevPageToolTip="صفحه السابقه" />
            <HeaderStyle ForeColor="Black" />
            <CommandItemStyle Font-Bold="False" />
        </MasterTableView>
                    <EditItemStyle Font-Bold="True" ForeColor="Black" />
                    <CommandItemStyle Font-Bold="False" ForeColor="Black" />
                    <ItemStyle ForeColor="Black" />
                    <StatusBarSettings LoadingText="تحميل....." ReadyText="جاهز" />
                </telerik:RadGrid>
                <asp:SqlDataSource ID="SqlDataSourceCodez" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=E_STORE;Integrated Security=True" 
                    DeleteCommand="DELETE FROM [CdStore] WHERE [StoreId] = @original_StoreId" 
                    InsertCommand="INSERT INTO [CdStore] ([StoreId], [Storename], [storeAddres], [storeTel], [storeMobil], [storeFax], [storeMail], [EmpID], [TimeIn], [UserIn]) VALUES ((SELECT ISNULL(MAX(StoreId) + 1, 1) AS NewID FROM CdStore), @Storename, @storeAddres, @storeTel, @storeMobil, @storeFax, @storeMail, @EmpID, @TimeIn, @UserIn)" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [StoreId], [Storename], [storeAddres], [storeTel], [storeMobil], [storeFax], [storeMail], [EmpID], [TimeIn], [UserIn] FROM [CdStore]" 
                    
                    UpdateCommand="UPDATE [CdStore] SET [Storename] = @Storename, [storeAddres] = @storeAddres, [storeTel] = @storeTel, [storeMobil] = @storeMobil, [storeFax] = @storeFax, [storeMail] = @storeMail, [EmpID] = @EmpID, [TimeIn] = @TimeIn, [UserIn] = @UserIn WHERE [StoreId] = @original_StoreId">
                    <DeleteParameters>
                        <asp:Parameter Name="original_StoreId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Storename" Type="String" />
                        <asp:Parameter Name="storeAddres" Type="String" />
                        <asp:Parameter Name="storeTel" Type="String" />
                        <asp:Parameter Name="storeMobil" Type="String" />
                        <asp:Parameter Name="storeFax" Type="String" />
                        <asp:Parameter Name="storeMail" Type="String" />
                        <asp:Parameter Name="EmpID" Type="Int32" />
                        <asp:Parameter Name="TimeIn" Type="DateTime" />
                        <asp:Parameter Name="UserIn" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Storename" Type="String" />
                        <asp:Parameter Name="storeAddres" Type="String" />
                        <asp:Parameter Name="storeTel" Type="String" />
                        <asp:Parameter Name="storeMobil" Type="String" />
                        <asp:Parameter Name="storeFax" Type="String" />
                        <asp:Parameter Name="storeMail" Type="String" />
                        <asp:Parameter Name="EmpID" Type="Int32" />
                        <asp:Parameter Name="TimeIn" Type="DateTime" />
                        <asp:Parameter Name="UserIn" Type="Int32" />
                        <asp:Parameter Name="original_StoreId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceEmp" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=E_STORE;Integrated Security=True" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [EmpID], [EmpName] FROM [TblEmp]">
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