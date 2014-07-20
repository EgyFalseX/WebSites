<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CDMawad.ascx.cs" Inherits="CDMawad" %>
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

        <MasterTableView datakeynames="mawad_no" datasourceid="SqlDataSourceCodez" 
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
                <telerik:GridBoundColumn DataField="mowad_name" 
                    HeaderText="أسم المادة بالعربيه" SortExpression="mowad_name" 
                    UniqueName="mowad_name">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="shortcut" 
                    HeaderText="اسم مختصر بالعربيه" SortExpression="shortcut" 
                    UniqueName="shortcut">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="mowad_name_e" HeaderText="أسم المادة بالانجليزيه" 
                    SortExpression="mowad_name_e" UniqueName="mowad_name_e">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="shortcut_e" HeaderText="اسم مختصر بالانجليزيه" 
                    SortExpression="shortcut_e" UniqueName="shortcut_e">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridCheckBoxColumn DataField="kg" DataType="System.Boolean" 
                    HeaderText="رياض اطفال" SortExpression="kg" UniqueName="kg">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridCheckBoxColumn>
                <telerik:GridCheckBoxColumn DataField="prim" DataType="System.Boolean" 
                    HeaderText="ابتدائي" SortExpression="prim" UniqueName="prim">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridCheckBoxColumn>
                <telerik:GridCheckBoxColumn DataField="prp" DataType="System.Boolean" 
                    HeaderText="اعدادي" SortExpression="prp" UniqueName="prp">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridCheckBoxColumn>
                <telerik:GridCheckBoxColumn DataField="sec" DataType="System.Boolean" 
                    HeaderText="ثانوي" SortExpression="sec" UniqueName="sec">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridCheckBoxColumn>
                <telerik:GridCheckBoxColumn DataField="gadwal" DataType="System.Boolean" 
                    HeaderText="جدول الحصص" SortExpression="gadwal" UniqueName="gadwal">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridCheckBoxColumn>
                <telerik:GridCheckBoxColumn DataField="exam" DataType="System.Boolean" 
                    HeaderText="الكنترول" SortExpression="exam" UniqueName="exam">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridCheckBoxColumn>
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
                    DeleteCommand="DELETE FROM [CDMawad] WHERE [mawad_no] = @original_mawad_no" 
                    InsertCommand="INSERT INTO [CDMawad] ([mawad_no], [mowad_name], [shortcut], [mowad_name_e], [shortcut_e], [kg], [prim], [prp], [sec], [gadwal], [exam]) Select (Select ISNULL(MAX(mawad_no) + 1, 1) From CDMawad), @mowad_name, @shortcut, @mowad_name_e, @shortcut_e, @kg, @prim, @prp, @sec, @gadwal, @exam" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [mawad_no], [mowad_name], [shortcut], [mowad_name_e], [shortcut_e], [kg], [prim], [prp], [sec], [gadwal], [exam] FROM [CDMawad]" 
                    
                    
                    
                    
                    UpdateCommand="UPDATE [CDMawad] SET [mowad_name] = @mowad_name, [shortcut] = @shortcut, [mowad_name_e] = @mowad_name_e, [shortcut_e] = @shortcut_e, [kg] = @kg, [prim] = @prim, [prp] = @prp, [sec] = @sec, [gadwal] = @gadwal, [exam] = @exam WHERE [mawad_no] = @original_mawad_no">
                    <DeleteParameters>
                        <asp:Parameter Name="original_mawad_no" Type="Int16" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="mowad_name" Type="String" />
                        <asp:Parameter Name="shortcut" Type="String" />
                        <asp:Parameter Name="mowad_name_e" Type="String" />
                        <asp:Parameter Name="shortcut_e" Type="String" />
                        <asp:Parameter Name="kg" Type="Boolean" />
                        <asp:Parameter Name="prim" Type="Boolean" />
                        <asp:Parameter Name="prp" Type="Boolean" />
                        <asp:Parameter Name="sec" Type="Boolean" />
                        <asp:Parameter Name="gadwal" Type="Boolean" />
                        <asp:Parameter Name="exam" Type="Boolean" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="mowad_name" Type="String" />
                        <asp:Parameter Name="shortcut" Type="String" />
                        <asp:Parameter Name="mowad_name_e" Type="String" />
                        <asp:Parameter Name="shortcut_e" Type="String" />
                        <asp:Parameter Name="kg" Type="Boolean" />
                        <asp:Parameter Name="prim" Type="Boolean" />
                        <asp:Parameter Name="prp" Type="Boolean" />
                        <asp:Parameter Name="sec" Type="Boolean" />
                        <asp:Parameter Name="gadwal" Type="Boolean" />
                        <asp:Parameter Name="exam" Type="Boolean" />
                        <asp:Parameter Name="original_mawad_no" Type="Int16" />
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

