<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CDDEPT.ascx.cs" Inherits="CDDEPT" %>
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
                    ForeColor="Black" ShowStatusBar="True" AutoGenerateColumns="False" 
                    EnableTheming="True" Skin="Hay" Width="600px" 
                    onitemdeleted="RadGridEditor_ItemDeleted" 
                    oniteminserted="RadGridEditor_ItemInserted" 
                    onitemupdated="RadGridEditor_ItemUpdated">
                    <SortingSettings SortToolTip="اضغظ هنا للترتيب" />
                    <ValidationSettings CommandsToValidate="Insert,Update" />
<SortingSettings SortToolTip="اضغظ هنا للترتيب"></SortingSettings>

<ValidationSettings CommandsToValidate="Insert,Update"></ValidationSettings>

        <MasterTableView datakeynames="DPOS" datasourceid="SqlDataSourceCodez" 
                                CommandItemDisplay="TopAndBottom" AllowAutomaticDeletes="True" 
                        AllowAutomaticInserts="True" AllowAutomaticUpdates="True" Dir="RTL" 
                        ForeColor="Black" GridLines="None" HorizontalAlign="NotSet" 
                        NoDetailRecordsText="لا يوجد سجلات داخليه" 
                        NoMasterRecordsText="لا يوجد سجلات" Font-Size="16px" Font-Names="Arial" 
                        Font-Bold="True">
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
                <telerik:GridBoundColumn DataField="DEPT" 
                    HeaderText="اسم القسم بالعربيه" SortExpression="DEPT" 
                    UniqueName="DEPT">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="DEPT_e" 
                    HeaderText="اسم القسم بالانجليزيه" SortExpression="DEPT_e" 
                    UniqueName="DEPT_e">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridDropDownColumn DataField="EdaraId" HeaderText="اسم الاداره" 
                    ListTextField="EdaraName" ListValueField="EdaraId" SortExpression="EdaraId" 
                    UniqueName="EdaraId" DataSourceID="SqlDataSourceCDEdara" 
                    DropDownControlType="DropDownList">
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

<FormStyle ForeColor="Black"></FormStyle>

<FormTableStyle ForeColor="Black"></FormTableStyle>

<FormMainTableStyle ForeColor="Black"></FormMainTableStyle>

<FormTableAlternatingItemStyle ForeColor="Black"></FormTableAlternatingItemStyle>

<FormTableButtonRowStyle ForeColor="Black"></FormTableButtonRowStyle>

            <EditColumn ButtonType="ImageButton" CancelText="الغاء" EditText="تعديل" 
                InsertImageUrl="~/Images/AddTGrid.png" InsertText="اضافه" UpdateText="حفظ التعديل">
                <FooterStyle ForeColor="Black" />
                <HeaderStyle ForeColor="Black" />
                <ItemStyle ForeColor="Black" />
            </EditColumn>
            <FormStyle ForeColor="Black" Font-Bold="False" />
            <FormTableStyle ForeColor="Black" />
            <FormMainTableStyle ForeColor="Black" Font-Bold="False" Font-Italic="False" 
                Font-Overline="False" HorizontalAlign="Center" />

<FormTableItemStyle ForeColor="Black" Font-Size="18px"></FormTableItemStyle>

            <FormTableAlternatingItemStyle ForeColor="Black" Font-Bold="True" 
                Font-Size="16px" />
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

<CommandItemStyle Font-Bold="False" ForeColor="Black"></CommandItemStyle>

                    <ItemStyle ForeColor="Black" />
                    <StatusBarSettings LoadingText="تحميل....." ReadyText="جاهز" />

<StatusBarSettings ReadyText="جاهز" LoadingText="تحميل....."></StatusBarSettings>
                </telerik:RadGrid>
                <asp:SqlDataSource ID="SqlDataSourceCodez" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=eschool;Integrated Security=True" 
                    DeleteCommand="DELETE FROM [CDDEPT] WHERE [DPOS] = @original_DPOS" 
                    InsertCommand="INSERT INTO [CDDEPT] ([DPOS], [DEPT], [DEPT_e], [EdaraId]) Select (Select ISNULL(MAX(DPOS) + 1, 1) From CDDEPT), @DEPT, @DEPT_e, @EdaraId" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [DPOS], [DEPT], [DEPT_e], [EdaraId] FROM [CDDEPT]" 
                    
                    
                    
                    
                    UpdateCommand="UPDATE [CDDEPT] SET [DEPT] = @DEPT, [DEPT_e] = @DEPT_e, [EdaraId] = @EdaraId WHERE [DPOS] = @original_DPOS">
                    <DeleteParameters>
                        <asp:Parameter Name="original_DPOS" Type="Byte" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="DPOS" Type="Byte" />
                        <asp:Parameter Name="DEPT" Type="String" />
                        <asp:Parameter Name="DEPT_e" Type="String" />
                        <asp:Parameter Name="EdaraId" Type="Byte" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="DEPT" Type="String" />
                        <asp:Parameter Name="DEPT_e" Type="String" />
                        <asp:Parameter Name="EdaraId" Type="Byte" />
                        <asp:Parameter Name="original_DPOS" Type="Byte" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceCDEdara" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=eschool;Integrated Security=True" 
                    DeleteCommand="DELETE FROM [CDEdara] WHERE [EdaraId] = @original_EdaraId" 
                    InsertCommand="INSERT INTO [CDEdara] ([EdaraId], [EdaraName]) VALUES (@EdaraId, @EdaraName)" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [EdaraId], [EdaraName] FROM [CDEdara]" 
                    
                    
                    
                    
                    UpdateCommand="UPDATE [CDEdara] SET [EdaraName] = @EdaraName WHERE [EdaraId] = @original_EdaraId">
                    <DeleteParameters>
                        <asp:Parameter Name="original_EdaraId" Type="Byte" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="EdaraId" Type="Byte" />
                        <asp:Parameter Name="EdaraName" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="EdaraName" Type="String" />
                        <asp:Parameter Name="original_EdaraId" Type="Byte" />
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

