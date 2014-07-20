<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CDBank.ascx.cs" Inherits="CDBank" %>
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
                    onitemupdated="RadGridEditor_ItemUpdated" 
                    onitemdatabound="RadGridEditor_ItemDataBound">
                    <SortingSettings SortToolTip="اضغظ هنا للترتيب" />
                    <ValidationSettings CommandsToValidate="Insert,Update" />
        <MasterTableView datakeynames="bankacountcode" datasourceid="SqlDataSourceCodez" 
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
                <telerik:GridBoundColumn DataField="bankname" 
                    HeaderText="اسم البنك" SortExpression="bankname" 
                    UniqueName="bankname">
                    <FooterStyle HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="bankacountnumber" 
                    HeaderText="رقم الحساب البنكي" SortExpression="bankacountnumber" 
                    UniqueName="bankacountnumber">
                    <FooterStyle HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="bankacountname" 
                    HeaderText="اسم الحساب البنكي" SortExpression="bankacountname" 
                    UniqueName="bankacountname">
                    <FooterStyle HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="bankaddres" HeaderText="عنوان" 
                    SortExpression="bankaddres" UniqueName="bankaddres">
                    <FooterStyle HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="bankphone" HeaderText="رقم التليفون" 
                    SortExpression="bankphone" UniqueName="bankphone">
                    <FooterStyle HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridTemplateColumn DataField="AccountId" DataType="System.Int32" 
                    HeaderText="كود شجرة الحساب" SortExpression="AccountId" UniqueName="AccountId">
                    <EditItemTemplate>
                        <telerik:RadTreeView ID="RadTreeViewCat" Runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Black" onnodeclick="RadTreeViewCat_NodeClick" 
                            SingleExpandPath="True" Skin="Telerik" style="direction: rtl" 
                            onload="RadTreeViewCat_Load">
                        </telerik:RadTreeView>
                        <asp:HiddenField ID="HiddenFieldAccountIdEdit" runat="server" 
                            Value='<%# Bind("AccountId") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("AccountName", "{0}") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterStyle HorizontalAlign="Center" />
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
            <EditItemStyle ForeColor="Black" Font-Size="18px" />
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
                    DeleteCommand="DELETE FROM [CDbank] WHERE [bankacountcode] = @original_bankacountcode" 
                    InsertCommand="INSERT INTO [CDbank] ([bankacountcode], [bankname], [bankacountnumber], [bankacountname], [bankaddres], [bankphone], [AccountId], [UserIn], [TimeIn]) VALUES ((SELECT ISNULL(MAX(bankacountcode) + 1, 1) AS NewID FROM CDbank), @bankname, @bankacountnumber, @bankacountname, @bankaddres, @bankphone, @AccountId, @UserIn, GETDATE())" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [bankacountcode], [bankname], [bankacountnumber], [bankacountname], [bankaddres], [bankphone], [AccountId], [UserIn], [TimeIn], (Select AccountName From TblAccounts Where AccountId = CDbank.AccountId) AS AccountName FROM [CDbank]" 
                    
                    
                    
                    UpdateCommand="UPDATE [CDbank] SET [bankname] = @bankname, [bankacountnumber] = @bankacountnumber, [bankacountname] = @bankacountname, [bankaddres] = @bankaddres, [bankphone] = @bankphone, [AccountId] = @AccountId, [UserIn] = @UserIn, [TimeIn] = GETDATE() WHERE [bankacountcode] = @original_bankacountcode">
                    <DeleteParameters>
                        <asp:Parameter Name="original_bankacountcode" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="bankname" Type="String" />
                        <asp:Parameter Name="bankacountnumber" Type="String" />
                        <asp:Parameter Name="bankacountname" Type="String" />
                        <asp:Parameter Name="bankaddres" Type="String" />
                        <asp:Parameter Name="bankphone" Type="String" />
                        <asp:Parameter Name="AccountId" Type="Int32" />
                        <asp:SessionParameter Name="UserIn" SessionField="UserID" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="bankname" Type="String" />
                        <asp:Parameter Name="bankacountnumber" Type="String" />
                        <asp:Parameter Name="bankacountname" Type="String" />
                        <asp:Parameter Name="bankaddres" Type="String" />
                        <asp:Parameter Name="bankphone" Type="String" />
                        <asp:Parameter Name="AccountId" Type="Int32" />
                        <asp:SessionParameter Name="UserIn" SessionField="UserID" Type="Int32" />
                        <asp:Parameter Name="original_bankacountcode" Type="Int32" />
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