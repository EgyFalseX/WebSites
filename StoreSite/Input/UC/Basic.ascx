<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Basic.ascx.cs" Inherits="Basic" %>
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
            <td style="text-align: center">
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
                    onitemupdated="RadGridEditor_ItemUpdated" Width="900px">
                    <SortingSettings SortToolTip="اضغظ هنا للترتيب" />
                    <ValidationSettings CommandsToValidate="Insert,Update" />
        <MasterTableView datakeynames="CompID" datasourceid="SqlDataSourceCodez" 
                                CommandItemDisplay="TopAndBottom" AllowAutomaticDeletes="True" 
                        AllowAutomaticInserts="True" AllowAutomaticUpdates="True" Dir="RTL" 
                        ForeColor="Black" GridLines="None" HorizontalAlign="NotSet" 
                        NoDetailRecordsText="لا يوجد سجلات داخليه" 
                        NoMasterRecordsText="لا يوجد سجلات" Font-Bold="False" Font-Size="14pt" 
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
                <telerik:GridBoundColumn DataField="name" HeaderText="اسم الشركه" 
                    SortExpression="name" UniqueName="name">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="owner" HeaderText="اسم المسئول" 
                    SortExpression="owner" UniqueName="owner">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="addres" HeaderText="العنوان" 
                    SortExpression="addres" UniqueName="addres">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="phone1" HeaderText="تليفون 1" 
                    SortExpression="phone1" UniqueName="phone1">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="gov" 
                    HeaderText="المحافظه" SortExpression="gov" 
                    UniqueName="gov" Visible="False">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="town" HeaderText="البلده" 
                    SortExpression="town" UniqueName="town" Visible="False">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="phone2" HeaderText="تليفون 2" 
                    SortExpression="phone2" UniqueName="phone2" Visible="False">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="segel" HeaderText="سجل تجاري" 
                    SortExpression="segel" UniqueName="segel" Visible="False">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="drebea" HeaderText="بطاقة ضريبية" 
                    SortExpression="drebea" UniqueName="drebea" Visible="False">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridDropDownColumn DataField="year" DataSourceID="SqlDataSourceyear" 
                    DropDownControlType="DropDownList" HeaderText="السنه" ListTextField="YearName" 
                    ListValueField="YearID" SortExpression="year" UniqueName="year" Visible="False">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridDropDownColumn>
                <telerik:GridBoundColumn DataField="name_e" HeaderText="اسم الشركه بالانجليزيه" 
                    SortExpression="name_e" UniqueName="name_e" Visible="False">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="addres_e" 
                    HeaderText="عنوان الشركه بالانجليزيه" SortExpression="addres_e" 
                    UniqueName="addres_e" Visible="False">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="footer" HeaderText="سجل مبيعات" 
                    SortExpression="footer" UniqueName="footer" Visible="False">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
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
                    DeleteCommand="DELETE FROM [tbl_basic] WHERE [CompID] = @original_CompID" 
                    InsertCommand="INSERT INTO [tbl_basic] ([CompID], [gov], [town], [owner], [phone1], [phone2], [addres], [name], [segel], [drebea], [year], [شعار], [name_e], [addres_e], [footer]) Select (SELECT ISNULL(MAX(CompID) + 1, 1) AS NewID FROM tbl_basic), @gov, @town, @owner, @phone1, @phone2, @addres, @name, @segel, @drebea, @year, NULL, @name_e, @addres_e, @footer" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [CompID], [gov], [town], [owner], [phone1], [phone2], [addres], [name], [segel], [drebea], [year], [شعار], [name_e], [addres_e], [footer] FROM [tbl_basic]" 
                    
                    
                    
                    
                    UpdateCommand="UPDATE [tbl_basic] SET [gov] = @gov, [town] = @town, [owner] = @owner, [phone1] = @phone1, [phone2] = @phone2, [addres] = @addres, [name] = @name, [segel] = @segel, [drebea] = @drebea, [year] = @year, [name_e] = @name_e, [addres_e] = @addres_e, [footer] = @footer WHERE [CompID] = @original_CompID">
                    <DeleteParameters>
                        <asp:Parameter Name="original_CompID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="gov" Type="String" />
                        <asp:Parameter Name="town" Type="String" />
                        <asp:Parameter Name="owner" Type="String" />
                        <asp:Parameter Name="phone1" Type="String" />
                        <asp:Parameter Name="phone2" Type="String" />
                        <asp:Parameter Name="addres" Type="String" />
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="segel" Type="String" />
                        <asp:Parameter Name="drebea" Type="String" />
                        <asp:Parameter Name="year" Type="Int32" />
                        <asp:Parameter Name="شعار" Type="Object" />
                        <asp:Parameter Name="name_e" Type="String" />
                        <asp:Parameter Name="addres_e" Type="String" />
                        <asp:Parameter Name="footer" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="gov" Type="String" />
                        <asp:Parameter Name="town" Type="String" />
                        <asp:Parameter Name="owner" Type="String" />
                        <asp:Parameter Name="phone1" Type="String" />
                        <asp:Parameter Name="phone2" Type="String" />
                        <asp:Parameter Name="addres" Type="String" />
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="segel" Type="String" />
                        <asp:Parameter Name="drebea" Type="String" />
                        <asp:Parameter Name="year" Type="Int32" />
                        <asp:Parameter Name="name_e" Type="String" DefaultValue="" />
                        <asp:Parameter Name="addres_e" Type="String" />
                        <asp:Parameter Name="footer" Type="String" />
                        <asp:Parameter Name="original_CompID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceyear" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=E_STORE;Integrated Security=True" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [YearID], [YearName] FROM [CdYear]">
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