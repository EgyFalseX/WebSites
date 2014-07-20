<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CdHeadCompany.ascx.cs" Inherits="CdHeadCompany" %>
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
        <MasterTableView datakeynames="HeadCompanyId" datasourceid="SqlDataSourceCodez" 
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
                <telerik:GridBoundColumn DataField="HeadCompanyName" 
                    HeaderText="إسم مركز الخدمة" SortExpression="HeadCompanyName" 
                    UniqueName="HeadCompanyName" Aggregate="Count">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="HeadComOfficial" 
                    HeaderText="مكتب مركز الخدمة" SortExpression="HeadComOfficial" 
                    UniqueName="HeadComOfficial">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="HeadComaddress" 
                    HeaderText="عنوان مركز الخدمة" SortExpression="HeadComaddress" 
                    UniqueName="HeadComaddress">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="HeadComTell" HeaderText="تليفون مركز الخدمة" 
                    SortExpression="HeadComTell" UniqueName="HeadComTell">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="HeadComMobil1" HeaderText="موبايل #1" 
                    SortExpression="HeadComMobil1" UniqueName="HeadComMobil1">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="HeadComMobil2" HeaderText="موبايل #2" 
                    SortExpression="HeadComMobil2" UniqueName="HeadComMobil2">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="HeadComfax" HeaderText="فاكس" 
                    SortExpression="HeadComfax" UniqueName="HeadComfax">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="HeadComEmail" HeaderText="إيميل" 
                    SortExpression="HeadComEmail" UniqueName="HeadComEmail">
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
                    DeleteCommand="DELETE FROM [CdHeadCompany] WHERE [HeadCompanyId] = @original_HeadCompanyId" 
                    InsertCommand="INSERT INTO [CdHeadCompany] ([HeadCompanyId], [HeadCompanyName], [HeadComOfficial], [HeadComaddress], [HeadComTell], [HeadComMobil1], [HeadComMobil2], [HeadComfax], [HeadComEmail], [UserIn], [TimeIn]) VALUES ((SELECT ISNULL(MAX(HeadCompanyId) + 1, 1) AS NewID FROM CdHeadCompany), @HeadCompanyName, @HeadComOfficial, @HeadComaddress, @HeadComTell, @HeadComMobil1, @HeadComMobil2, @HeadComfax, @HeadComEmail, @UserIn, @TimeIn)" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [HeadCompanyId], [HeadCompanyName], [HeadComOfficial], [HeadComaddress], [HeadComTell], [HeadComMobil1], [HeadComMobil2], [HeadComfax], [HeadComEmail], [UserIn], [TimeIn] FROM [CdHeadCompany]" 
                    
                    
                    
                    UpdateCommand="UPDATE [CdHeadCompany] SET [HeadCompanyName] = @HeadCompanyName, [HeadComOfficial] = @HeadComOfficial, [HeadComaddress] = @HeadComaddress, [HeadComTell] = @HeadComTell, [HeadComMobil1] = @HeadComMobil1, [HeadComMobil2] = @HeadComMobil2, [HeadComfax] = @HeadComfax, [HeadComEmail] = @HeadComEmail, [UserIn] = @UserIn, [TimeIn] = @TimeIn WHERE [HeadCompanyId] = @original_HeadCompanyId">
                    <DeleteParameters>
                        <asp:Parameter Name="original_HeadCompanyId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="HeadCompanyName" Type="String" />
                        <asp:Parameter Name="HeadComOfficial" Type="String" />
                        <asp:Parameter Name="HeadComaddress" Type="String" />
                        <asp:Parameter Name="HeadComTell" Type="String" />
                        <asp:Parameter Name="HeadComMobil1" Type="String" />
                        <asp:Parameter Name="HeadComMobil2" Type="String" />
                        <asp:Parameter Name="HeadComfax" Type="String" />
                        <asp:Parameter Name="HeadComEmail" Type="String" />
                        <asp:Parameter Name="UserIn" Type="Int32" />
                        <asp:Parameter Name="TimeIn" Type="DateTime" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="HeadCompanyName" Type="String" />
                        <asp:Parameter Name="HeadComOfficial" Type="String" />
                        <asp:Parameter Name="HeadComaddress" Type="String" />
                        <asp:Parameter Name="HeadComTell" Type="String" />
                        <asp:Parameter Name="HeadComMobil1" Type="String" />
                        <asp:Parameter Name="HeadComMobil2" Type="String" />
                        <asp:Parameter Name="HeadComfax" Type="String" />
                        <asp:Parameter Name="HeadComEmail" Type="String" />
                        <asp:Parameter Name="UserIn" Type="Int32" />
                        <asp:Parameter Name="TimeIn" Type="DateTime" />
                        <asp:Parameter Name="original_HeadCompanyId" Type="Int32" />
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