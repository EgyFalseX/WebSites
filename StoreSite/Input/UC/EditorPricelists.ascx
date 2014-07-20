<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditorPricelists.ascx.cs" Inherits="EditorPricelists" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<style type="text/css">
    .style1
    {
        width: 100px;
    }

.radInput_Default
{
	font:11px arial,tahoma,verdana,sans-serif;
	vertical-align:middle;
}

.radEnabledCss_Default 
{
	border:1px solid #626262;
}

.radEnabledCss_Default
{
	font:11px arial,tahoma,verdana,sans-serif;
	padding:2px 0 2px 1px;
	color:#333;
}

</style>
<div>
    <table align="center" class="style1" dir="rtl">
        <tr>
            <td>
                <asp:Button ID="BtnBack" runat="server" onclick="BtnBack_Click" Text="عوده" 
                    Width="100px" />
                <asp:Button ID="BtnEditorPriceListDetails" runat="server" 
                    onclick="BtnEditorPriceListDetails_Click" Text="الي تفاصيل قائمة الاسعار" 
                    Width="126px" />
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
                    <ValidationSettings EnableValidation="False" />
<SortingSettings SortToolTip="اضغظ هنا للترتيب"></SortingSettings>

                    <ValidationSettings EnableValidation="False" />
        <MasterTableView datakeynames="PricelistId" datasourceid="SqlDataSourceCodez" 
                                CommandItemDisplay="TopAndBottom" AllowAutomaticDeletes="True" 
                        AllowAutomaticInserts="True" AllowAutomaticUpdates="True" Dir="RTL" 
                        ForeColor="Black" GridLines="None" HorizontalAlign="NotSet" 
                        NoDetailRecordsText="لا يوجد سجلات داخليه" 
                        NoMasterRecordsText="لا يوجد سجلات" Font-Bold="True" Font-Size="14px" 
                        Font-Names="Arial">
         <CommandItemSettings AddNewRecordText="اضافه" 
                RefreshText="تجديد البيانات" />
<CommandItemSettings AddNewRecordText="اضافه" RefreshText="تجديد البيانات"></CommandItemSettings>

        <RowIndicatorColumn Visible="False">
        <HeaderStyle Width="20px"></HeaderStyle>
        </RowIndicatorColumn>
        <ExpandCollapseColumn Visible="False" Resizable="False" ButtonType="ImageButton">
        <HeaderStyle Width="20px" ForeColor="Black"></HeaderStyle>
            <ItemStyle ForeColor="Black" />
        </ExpandCollapseColumn>

            <Columns>
                <telerik:GridTemplateColumn DataField="CategoryId" DataType="System.Int32" 
                    HeaderText="التصنيف" SortExpression="CategoryId" UniqueName="CategoryId">
                    <EditItemTemplate>
                        <asp:HiddenField ID="HiddenFieldCategoryId" runat="server" 
                            onvaluechanged="HiddenFieldCategoryId_ValueChanged" 
                            Value="<%# Bind('CategoryId') %>" />
                        <telerik:RadComboBox ID="RadComboBoxCategoryId" Runat="server" 
                            MarkFirstMatch="True" SelectedValue='<%# Bind("CategoryId") %>' 
                            Width="160px" AutoPostBack="True" DataTextField="Customer" 
                            DataValueField="Customer" onload="RadComboBoxCategoryId_Load" 
                            onselectedindexchanged="RadComboBoxCategoryId_SelectedIndexChanged">
                        </telerik:RadComboBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="CategoryIdLabel" runat="server" Text='<%# Eval("Category") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="PricelistDatestart" 
                    HeaderText="تاريخ القائمة" SortExpression="PricelistDatestart" 
                    UniqueName="PricelistDatestart">
                    <EditItemTemplate>
                        <asp:TextBox ID="TxtStart" runat="server" Text="<%# bind('PricelistDatestart') %>" 
                            Width="150px"></asp:TextBox>
                        <cc1:CalendarExtender ID="TxtStart_CalendarExtender" runat="server" 
                            Enabled="True" Format="dd/MM/yyyy" TargetControlID="TxtStart">
                        </cc1:CalendarExtender>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="PricelistDatestartLabel" runat="server" 
                            Text='<%# Eval("PricelistDatestart") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="PricelistDateEnd" 
                    HeaderText="تاريخ انتهاء القائمة" SortExpression="PricelistDateEnd" 
                    UniqueName="PricelistDateEnd">
                    <EditItemTemplate>
                        <asp:TextBox ID="TxtEnd" runat="server" 
                            Text='<%# Bind("PricelistDateEnd") %>' Width="150px"></asp:TextBox>
                        <cc1:CalendarExtender ID="TxtEnd_CalendarExtender" runat="server" 
                            Enabled="True" Format="dd/MM/yyyy" TargetControlID="TxtEnd">
                        </cc1:CalendarExtender>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="PricelistDateEndLabel" runat="server" 
                            Text='<%# Bind("PricelistDateEnd") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="discount" HeaderText="الخصم التجاري" 
                    SortExpression="discount" UniqueName="discount">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridButtonColumn  UniqueName="EditColumn" ButtonType="ImageButton" 
                    CommandName="Edit" >
                    <HeaderStyle HorizontalAlign="Center" />
                </telerik:GridButtonColumn>
                <telerik:GridButtonColumn  UniqueName="DeleteColumn" 
                    ConfirmText="هل انت متأكد؟" ConfirmDialogType="RadWindow"
                ConfirmTitle="تحـــزير" ButtonType="ImageButton" CommandName="Delete" >
                    <HeaderStyle HorizontalAlign="Center" />
                </telerik:GridButtonColumn>
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

