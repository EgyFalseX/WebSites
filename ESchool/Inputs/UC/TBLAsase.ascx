<%@ Control Language="C#" AutoEventWireup="true" CodeFile="TBLAsase.ascx.cs" Inherits="TBLAsase" %>
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

        <MasterTableView datakeynames="asase_code" datasourceid="SqlDataSourceCodez" 
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
                <telerik:GridBoundColumn DataField="asase_year" 
                    HeaderText="اسم العام الدراسي" SortExpression="asase_year" 
                    UniqueName="asase_year">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridDropDownColumn DataField="SPOS" DropDownControlType="DropDownList" 
                    HeaderText="اسم المدرسه" ListValueField="SPOS" SortExpression="SPOS" 
                    UniqueName="SPOS" DataSourceID="SqlDataSourceTBLSCHOOL" 
                    ListTextField="SCHOOL">
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
                    DeleteCommand="DELETE FROM [TBLAsase] WHERE [asase_code] = @original_asase_code" 
                    InsertCommand="INSERT INTO [TBLAsase] ([asase_code], [asase_year], [SPOS]) Select (Select ISNULL(MAX(asase_code) + 1, 1) From TBLAsase), @asase_year, @SPOS" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [asase_code], [asase_year], [SPOS] FROM [TBLAsase]" 
                    
                    
                    
                    
                    UpdateCommand="UPDATE [TBLAsase] SET [asase_year] = @asase_year, [SPOS] = @SPOS WHERE [asase_code] = @original_asase_code">
                    <DeleteParameters>
                        <asp:Parameter Name="original_asase_code" Type="Byte" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="asase_year" Type="String" />
                        <asp:Parameter Name="SPOS" Type="Double" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="asase_year" Type="String" />
                        <asp:Parameter Name="SPOS" Type="Double" />
                        <asp:Parameter Name="original_asase_code" Type="Byte" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceTBLSCHOOL" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=eschool;Integrated Security=True" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [SPOS], [SCHOOL] FROM [TBLSCHOOL]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td bgcolor="Yellow" style="text-align: center">
                <asp:Label ID="LblState" runat="server" Font-Bold="True" Font-Size="14px"></asp:Label>
            </td>
        </tr>
    </table>

