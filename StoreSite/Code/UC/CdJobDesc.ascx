<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CdJobDesc.ascx.cs" Inherits="CdJobDesc" %>
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
                    EnableTheming="True" Skin="Vista" Width="600px" 
                    onitemdeleted="RadGridEditor_ItemDeleted" 
                    oniteminserted="RadGridEditor_ItemInserted" 
                    onitemupdated="RadGridEditor_ItemUpdated">
                    <SortingSettings SortToolTip="اضغظ هنا للترتيب" />
                    <ValidationSettings CommandsToValidate="Insert,Update" />
        <MasterTableView datakeynames="JobDescId" datasourceid="SqlDataSourceCodez" 
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
                <telerik:GridBoundColumn DataField="JobDescName" 
                    HeaderText="اسم التوصيف" SortExpression="JobDescName" 
                    UniqueName="JobDescName">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="JobBisicSalary" DataType="System.Double" 
                    HeaderText="المرتب" SortExpression="JobBisicSalary" 
                    UniqueName="JobBisicSalary">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
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
                    DeleteCommand="DELETE FROM [CdJobDesc] WHERE [JobDescId] = @original_JobDescId" 
                    InsertCommand="INSERT INTO [CdJobDesc] ([JobDescId], [JobDescName], [JobBisicSalary]) VALUES ((SELECT ISNULL(MAX(JobDescId) + 1, 1) AS NewID FROM CdJobDesc), @JobDescName, @JobBisicSalary)" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [JobDescId], [JobDescName], [JobBisicSalary] FROM [CdJobDesc]" 
                    
                    
                    UpdateCommand="UPDATE [CdJobDesc] SET [JobDescName] = @JobDescName, [JobBisicSalary] = @JobBisicSalary WHERE [JobDescId] = @original_JobDescId">
                    <DeleteParameters>
                        <asp:Parameter Name="original_JobDescId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="JobDescName" Type="String" />
                        <asp:Parameter Name="JobBisicSalary" Type="Double" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="JobDescName" Type="String" />
                        <asp:Parameter Name="JobBisicSalary" Type="Double" />
                        <asp:Parameter Name="original_JobDescId" Type="Int32" />
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