<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditorRoleDetails.ascx.cs" Inherits="EditorRoleDetails" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<style type="text/css">

    .style1
    {
        width: 100px;
    }
    .style2
    {
        height: 30px;
    }
</style>
<table align="center" class="style1" dir="rtl">
        <tr>
            <td class="style2">
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
                    EnableTheming="True" Skin="Vista" Width="600px" 
                    onitemdeleted="RadGridEditor_ItemDeleted" 
                    oniteminserted="RadGridEditor_ItemInserted" 
                    onitemupdated="RadGridEditor_ItemUpdated">
                    <SortingSettings SortToolTip="اضغظ هنا للترتيب" />
                    <ValidationSettings CommandsToValidate="Insert,Update" />
<SortingSettings SortToolTip="اضغظ هنا للترتيب"></SortingSettings>

<ValidationSettings CommandsToValidate="Insert,Update"></ValidationSettings>

        <MasterTableView datakeynames="RoleID,MenuItemNameID" datasourceid="SqlDataSourceCodez" 
                                CommandItemDisplay="TopAndBottom" AllowAutomaticDeletes="True" 
                        AllowAutomaticInserts="True" AllowAutomaticUpdates="True" Dir="RTL" 
                        ForeColor="Black" GridLines="None" HorizontalAlign="NotSet" 
                        NoDetailRecordsText="لا يوجد سجلات داخليه" 
                        NoMasterRecordsText="لا يوجد سجلات" Font-Size="14pt" Font-Names="Arial">
<CommandItemSettings AddNewRecordText="اضافه" RefreshText="تجديد البيانات"></CommandItemSettings>

<GroupHeaderItemStyle ForeColor="Black"></GroupHeaderItemStyle>

<CommandItemStyle Font-Bold="False"></CommandItemStyle>
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
                <telerik:GridDropDownColumn DataField="RoleID" 
                    HeaderText="اسم مجموعة الصلاحيات" ListValueField="RoleID" 
                    SortExpression="RoleID" UniqueName="RoleID" 
                    DataSourceID="SqlDataSourceRoles" DropDownControlType="DropDownList" 
                    ListTextField="RoleName">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridDropDownColumn>
                <telerik:GridDropDownColumn DataField="MenuItemNameID" HeaderText="اسم الصفحه" 
                    ListValueField="MenuItemNameID" SortExpression="MenuItemNameID" 
                    UniqueName="MenuItemNameID" DataSourceID="SqlDataSourceMenuItemName" 
                    DropDownControlType="DropDownList" ListTextField="PageText">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridDropDownColumn>
                <telerik:GridButtonColumn  UniqueName="EditColumn" ButtonType="ImageButton" 
                    CommandName="Edit" Text="تعديل" />
                <telerik:GridButtonColumn  UniqueName="DeleteColumn" 
                    ConfirmText="هل انت متأكد؟" ConfirmDialogType="RadWindow"
                ConfirmTitle="تحـــزير" ButtonType="ImageButton" CommandName="Delete" 
                    Text="حذف" />
            </Columns>

        <EditFormSettings>
            <EditColumn ButtonType="ImageButton" CancelText="الغاء" EditText="تعديل" 
                InsertText="اضافه" UpdateText="حفظ التعديل" 
                InsertImageUrl="~/Images/AddTGrid.png">
                <FooterStyle ForeColor="Black" />
                <HeaderStyle ForeColor="Black" />
                <ItemStyle ForeColor="Black" />
            </EditColumn>
            <FormStyle ForeColor="Black" />
            <FormTableStyle ForeColor="Black" />
            <FormMainTableStyle ForeColor="Black" />
            <FormTableAlternatingItemStyle ForeColor="Black" />
            <FormTableButtonRowStyle ForeColor="Black" />

<FormStyle ForeColor="Black"></FormStyle>

<FormTableStyle ForeColor="Black"></FormTableStyle>

<FormMainTableStyle ForeColor="Black"></FormMainTableStyle>

<FormTableItemStyle ForeColor="Black" Font-Size="18px"></FormTableItemStyle>

<FormTableAlternatingItemStyle ForeColor="Black"></FormTableAlternatingItemStyle>

<FormTableButtonRowStyle ForeColor="Black"></FormTableButtonRowStyle>

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

<CommandItemStyle Font-Bold="False" ForeColor="Black"></CommandItemStyle>

                    <ItemStyle ForeColor="Black" />
                    <StatusBarSettings LoadingText="تحميل....." ReadyText="جاهز" />

<StatusBarSettings ReadyText="جاهز" LoadingText="تحميل....."></StatusBarSettings>
                </telerik:RadGrid>
                <asp:SqlDataSource ID="SqlDataSourceCodez" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=E_STORE;Integrated Security=True" 
                    DeleteCommand="DELETE FROM [RoleDetial] WHERE [RoleID] = @original_RoleID" 
                    InsertCommand="INSERT INTO [RoleDetial] ([RoleID], [MenuItemNameID], [Selecting], [Inserting], [Updateing], [Deleting]) VALUES (@RoleID, @MenuItemNameID, @Selecting, @Inserting, @Updateing, @Deleting)" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    
                    SelectCommand="SELECT [RoleID], [MenuItemNameID], [Selecting], [Inserting], [Updateing], [Deleting] FROM [RoleDetial]" 
                    UpdateCommand="UPDATE [RoleDetial] SET [MenuItemNameID] = @MenuItemNameID, [Selecting] = @Selecting, [Inserting] = @Inserting, [Updateing] = @Updateing, [Deleting] = @Deleting WHERE [RoleID] = @original_RoleID">
                    <DeleteParameters>
                        <asp:Parameter Name="original_RoleID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="RoleID" Type="Int32" />
                        <asp:Parameter Name="MenuItemNameID" Type="Int32" DefaultValue="" />
                        <asp:Parameter Name="Selecting" Type="Boolean" DefaultValue="True" />
                        <asp:Parameter Name="Inserting" Type="Boolean" DefaultValue="True" />
                        <asp:Parameter Name="Updateing" Type="Boolean" DefaultValue="True" />
                        <asp:Parameter Name="Deleting" Type="Boolean" DefaultValue="True" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="MenuItemNameID" Type="Int32" />
                        <asp:Parameter Name="Selecting" Type="Boolean" DefaultValue="True" />
                        <asp:Parameter Name="Inserting" Type="Boolean" DefaultValue="True" />
                        <asp:Parameter Name="Updateing" Type="Boolean" DefaultValue="True" />
                        <asp:Parameter Name="Deleting" Type="Boolean" DefaultValue="True" />
                        <asp:Parameter Name="original_RoleID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceMenuItemName" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=E_STORE;Integrated Security=True" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [MenuItemNameID], [PageText] FROM [MenuItemName]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceRoles" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=E_STORE;Integrated Security=True" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [RoleID], [RoleName] FROM [Roles]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td bgcolor="Yellow" style="text-align: center">
                <asp:Label ID="LblState" runat="server" Font-Bold="True" Font-Size="14px"></asp:Label>
            </td>
        </tr>
    </table>

