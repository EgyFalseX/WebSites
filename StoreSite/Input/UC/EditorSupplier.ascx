<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditorSupplier.ascx.cs" Inherits="UC_EditorSupplier" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<style type="text/css">
    .Supstyle1
    {
        width: 482px;
    }
    .Supstyle2
    {
        margin-right: 40px;
    }
</style>
<div dir="rtl">
<telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
    <table cellpadding="0" cellspacing="0" class="Supstyle1" dir="rtl" 
        align="center">
        <tr>
            <td style="text-align: center">
                <asp:Button ID="BtnBack" runat="server" onclick="BtnBack_Click" Text="عوده" 
                    Width="100px" />
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
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
        <MasterTableView datakeynames="SupplierId" datasourceid="SqlDataSourceCodez" 
                                CommandItemDisplay="TopAndBottom" AllowAutomaticDeletes="True" 
                        AllowAutomaticInserts="True" AllowAutomaticUpdates="True" Dir="RTL" 
                        ForeColor="Black" GridLines="None" HorizontalAlign="NotSet" 
                        NoDetailRecordsText="لا يوجد سجلات داخليه" 
                        NoMasterRecordsText="لا يوجد سجلات" Font-Bold="True" Font-Size="14px" 
                        Font-Names="Arial">
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
                <telerik:GridBoundColumn DataField="Supplier" HeaderText="الاسم" 
                    SortExpression="Supplier" UniqueName="Supplier">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Adress" 
                    HeaderText="العنوان" SortExpression="Adress" UniqueName="Adress">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Telephone" HeaderText="التليفون" 
                    SortExpression="Telephone" UniqueName="Telephone">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Fax" HeaderText="الفاكس" 
                    SortExpression="Fax" UniqueName="Fax" Display="False">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Mobile1" 
                    HeaderText="الموبيل1" SortExpression="Mobile1" 
                    UniqueName="Mobile1" Display="False">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Mobile2" 
                    HeaderText="الموبيل2" SortExpression="Mobile2" UniqueName="Mobile2" 
                    Display="False">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="email" 
                    HeaderText="البريد" SortExpression="email" UniqueName="email" 
                    Display="False">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="AccountId" HeaderText="الحساب" 
                    SortExpression="AccountId" UniqueName="AccountId" DataType="System.Int32" 
                    Display="False" ReadOnly="True">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridCheckBoxColumn DataField="StopWork" DataType="System.Boolean" 
                    HeaderText="توقف الحساب" SortExpression="StopWork" UniqueName="StopWork">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridCheckBoxColumn>
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
                    DeleteCommand="DELETE FROM [TblSuppliers] WHERE [SupplierId] = @original_SupplierId" 
                    InsertCommand="INSERT INTO [TblSuppliers] ([SupplierId], [Supplier], [Adress], [Telephone], [Fax], [Mobile1], [Mobile2], [email], [AccountId], [StopWork], [TimeIn], [UserIn]) VALUES ((SELECT ISNULL(MAX(SupplierId) + 1, 1) AS NewID FROM TblSuppliers), @Supplier, @Adress, @Telephone, @Fax, @Mobile1, @Mobile2, @email, @AccountId, @StopWork, GETDATE(), @UserIn)" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [SupplierId], [Supplier], [Adress], [Telephone], [Fax], [Mobile1], [Mobile2], [email], [AccountId], [StopWork], [TimeIn], [UserIn] FROM [TblSuppliers]" 
                    
                    
                    UpdateCommand="UPDATE [TblSuppliers] SET [Supplier] = @Supplier, [Adress] = @Adress, [Telephone] = @Telephone, [Fax] = @Fax, [Mobile1] = @Mobile1, [Mobile2] = @Mobile2, [email] = @email, [StopWork] = @StopWork, [TimeIn] = GETDATE(), [UserIn] = @UserIn WHERE [SupplierId] = @original_SupplierId" 
                    oninserting="SqlDataSourceCodez_Inserting">
                    <DeleteParameters>
                        <asp:Parameter Name="original_SupplierId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="SupplierId" Type="Int32" />
                        <asp:Parameter Name="Supplier" Type="String" />
                        <asp:Parameter Name="Adress" Type="String" />
                        <asp:Parameter Name="Telephone" Type="String" />
                        <asp:Parameter Name="Fax" Type="String" />
                        <asp:Parameter Name="Mobile1" Type="String" />
                        <asp:Parameter Name="Mobile2" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="AccountId" Type="Int32" />
                        <asp:Parameter Name="StopWork" Type="Boolean" />
                        <asp:SessionParameter Name="UserIn" SessionField="UserID" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Supplier" Type="String" />
                        <asp:Parameter Name="Adress" Type="String" />
                        <asp:Parameter Name="Telephone" Type="String" />
                        <asp:Parameter Name="Fax" Type="String" />
                        <asp:Parameter Name="Mobile1" Type="String" />
                        <asp:Parameter Name="Mobile2" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="StopWork" Type="Boolean" />
                        <asp:SessionParameter Name="UserIn" SessionField="UserID" Type="Int32" />
                        <asp:Parameter Name="original_SupplierId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        </table>
</div>