<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditorAlkazna.ascx.cs" Inherits="_EditorAlkazna" %>
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
            <td style="text-align: center">
                <asp:Button ID="BtnBack" runat="server" onclick="BtnBack_Click" Text="عوده" 
                    Width="100px" />
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:Label ID="Label3" runat="server" ForeColor="Red" 
                    Text="الحقول المطلوبه: نوع الحركه"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <telerik:RadScriptManager ID="RadScriptManagerFX" Runat="server">
                <Services>
                <asp:ServiceReference Path="~/AutoComplete.asmx" />
                </Services>
                </telerik:RadScriptManager>
                <telerik:RadGrid ID="RadGridEditor" runat="server" DataSourceID="SqlDataSourceCodez" 
                    GridLines="None" AllowPaging="True" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" ShowStatusBar="True" 
                    AllowFilteringByColumn="True" AutoGenerateColumns="False" 
                    EnableTheming="True" Skin="Vista" 
                    onitemdeleted="RadGridEditor_ItemDeleted" 
                    oniteminserted="RadGridEditor_ItemInserted" 
                    onitemdatabound="RadGridEditor_ItemDataBound" AllowSorting="True">
                    <SortingSettings SortToolTip="اضغظ هنا للترتيب" />
                    <ValidationSettings CommandsToValidate="Insert,Update" />
                    <ClientSettings AllowColumnsReorder="True" ReorderColumnsOnClient="True">
                        <Selecting AllowRowSelect="True" />
                    </ClientSettings>
        <MasterTableView datakeynames="ActionId,HarakaNo" datasourceid="SqlDataSourceCodez" 
                                CommandItemDisplay="TopAndBottom" AllowAutomaticDeletes="True" 
                        AllowAutomaticInserts="True" AllowAutomaticUpdates="True" Dir="RTL" 
                        ForeColor="Black" GridLines="None" HorizontalAlign="NotSet" 
                        NoDetailRecordsText="لا يوجد سجلات داخليه" 
                        NoMasterRecordsText="لا يوجد سجلات" Font-Size="14px" Font-Names="Arial" 
                        Font-Bold="True">
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
                <telerik:GridDropDownColumn DataField="ActionId" 
                    DataSourceID="SqlDataSourceActionId" DropDownControlType="DropDownList" 
                    HeaderText="نوع الحركه" ListTextField="action_name" ListValueField="ActionId" 
                    SortExpression="action_name" UniqueName="ActionId" 
                    AutoPostBackOnFilter="True" FilterImageToolTip="تصنيف">
                    <FooterStyle HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Center" />
                </telerik:GridDropDownColumn>
                <telerik:GridBoundColumn DataField="HarakaNo" 
                    HeaderText="رقم الحركة" SortExpression="HarakaNo" 
                    UniqueName="HarakaNo" DataType="System.Int16" ReadOnly="True" 
                    Visible="False">
                    <FooterStyle HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="AccountId" HeaderText="الحساب" 
                    SortExpression="AccountId" UniqueName="AccountId">
                    <EditItemTemplate>
                        <telerik:RadTreeView ID="RadTreeViewCat" Runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Black" onnodeclick="RadTreeViewCat_NodeClick" 
                            SingleExpandPath="True" Skin="Telerik" style="direction: rtl" 
                            onload="RadTreeViewCat_Load" Font-Names="Arial">
                        </telerik:RadTreeView>
                        <asp:Label ID="LblAccName" runat="server" 
                            Text='<%# Bind("AccountName", "{0}") %>' ForeColor="Red"></asp:Label>
                        <asp:HiddenField ID="HiddenFieldAccountIdEdit" runat="server" 
                            Value='<%# Bind("AccountId") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("AccountName", "{0}") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterStyle HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Center" />
                </telerik:GridTemplateColumn>
                <telerik:GridTemplateColumn DataField="ActionDate" 
                    HeaderText="التاريخ" SortExpression="ActionDate" UniqueName="ActionDate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TxtStart" runat="server" Text="<%# bind('ActionDate') %>" 
                            Width="150px"></asp:TextBox>
                        <cc1:CalendarExtender ID="TxtStart_CalendarExtender" runat="server" 
                            Enabled="True" Format="dd/MM/yyyy" TargetControlID="TxtStart">
                        </cc1:CalendarExtender>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="LblDate" runat="server" Text="<%# bind('ActionDate') %>"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="Amony" DataType="System.Double" 
                    HeaderText="المبلغ" SortExpression="Amony" UniqueName="Amony" 
                    DataFormatString="{0:C}">
                    <FooterStyle HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="esal_no" HeaderText="رقم المستند" 
                    SortExpression="esal_no" UniqueName="esal_no">
                    <FooterStyle HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="notes" HeaderText="البيان" 
                    SortExpression="notes" UniqueName="notes">
                    <FooterStyle HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="namee" HeaderText="اسم المستلم/المسدد" 
                    SortExpression="namee" UniqueName="namee">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBoxnamee" runat="server" Text='<%# Bind("namee") %>' 
                            Width="100px"></asp:TextBox>
                        <cc1:AutoCompleteExtender ID="TextBoxnamee_AutoCompleteExtender" runat="server" 
                            CompletionInterval="1000" CompletionSetCount="12" EnableCaching="true" 
                            MinimumPrefixLength="1" ServiceMethod="GetnameeList" 
                            ServicePath="~/AutoComplete.asmx" TargetControlID="TextBoxnamee">
                        </cc1:AutoCompleteExtender>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("namee") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterStyle HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Center" />
                </telerik:GridTemplateColumn>
                <telerik:GridCheckBoxColumn DataField="closek" DataType="System.Boolean" 
                    HeaderText="اغلاق القيد" SortExpression="closek" UniqueName="closek">
                    <FooterStyle HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Center" />
                </telerik:GridCheckBoxColumn>
                <telerik:GridButtonColumn  UniqueName="EditColumn" ButtonType="ImageButton" CommandName="Edit" />
                <telerik:GridButtonColumn  UniqueName="DeleteColumn" ConfirmText="هل انت متأكد؟" ConfirmDialogType="RadWindow"
                ConfirmTitle="تحـــزير" ButtonType="ImageButton" CommandName="Delete" />
            </Columns>

        <EditFormSettings>
            <EditColumn ButtonType="ImageButton" CancelText="الغاء" EditText="تعديل" 
                InsertText="اضافه" UpdateText="حفظ التعديل" 
                InsertImageUrl="~/Images/AddTGrid.png">
                <FooterStyle ForeColor="Black" />
                <HeaderStyle ForeColor="Black" Font-Names="Arial" />
                <ItemStyle ForeColor="Black" Font-Names="Arial" />
            </EditColumn>
            <FormStyle ForeColor="Black" />
            <FormTableStyle ForeColor="Black" />
            <FormMainTableStyle ForeColor="Black" />
            <FormTableItemStyle ForeColor="Black" Font-Size="18px" Font-Names="Arial" />
            <FormTableAlternatingItemStyle ForeColor="Black" />
            <FormTableButtonRowStyle ForeColor="Black" Font-Size="18pt" />
        <PopUpSettings ScrollBars="None"></PopUpSettings>
            
        </EditFormSettings>
            <ItemStyle ForeColor="Black" />
            <GroupHeaderItemStyle ForeColor="Black" />
            <EditItemStyle ForeColor="Black" />
            <PagerStyle NextPagesToolTip="الصفحات التاليه" NextPageToolTip="الصفحه التاليه" 
                PagerTextFormat="تغير الصفحه: {4} &amp;nbsp;الصفحه المعروضه {0} من {1}, الصف {2} الي {3} من {5}." 
                PrevPagesToolTip="الصفحات السابقه" PrevPageToolTip="صفحه السابقه" />
            <HeaderStyle ForeColor="Black" />
            <CommandItemStyle Font-Bold="False" Font-Names="Arial" />
        </MasterTableView>
                    <EditItemStyle Font-Bold="True" ForeColor="Black" />
                    <CommandItemStyle Font-Bold="False" ForeColor="Black" />
                    <ItemStyle ForeColor="Black" Font-Names="Arial" />
                    <StatusBarSettings LoadingText="تحميل....." ReadyText="جاهز" />
                </telerik:RadGrid>
                <asp:SqlDataSource ID="SqlDataSourceCodez" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=E_STORE;Integrated Security=True" 
                    DeleteCommand="DELETE FROM [TblAlkazna] WHERE [ActionId] = @original_ActionId AND [HarakaNo] = @original_HarakaNo" 
                    InsertCommand="INSERT INTO [TblAlkazna] ([ActionId], [HarakaNo], [AccountId], [PairantId], [ActionDate], [Amony], [esal_no], [notes], [namee], [closek], [UserIn], [TimeIn]) select @ActionId, (SELECT ISNULL(MAX(HarakaNo) + 1, 1) AS NewID FROM TblAlkazna), @AccountId, @PairantId, CONVERT(Datetime, @ActionDate, 103), @Amony, @esal_no, @notes, @namee, @closek, @UserIn, GETDATE()" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [ActionId], [HarakaNo], [AccountId], [PairantId], CONVERT(nvarchar, [ActionDate], 103) AS [ActionDate], [Amony], [esal_no], [notes], [namee], [closek], [UserIn], [TimeIn], (Select AccountName From TblAccounts Where AccountId = TblAlkazna.AccountId) AS AccountName,
