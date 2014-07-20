<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditorBankSarf__.ascx.cs" Inherits="EditorBankSarf" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<style type="text/css">
    .style1
    {
        width: 331px;
    }
</style>
<div>
    <table align="center" class="style1" dir="rtl">
        <tr>
            <td>
                <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
                </telerik:RadScriptManager>
                <telerik:RadGrid ID="RadGridEditor" runat="server" 
                    DataSourceID="SqlDataSourceCodez" AllowPaging="True" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" ShowStatusBar="True" 
                    AllowFilteringByColumn="True" AutoGenerateColumns="False" 
                    EnableTheming="True" Skin="Vista" 
                    onitemdeleted="RadGridEditor_ItemDeleted" 
                    oniteminserted="RadGridEditor_ItemInserted" 
                    onitemupdated="RadGridEditor_ItemUpdated" GridLines="None" 
                    onitemdatabound="RadGridEditor_ItemDataBound" ShowFooter="True" 
                    BorderColor="Silver" ShowGroupPanel="True">
                    <SortingSettings SortToolTip="اضغظ هنا للترتيب" />
                    <ValidationSettings CommandsToValidate="Insert,Update" />
                    <ClientSettings AllowDragToGroup="True">
                    </ClientSettings>
        <MasterTableView datakeynames="sheek_no,bankacountcode" datasourceid="SqlDataSourceCodez" 
                                CommandItemDisplay="TopAndBottom" AllowAutomaticDeletes="True" 
                        AllowAutomaticInserts="True" AllowAutomaticUpdates="True" Dir="RTL" 
                        ForeColor="Black" GridLines="Both" HorizontalAlign="NotSet" 
                        NoDetailRecordsText="لا يوجد سجلات داخليه" 
                        NoMasterRecordsText="لا يوجد سجلات" 
                        Caption="سيتم حفظ القيد و ترحيله للحسابات بمجرد اضافته">
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
                <telerik:GridBoundColumn DataField="bankacountname" HeaderText="اسم الحساب" 
                    SortExpression="bankacountname" UniqueName="bankacountname">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="sheek_no" HeaderText="رقم الشيك" 
                    SortExpression="sheek_no" UniqueName="sheek_no">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="esal_no" 
                    HeaderText="رقم الايصال" SortExpression="esal_no" 
                    UniqueName="esal_no">
                    <HeaderStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="sname" HeaderText="مستفيد" 
                    SortExpression="sname" UniqueName="sname">
                    <HeaderStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="sheek_date" DataType="System.DateTime" 
                    HeaderText="تاريخ التحرير" SortExpression="sheek_date" 
                    UniqueName="sheek_date" DataFormatString="{0:dd/MM/yyyy}">
                    <HeaderStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="eshkakdate" DataType="System.DateTime" 
                    HeaderText="تاريخ الاستحقاق" SortExpression="eshkakdate" 
                    UniqueName="eshkakdate" DataFormatString="{0:dd/MM/yyyy}">
                    <HeaderStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="totalsheek" HeaderText="المبلغ" 
                    SortExpression="totalsheek" UniqueName="totalsheek">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="AccountId" HeaderText="كود الحساب" 
                    SortExpression="AccountId" UniqueName="AccountId">
                    <EditItemTemplate>
                        <telerik:RadTreeView ID="RadTreeViewCat" Runat="server" Font-Bold="True" 
                            Font-Size="14px" ForeColor="Black" onload="RadTreeViewCat_Load" 
                            onnodeclick="RadTreeViewCat_NodeClick" SingleExpandPath="True" Skin="Telerik" 
                            style="direction: rtl">
                        </telerik:RadTreeView>
                        <asp:HiddenField ID="HiddenFieldAccountIdEdit" runat="server" 
                            Value='<%# Bind("AccountId") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("AccountName", "{0}") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                </telerik:GridTemplateColumn>
                <telerik:GridBoundColumn DataField="notes" 
                    HeaderText="البيان" SortExpression="notes" UniqueName="notes">
                    <HeaderStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridButtonColumn  UniqueName="EditColumn" ButtonType="ImageButton" 
                    CommandName="Edit" HeaderText="تعديل" />
                <telerik:GridButtonColumn  UniqueName="DeleteColumn" 
                    ConfirmText="هل انت متأكد؟" ConfirmDialogType="RadWindow"
                ConfirmTitle="تحـــزير" ButtonType="ImageButton" CommandName="Delete" 
                    HeaderText="حذف" />
            </Columns>

        <EditFormSettings EditFormType="Template">
        <formtemplate>
        <div style="text-align: center">
            <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="14px" 
                ForeColor="Red" Text="سيتم حفظ القيد و ترحيله للحسابات بمجرد اضافته"></asp:Label>
            </div>
            
            <table class="style1" dir="rtl">
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Black" Text="اسم الحساب"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DDLbankacountcode" runat="server" 
                            SelectedValue='<%# Bind("bankacountcode") %>' Width="150px" 
                            DataSourceID="SqlDataSourcebankacountcode" DataTextField="bankacountname" 
                            DataValueField="bankacountcode">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Black" Text="رقم الشيك"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DDLsheek_no" runat="server" Width="150px">
                        </asp:DropDownList>
                        <asp:HiddenField ID="HiddenFieldDDLsheek_no" runat="server" 
                            Value='<%# Bind("sheek_no") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Black" Text="رقم الايصال"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Txtesal_no" runat="server" Text='<%# Bind("esal_no") %>' 
                            Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Black" Text="مستفيد"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Txtsname" runat="server" Text='<%# Bind("sname") %>' 
                            Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Black" Text="تاريخ الايصال"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Txtsheek_date" runat="server" Text='<%# Bind("sheek_date") %>' 
                            Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Black" Text="تاريخ الاستحقاق"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Txteshkakdate" runat="server" Text='<%# Bind("eshkakdate") %>' 
                            Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Black" Text="المبلغ"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Txttotalsheek" runat="server" Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Black" Text="كود الحساب"></asp:Label>
                    </td>
                    <td>
                        <telerik:RadTreeView ID="RadTreeViewAcc" Runat="server" Font-Bold="True" 
                            Font-Size="14px" ForeColor="Black" onload="RadTreeViewCat_Load" 
                            onnodeclick="RadTreeViewCat_NodeClick" SingleExpandPath="True" Skin="Telerik" 
                            style="direction: rtl">
                        </telerik:RadTreeView>
                        <asp:HiddenField ID="HiddenFieldAccountIdEdit" runat="server" 
                            Value='<%# Bind("AccountId") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Black" Text="البيان"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Txtnotes" runat="server" Height="100px" 
                            Text='<%# Bind("notes") %>' TextMode="MultiLine" Width="220px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>


     </formtemplate>
            <EditColumn ButtonType="ImageButton" CancelText="الغاء" EditText="تعديل" 
                InsertText="اضافه" UpdateText="حفظ التعديل">
                <FooterStyle ForeColor="Black" />
                <HeaderStyle ForeColor="Black" />
                <ItemStyle ForeColor="Black" />
            </EditColumn>
            <FormStyle ForeColor="Black" />
            <FormTableStyle ForeColor="Black" />
            <FormMainTableStyle ForeColor="Black" />
            <FormTableItemStyle ForeColor="Black" />
            <FormTableAlternatingItemStyle ForeColor="Black" />
            <FormTableButtonRowStyle ForeColor="Black" />
        <PopUpSettings ScrollBars="None"></PopUpSettings>
            
        </EditFormSettings>
            <ItemStyle ForeColor="Black" />
            <GroupHeaderItemStyle ForeColor="Black" />
            <EditItemStyle ForeColor="Red" />
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
                    DeleteCommand="DELETE FROM [TBLalbankSarf] WHERE [sheek_no] = @original_sheek_no AND [bankacountcode] = @original_bankacountcode" 
                    InsertCommand="INSERT INTO [TBLalbankSarf] ([sheek_no], [bankacountcode], [haraka_no], [esal_no], [sname], [sheek_date], [eshkakdate], [AccountId], [totalsheek], [notes], [trhel], [UserIn], [TimeIn]) VALUES (@sheek_no, @bankacountcode, (SELECT ISNULL(MAX(haraka_no) + 1, 1) AS NewID FROM TBLalbankSarf), @esal_no, @sname, @sheek_date, @eshkakdate, @AccountId, @totalsheek, @notes, @trhel, @UserIn, GETDATE())" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [sheek_no], [bankacountcode], [haraka_no], [esal_no], [sname], CONVERT(nvarchar, sheek_date, 103) AS sheek_date, CONVERT(nvarchar, eshkakdate, 103) AS eshkakdate, [AccountId], [totalsheek], [notes], [trhel], [UserIn], [TimeIn], (Select bankacountname From CDbank Where bankacountcode = TBLalbankSarf.bankacountcode) AS bankacountname, (Select AccountName From TblAccounts Where AccountId = TBLalbankSarf.AccountId) AS AccountName FROM [TBLalbankSarf]" 
                    
                    
                    
                    
                    
                    UpdateCommand="UPDATE [TBLalbankSarf] SET [esal_no] = @esal_no, [sname] = @sname, [sheek_date] = @sheek_date, [eshkakdate] = @eshkakdate, [AccountId] = @AccountId, [totalsheek] = @totalsheek, [notes] = @notes, [trhel] = @trhel, [UserIn] = @UserIn, [TimeIn] = GETDATE() WHERE [sheek_no] = @original_sheek_no AND [bankacountcode] = @original_bankacountcode" 
                    oninserted="SqlDataSourceCodez_Inserted">
                    <DeleteParameters>
                        <asp:Parameter Name="original_sheek_no" Type="Double" />
                        <asp:Parameter Name="original_bankacountcode" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="sheek_no" Type="Double" DefaultValue="" />
                        <asp:Parameter Name="bankacountcode" Type="Int32" DefaultValue="" />
                        <asp:Parameter Name="esal_no" Type="String" />
                        <asp:Parameter Name="sname" Type="String" />
                        <asp:Parameter Name="sheek_date" Type="DateTime" />
                        <asp:Parameter Name="eshkakdate" Type="DateTime" />
                        <asp:Parameter Name="AccountId" Type="Int32" />
                        <asp:Parameter Name="totalsheek" Type="Double" />
                        <asp:Parameter Name="notes" Type="String" />
                        <asp:Parameter Name="trhel" Type="Boolean" />
                        <asp:SessionParameter Name="UserIn" SessionField="UserID" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="haraka_no" Type="Int32" />
                        <asp:Parameter Name="esal_no" Type="String" />
                        <asp:Parameter Name="sname" Type="String" />
                        <asp:Parameter Name="sheek_date" Type="DateTime" />
                        <asp:Parameter Name="eshkakdate" Type="DateTime" />
                        <asp:Parameter Name="AccountId" Type="Int32" />
                        <asp:Parameter Name="totalsheek" Type="Double" />
                        <asp:Parameter Name="notes" Type="String" />
                        <asp:Parameter Name="trhel" Type="Boolean" />
                        <asp:SessionParameter Name="UserIn" SessionField="UserID" Type="Int32" />
                        <asp:Parameter Name="original_sheek_no" Type="Double" />
                        <asp:Parameter Name="original_bankacountcode" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                &nbsp;<asp:SqlDataSource ID="SqlDataSourcebankacountcode" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=E_STORE;Integrated Security=True" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT bankacountcode, bankacountname 
FROM [CDbank]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourcesheek_no" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=E_STORE;Integrated Security=True" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [sheek_no], [bankacountcode] FROM [TBLsheekno]
Where del = 'False' And used = 'False' And mortd = 'False'">
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