<FormTableStyle ForeColor="Black"></FormTableStyle>

<FormMainTableStyle ForeColor="Black"></FormMainTableStyle>

<FormTableItemStyle Font-Size="18px"></FormTableItemStyle>

<FormTableAlternatingItemStyle ForeColor="Black"></FormTableAlternatingItemStyle>

<FormTableButtonRowStyle ForeColor="Black"></FormTableButtonRowStyle>

        <PopUpSettings ScrollBars="None"></PopUpSettings>
            
        </EditFormSettings>
            <ItemStyle ForeColor="Black" />
            <GroupHeaderItemStyle ForeColor="Black" />

<GroupHeaderItemStyle ForeColor="Black"></GroupHeaderItemStyle>

            <EditItemStyle ForeColor="Black" />
            <PagerStyle NextPagesToolTip="الصفحات التاليه" NextPageToolTip="الصفحه التاليه" 
                PagerTextFormat="تغير الصفحه: {4} &amp;nbsp;الصفحه المعروضه {0} من {1}, الصف {2} الي {3} من {5}." 
                PrevPagesToolTip="الصفحات السابقه" PrevPageToolTip="صفحه السابقه" />
            <HeaderStyle ForeColor="Black" />
            <CommandItemStyle Font-Bold="False" />

<CommandItemStyle Font-Bold="False"></CommandItemStyle>
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
                    DeleteCommand="DELETE FROM [TblPricelists] WHERE [PricelistId] = @original_PricelistId" 
                    InsertCommand="INSERT INTO [TblPricelists] ([PricelistId], [CategoryId], [PricelistDatestart], [PricelistDateEnd], discount) SELECT (SELECT ISNULL(MAX(PricelistId) + 1, 1) AS Expr1 FROM TblPricelists), @CategoryId, Convert(datetime, @PricelistDatestart, 103), Convert(datetime, @PricelistDateEnd, 103), @discount" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [PricelistId], [CategoryId], Convert(nvarchar, PricelistDatestart, 103) AS PricelistDatestart, Convert(nvarchar, PricelistDateEnd, 103) AS PricelistDateEnd,
                    (Select Category From CdCategory Where CategoryId = TblPricelists.CategoryId) AS Category, discount
                     FROM [TblPricelists]" 
                    
                    
                    
                    
                    
                    
                    UpdateCommand="UPDATE [TblPricelists] SET [CategoryId] = @CategoryId, [PricelistDatestart] = Convert(date, @PricelistDatestart, 103), [PricelistDateEnd] = Convert(date, @PricelistDateEnd, 103), discount = @discount
 WHERE [PricelistId] = @original_PricelistId" oninserting="SqlDataSourceCodez_Inserting" 
                    onupdating="SqlDataSourceCodez_Updating">
                    <DeleteParameters>
                        <asp:Parameter Name="original_PricelistId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="PricelistId" Type="Int32" />
                        <asp:Parameter Name="CategoryId" Type="Int32" />
                        <asp:Parameter DbType="String" Name="PricelistDatestart" />
                        <asp:Parameter Name="PricelistDateEnd" DbType="String" />
                        <asp:Parameter Name="discount" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CategoryId" Type="Int32" />
                        <asp:Parameter DbType="String" Name="PricelistDatestart" />
                        <asp:Parameter Name="PricelistDateEnd" DbType="String" />
                        <asp:Parameter Name="original_PricelistId" Type="Int32" />
                        <asp:Parameter Name="discount" />
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