(Select action_name From CdActionkazna Where ActionId = TblAlkazna.ActionId) AS action_name
 FROM [TblAlkazna]" 
                    
                    
                    
                    
                    UpdateCommand="UPDATE [TblAlkazna] SET [ActionId] = @ActionId, [AccountId] = @AccountId, [ActionDate] = CONVERT(Datetime, @ActionDate, 103), [Amony] = @Amony, [esal_no] = @esal_no, [notes] = @notes, [namee] = @namee, [closek] = @closek, [UserIn] = @UserIn, [TimeIn] = GETDATE() WHERE  [HarakaNo] = @original_HarakaNo" 
                    oninserting="SqlDataSourceCodez_Inserting" 
                    onupdating="SqlDataSourceCodez_Updating">
                    <DeleteParameters>
                        <asp:Parameter Name="original_ActionId" Type="Byte" />
                        <asp:Parameter Name="original_HarakaNo" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ActionId" Type="Byte" />
                        <asp:ControlParameter ControlID="HiddenFieldAccountId" Name="AccountId" 
                            PropertyName="Value" Type="Int32" />
                        <asp:Parameter Name="PairantId" Type="Int32" />
                        <asp:Parameter Name="ActionDate" Type="String" />
                        <asp:Parameter Name="Amony" Type="Double" />
                        <asp:Parameter Name="esal_no" Type="String" />
                        <asp:Parameter Name="notes" Type="String" />
                        <asp:Parameter Name="namee" Type="String" />
                        <asp:SessionParameter Name="UserIn" SessionField="UserID" Type="Int32" />
                        <asp:Parameter Name="closek" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:ControlParameter ControlID="HiddenFieldAccountId" Name="AccountId" 
                            PropertyName="Value" Type="Int32" />
                        <asp:Parameter Name="ActionId" />
                        <asp:Parameter Name="ActionDate" Type="String" />
                        <asp:Parameter Name="Amony" Type="Double" />
                        <asp:Parameter Name="esal_no" Type="String" />
                        <asp:Parameter Name="notes" Type="String" />
                        <asp:Parameter Name="namee" Type="String" />
                        <asp:Parameter Name="closek" Type="Boolean" />
                        <asp:SessionParameter Name="UserIn" SessionField="UserID" Type="Int32" />
                        <asp:Parameter Name="original_ActionId" Type="Byte" />
                        <asp:Parameter Name="original_HarakaNo" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceActionId" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=E_STORE;Integrated Security=True" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [ActionId], [action_name] FROM [CdActionkazna]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourcenamee" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=E_STORE;Integrated Security=True" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT DISTINCT [namee] FROM [TblAlkazna]">
                </asp:SqlDataSource>
                <asp:HiddenField ID="HiddenFieldAccountId" runat="server" />
                <asp:HiddenField ID="HiddenFieldHarakaNo" runat="server" />
                <asp:HiddenField ID="HiddenFieldnamee" runat="server" />
            </td>
        </tr>
        <tr>
            <td bgcolor="Yellow" style="text-align: center">
                <asp:Label ID="LblState" runat="server" Font-Bold="True" Font-Size="14px"></asp:Label>
            </td>
        </tr>
    </table>
</div>
    