<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CdYear.ascx.cs" Inherits="CdYear" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
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
                    GridLines="None" AllowPaging="True" Font-Bold="True" 
                    ForeColor="Black" ShowStatusBar="True" 
                    AllowFilteringByColumn="True" AutoGenerateColumns="False" 
                    EnableTheming="True" Skin="Vista" Width="600px" 
                    onitemdeleted="RadGridEditor_ItemDeleted" 
                    oniteminserted="RadGridEditor_ItemInserted" 
                    onitemupdated="RadGridEditor_ItemUpdated" style="text-align: right">
                    <SortingSettings SortToolTip="اضغظ هنا للترتيب" />
                    <ValidationSettings CommandsToValidate="Insert,Update" />
        <MasterTableView datakeynames="YearID" datasourceid="SqlDataSourceCodez" 
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
                <telerik:GridBoundColumn DataField="YearName" 
                    HeaderText="السنة المالية" SortExpression="YearName" 
                    UniqueName="YearName">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="YStartDate" DataType="System.DateTime" 
                    HeaderText="تاريخ البداية" SortExpression="YStartDate" UniqueName="YStartDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TxtStart" runat="server" Text="<%# bind('YStartDate') %>" 
                            Width="150px"></asp:TextBox>
                        <cc1:CalendarExtender ID="TxtStart_CalendarExtender" runat="server" 
                            Enabled="True" Format="dd/MM/yyyy" TargetControlID="TxtStart">
                        </cc1:CalendarExtender>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LblStart" runat="server" Text="<%# bind('YStartDate') %>"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="YEndDate" DataType="System.DateTime" 
                    HeaderText="تاريخ النهاية" SortExpression="YEndDate" UniqueName="YEndDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TxtEnd" runat="server" Text="<%# bind('YEndDate') %>" 
                            Width="150px"></asp:TextBox>
                        <cc1:CalendarExtender ID="TxtEnd_CalendarExtender" runat="server" 
                            Enabled="True" Format="dd/MM/yyyy" TargetControlID="TxtEnd">
                        </cc1:CalendarExtender>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LblEnd" runat="server" Text="<%# bind('YEndDate') %>"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridTemplateColumn>
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
                    DeleteCommand="DELETE FROM [CdYear] WHERE [YearID] = @original_YearID" 
                    InsertCommand="INSERT INTO [CdYear] ([YearID], [YearName], [YStartDate], [YEndDate]) VALUES ((SELECT ISNULL(MAX(YearID) + 1, 1) AS NewID FROM CdYear), @YearName, Convert(Datetime, @YStartDate, 103), Convert(Datetime, @YEndDate, 103))" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT        YearID, YearName, CONVERT(varchar, YStartDate, 103) AS YStartDate, CONVERT(varchar, YEndDate, 103) AS YEndDate
FROM            CdYear" 
                    
                    
                    
                    
                    
                    UpdateCommand="UPDATE [CdYear] SET [YearName] = @YearName, [YStartDate] = Convert(Datetime, @YStartDate, 103), [YEndDate] = Convert(Datetime, @YEndDate, 103) WHERE [YearID] = @original_YearID">
                    <DeleteParameters>
                        <asp:Parameter Name="original_YearID" Type="Byte" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="YearName" Type="String" />
                        <asp:Parameter Name="YStartDate" Type="String" />
                        <asp:Parameter Name="YEndDate" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="YearName" Type="String" />
                        <asp:Parameter Name="YStartDate" Type="String" />
                        <asp:Parameter Name="YEndDate" Type="String" />
                        <asp:Parameter Name="original_YearID" Type="Byte" />
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