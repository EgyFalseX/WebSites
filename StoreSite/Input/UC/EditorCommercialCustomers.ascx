<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditorCommercialCustomers.ascx.cs" Inherits="EditorCommercialCustomers" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<style type="text/css">
    .style1
    {
        width: 310px;
    }
    </style>
<div dir="rtl">
    <table class="style1" dir="rtl" align="center">
        <tr>
            <td style="text-align: center">
                <asp:Button ID="BtnBack" runat="server" onclick="BtnBack_Click" Text="عوده" 
                    Width="100px" />
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <asp:Label ID="Label1" runat="server" ForeColor="Red" 
                    Text="الحقول المطلوبه: اسم العميل, المحافظه, عنوان, الموبيل1"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
                </telerik:RadScriptManager>
                <asp:Button ID="BtnBackToDiscard" runat="server" 
                    onclick="BtnBackToDiscard_Click" Text="الي صفحة المرتجع" 
                    Width="100px" Visible="False" />
                <telerik:RadGrid ID="RadGridEditor" runat="server" DataSourceID="SqlDataSourceCodez" 
                    GridLines="None" AllowPaging="True" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" ShowStatusBar="True" 
                    AllowFilteringByColumn="True" AutoGenerateColumns="False" 
                    EnableTheming="True" Skin="Vista" 
                    onitemdeleted="RadGridEditor_ItemDeleted" 
                    oniteminserted="RadGridEditor_ItemInserted" 
                    onitemupdated="RadGridEditor_ItemUpdated">
                    <SortingSettings SortToolTip="اضغظ هنا للترتيب" />
                    <ValidationSettings CommandsToValidate="Insert,Update" />
        <MasterTableView datakeynames="CustomerId" datasourceid="SqlDataSourceCodez" 
                                CommandItemDisplay="TopAndBottom" AllowAutomaticDeletes="True" 
                        AllowAutomaticInserts="True" AllowAutomaticUpdates="True" Dir="RTL" 
                        ForeColor="Black" GridLines="None" HorizontalAlign="NotSet" 
                        NoDetailRecordsText="لا يوجد سجلات داخليه" 
                        NoMasterRecordsText="لا يوجد سجلات" Font-Bold="True" Font-Size="14px" 
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
                <telerik:GridBoundColumn DataField="Customer" HeaderText="اسم العميل" 
                    SortExpression="Customer" UniqueName="Customer">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Customernid" Display="False" 
                    HeaderText="الرقم القومي" SortExpression="Customernid" UniqueName="Customernid">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Customer_phone" HeaderText="تليفون العميل" 
                    SortExpression="Customer_phone" UniqueName="Customer_phone">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridDropDownColumn DataField="GOVId" DataSourceID="SqlDataSourceCdGov" 
                    DropDownControlType="DropDownList" HeaderText="المحافظه" ListTextField="GOV" 
                    ListValueField="GOVId" SortExpression="GOVId" UniqueName="GOVId">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridDropDownColumn>
                <telerik:GridBoundColumn DataField="Customeraddres" Display="False" 
                    HeaderText="العنوان" SortExpression="Customeraddres" 
                    UniqueName="Customeraddres">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="email" Display="False" HeaderText="البريد" 
                    SortExpression="email" UniqueName="email">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Customermobil1" Display="False" 
                    HeaderText="موبيل1" SortExpression="Customermobil1" UniqueName="Customermobil1">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Customermobil2" Display="False" 
                    HeaderText="موبيل2" SortExpression="Customermobil2" UniqueName="Customermobil2">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="AccountId" Display="False" ReadOnly="True" 
                    SortExpression="AccountId" UniqueName="AccountId">
                </telerik:GridBoundColumn>
                <telerik:GridCheckBoxColumn DataField="StopWork" DataType="System.Boolean" 
                    HeaderText="توقف الحساب" SortExpression="StopWork" UniqueName="StopWork">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
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
                    ConflictDetection="CompareAllValues" 
                    ConnectionString="Data Source=.;Initial Catalog=E_STORE;Integrated Security=True" 
                    DeleteCommand="DELETE FROM [TblCommercialCustomers] WHERE [CustomerId] = @original_CustomerId" 
                    InsertCommand="INSERT INTO [TblCommercialCustomers] ([CustomerId], [Customer], [Customernid], [Customer_phone], [GOVId], [Customeraddres], [email], [Customermobil1], [Customermobil2], [AccountId], [StopWork], [TimeIn], [UserIn]) VALUES ((SELECT ISNULL(MAX(CustomerId) + 1, 1) AS NewID FROM TblCommercialCustomers), @Customer, @Customernid, @Customer_phone, @GOVId, @Customeraddres, @email, @Customermobil1, @Customermobil2, @AccountId, @StopWork, GETDATE(), @UserIn)" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [CustomerId], [Customer], [Customernid], [Customer_phone], [GOVId], [Customeraddres], [email], [Customermobil1], [Customermobil2], [AccountId], [StopWork], 
(Select AccountTreeId From TblAccounts Where AccountId = TblCommercialCustomers.AccountId) AS AccountTreeId , 
[TimeIn], [UserIn] FROM [TblCommercialCustomers]" 
                    
                    
                    UpdateCommand="UPDATE [TblCommercialCustomers] SET [Customer] = @Customer, [Customernid] = @Customernid, [Customer_phone] = @Customer_phone, [GOVId] = @GOVId, [Customeraddres] = @Customeraddres, [email] = @email, [Customermobil1] = @Customermobil1, [Customermobil2] = @Customermobil2, [StopWork] = @StopWork, [TimeIn] = GETDATE(), [UserIn] = @UserIn WHERE [CustomerId] = @original_CustomerId" 
                    oninserting="SqlDataSourceCodez_Inserting">
                    <DeleteParameters>
                        <asp:Parameter Name="original_CustomerId" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Customer" Type="String" />
                        <asp:Parameter Name="Customernid" Type="String" />
                        <asp:Parameter Name="Customer_phone" Type="String" />
                        <asp:Parameter Name="GOVId" Type="Byte" />
                        <asp:Parameter Name="Customeraddres" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="Customermobil1" Type="String" />
                        <asp:Parameter Name="Customermobil2" Type="String" />
                        <asp:Parameter Name="AccountId" Type="Int32" />
                        <asp:Parameter Name="StopWork" Type="Boolean" />
                        <asp:SessionParameter Name="UserIn" SessionField="UserID" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Customer" Type="String" />
                        <asp:Parameter Name="Customernid" Type="String" />
                        <asp:Parameter Name="Customer_phone" Type="String" />
                        <asp:Parameter Name="GOVId" Type="Byte" />
                        <asp:Parameter Name="Customeraddres" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="Customermobil1" Type="String" />
                        <asp:Parameter Name="Customermobil2" Type="String" />
                        <asp:Parameter Name="StopWork" Type="Boolean" />
                        <asp:Parameter Name="TimeIn" Type="DateTime" />
                        <asp:SessionParameter Name="UserIn" SessionField="UserID" Type="Int32" />
                        <asp:Parameter Name="original_CustomerId" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSourceCdGov" runat="server" 
                    ConnectionString="Data Source=.;Initial Catalog=E_STORE;Integrated Security=True" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [GOVId], [GOV] FROM [CdGov]">
                </asp:SqlDataSource>
            </td>
        </tr>
        </table>

</div>