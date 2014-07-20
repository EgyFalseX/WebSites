<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CDAlsofof.ascx.cs" Inherits="CDAlsofof" %>
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
                    EnableTheming="True" Skin="Hay" Width="800px" 
                    onitemdeleted="RadGridEditor_ItemDeleted" 
                    oniteminserted="RadGridEditor_ItemInserted" 
                    onitemupdated="RadGridEditor_ItemUpdated">
                    <SortingSettings SortToolTip="اضغظ هنا للترتيب" />
                    <ValidationSettings CommandsToValidate="Insert,Update" />
<SortingSettings SortToolTip="اضغظ هنا للترتيب"></SortingSettings>

<ValidationSettings CommandsToValidate="Insert,Update"></ValidationSettings>

        <MasterTableView datakeynames="alsofof_code" datasourceid="SqlDataSourceCodez" 
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
                <telerik:GridBoundColumn DataField="alsofof_name" 
                    HeaderText="اسم الصف بالعربيه" SortExpression="alsofof_name" 
                    UniqueName="alsofof_name">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="alsofof_name_e" 
                    HeaderText="اسم الصف بالانجليزيه" SortExpression="alsofof_name_e" 
                    UniqueName="alsofof_name_e">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridDropDownColumn DataField="marhala_code" 
                    DataSourceID="SqlDataSourceCDMarahel" DropDownControlType="DropDownList" 
                    HeaderText="اسم المرحله" ListTextField="marhala_name" 
                    ListValueField="marhala_code" SortExpression="marhala_code" 
                    UniqueName="marhala_code">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridDropDownColumn>
                <telerik:GridBoundColumn DataField="Shortly" HeaderText="مختصر بالعربيه" 
                    SortExpression="Shortly" UniqueName="Shortly">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Shortlye" HeaderText="مختصر بالانجليزيه" 
                    SortExpression="Shortlye" UniqueName="Shortlye">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridButtonColumn  UniqueName="EditColumn" ButtonType="ImageButton" 
                    CommandName="Edit" Text="تعديل" />
                <telerik:GridButtonColumn  UniqueName="DeleteColumn" 
                    ConfirmText="هل انت متأكد؟" ConfirmDialogType="RadWindow"
                ConfirmTitle="تحـــزير" ButtonType="ImageButton" CommandName="Delete" 
                    Text="حذف" />
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
            <FormMainTableStyle ForeColor="Black" HorizontalAlign="Center" />
            <FormTableAlternatingItemStyle ForeColor="Black" Font-Bold="True" 
                Font-Size="16px" />
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
                    ConnectionString="Data Source=.;Initial Catalog=eschool;Integrated Security=True" 
                    DeleteCommand="DELETE FROM [CDAlsofof] WHERE [alsofof_code] = @original_alsofof_code" 
                    InsertCommand="INSERT INTO [CDAlsofof] ([alsofof_code], [alsofof_name], [marhala_code], [alsofof_name_e], [Shortly], [Shortlye]) Select (Select ISNULL(MAX(alsofof_code) + 1, 1) From CDAlsofof),
 @alsofof_name, @marhala_code, @alsofof_name_e, @Shortly, @Shortlye" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [alsofof_code], [alsofof_name], [marhala_code], [alsofof_name_e], [Shortly], [Shortlye] FROM [CDAlsofof]" 
                    
                    
                    
                    
                    
                    
                    
                    
                    UpdateCommand="UPDATE [CDAlsofof] SET [alsofof_name] = @alsofof_name, [marhala_code] = @marhala_code, [alsofof_name_e] = @alsofof_name_e, [Shortly] = @Shortly, [Shortlye] = @Shortlye WHERE [alsofof_code] = @original_alsofof_code">
                    <DeleteParameters>
                        <asp:Parameter Name="original_alsofof_code" Type="Byte" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="alsofof_name" Type="String" />
                        <asp:Parameter Name="marhala_code" Type="Byte" />
                        <asp:Parameter Name="alsofof_name_e" Type="String" />
                        <asp:Parameter Name="Shortly" Type="String" />
                        <asp:Parameter Name="Shortlye" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="alsofof_name" Type="String" />
                        <asp:Parameter Name="marhala_code" Type="Byte" />
                        <asp:Parameter Name="alsofof_name_e" Type="String" />
                        <asp:Parameter Name="Shortly" Type="String" />
                        <asp:Parameter Name="Shortlye" Type="String" />
                        <asp:Parameter Name="original_alsofof_code" Type="Byte" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceCDMarahel" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=eschool;Integrated Security=True" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    
                    SelectCommand="SELECT [marhala_code], [marhala_name], [marhala_name_e] FROM [CDMarahel]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td bgcolor="Yellow" style="text-align: center">
                <asp:Label ID="LblState" runat="server" Font-Bold="True" Font-Size="14px"></asp:Label>
            </td>
        </tr>
    </table>

