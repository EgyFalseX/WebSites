<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditorBankSarf.ascx.cs" Inherits="EditorBankSarf" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<style type="text/css">
    .style1
    {
        width: 360px;
    }
    .style3
    {
        width: 261px;
    }
    .style4
    {
        width: 83px;
    }
</style>
                <telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
                </telerik:RadScriptManager>
<table class="style1" dir="rtl" align="center" border="1">
                <tr>
                    <td style="text-align: center" colspan="2">
                <asp:Button ID="BtnBack" runat="server" onclick="BtnBack_Click" Text="عوده" 
                    Width="100px" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center" colspan="2">
                <asp:Label ID="Label11" runat="server" ForeColor="Red" 
                    Text="الحقول المطلوبه: رقم الشيك, اسم الحساب, " Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Black" Text="اسم الحساب"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DDLbankacountcode" runat="server" 
                            Width="155px" 
                            onselectedindexchanged="DDLbankacountcode_SelectedIndexChanged" 
                            AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right" valign="top">
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Black" Text="رقم الشيك"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="DDLsheek_no" runat="server" Width="155px">
                        </asp:DropDownList>
                        <asp:HiddenField ID="HiddenFieldDDLharaka_no" runat="server" 
                            Value='<%# Bind("sheek_no") %>' />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Black" Text="رقم الايصال"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Txtesal_no" runat="server" Text='<%# Bind("esal_no") %>' 
                            Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Black" Text="مستفيد"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Txtsname" runat="server" Text='<%# Bind("sname") %>' 
                            Width="150px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Black" Text="تاريخ الايصال"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Txtsheek_date" runat="server" Text='<%# Bind("sheek_date") %>' 
                            Width="150px"></asp:TextBox>
                        <cc1:CalendarExtender ID="Txtsheek_date_CalendarExtender" runat="server" 
                            Format="dd/MM/yyyy" TargetControlID="Txtsheek_date">
                        </cc1:CalendarExtender>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Black" Text="تاريخ الاستحقاق"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Txteshkakdate" runat="server" Text='<%# Bind("eshkakdate") %>' 
                            Width="150px"></asp:TextBox>
                        <cc1:CalendarExtender ID="Txteshkakdate_CalendarExtender" runat="server" 
                            Format="dd/MM/yyyy" TargetControlID="Txteshkakdate">
                        </cc1:CalendarExtender>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right">
                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Black" Text="المبلغ"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Txttotalsheek" runat="server" Width="150px"></asp:TextBox>
                    </td>
                </tr>
                </table>
<table class="style1" align="center" border="1">
                <tr>
                    <td valign="top" style="direction: ltr; text-align: left" class="style3">
                        <telerik:RadTreeView ID="RadTreeViewAcc" Runat="server" Font-Bold="True" 
                            Font-Size="14px" ForeColor="Black" SingleExpandPath="True" Skin="Telerik" 
                            style="direction: ltr" Width="233px" Font-Names="Arial">
                        </telerik:RadTreeView>
                    </td>
                    <td style="text-align: right" dir="ltr" valign="top">
                        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Black" Text="كود الحساب"></asp:Label>
                    </td>
                </tr>
                </table>
<table class="style1" dir="rtl" align="center" border="1">
                <tr>
                    <td valign="top" style="text-align: right" class="style4">
                        <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Black" Text="البيان"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="Txtnotes" runat="server" Height="100px" 
                            Text='<%# Bind("notes") %>' TextMode="MultiLine" Width="262px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td valign="top" style="text-align: right" class="style4">
                        &nbsp;</td>
                    <td>
                        <asp:CheckBox ID="CheckBoxTrhel" runat="server" Font-Bold="True" Text="ترحيل" />
                    </td>
                </tr>
                <tr>
                    <td class="style4">
                        <asp:Button ID="BtnNew" runat="server" onclick="BtnNew_Click" Text="جديد" 
                            Width="80px" />
                    </td>
                    <td>
                        <asp:Button ID="BtnAdd" runat="server" onclick="BtnAdd_Click" Text="اضافه" 
                            Width="80px" />
                        <asp:Button ID="BtnUpdate" runat="server" onclick="BtnUpdate_Click" 
                            Text="تعديل" Width="80px" />
                    </td>
                </tr>
                <tr>
                    <td bgcolor="Yellow" colspan="2" style="text-align: center">
                        <asp:Label ID="LblState" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
<table align="center">
    <tr>
        <td>
                    <telerik:RadGrid ID="RadGridEditor" runat="server" 
                        AllowFilteringByColumn="True" AllowPaging="True" AutoGenerateColumns="False" 
                        DataSourceID="SqlDataSourceCodez" EnableTheming="True" Font-Bold="True" 
                        Font-Size="14px" ForeColor="Black" GridLines="None" 
                        onitemdeleted="RadGridEditor_ItemDeleted" 
                        ShowStatusBar="True" Skin="Vista" 
                        style="direction: ltr; text-align: center;" 
                        oneditcommand="RadGridEditor_EditCommand" 
                        onitemdatabound="RadGridEditor_ItemDataBound">
                        <SortingSettings SortToolTip="اضغظ هنا للترتيب" />
                        <ValidationSettings CommandsToValidate="Insert,Update" />
                        <MasterTableView AllowAutomaticDeletes="True" 
                            datakeynames="haraka_no,sheek_no" datasourceid="SqlDataSourceCodez" Dir="RTL" 
                            Font-Bold="True" Font-Names="Arial" Font-Size="14px" ForeColor="Black" 
                            GridLines="Both" HorizontalAlign="NotSet" 
                            NoDetailRecordsText="لا يوجد سجلات داخليه" NoMasterRecordsText="لا يوجد سجلات" 
                            ShowGroupFooter="True" TableLayout="Fixed">
                            <CommandItemSettings AddNewRecordText="اضافه" RefreshText="تجديد البيانات" />
                            <RowIndicatorColumn Visible="False">
                                <HeaderStyle Width="20px" />
                            </RowIndicatorColumn>
                            <ExpandCollapseColumn ButtonType="ImageButton" Resizable="False" 
                                Visible="False">
                                <HeaderStyle ForeColor="Black" Width="20px" />
                            </ExpandCollapseColumn>
                            <Columns>
                                <telerik:GridBoundColumn DataField="sheek_no" DataType="System.Double" 
                                    HeaderText="رقم الشيك" SortExpression="sheek_no" UniqueName="sheek_no" 
                                    ReadOnly="True">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="bankacountcode" DataType="System.Int32" 
                                    HeaderText="اسم الحساب" SortExpression="bankacountcode" 
                                    UniqueName="bankacountcode" ReadOnly="True" Display="False">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="bankacountname" HeaderText="اسم الحساب" 
                                    SortExpression="bankacountname" UniqueName="bankacountname">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="haraka_no" HeaderText="رقم الحركه" 
                                    SortExpression="haraka_no" UniqueName="haraka_no">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="esal_no" HeaderText="رقم الايصال" 
                                    SortExpression="esal_no" UniqueName="esal_no">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="sname" HeaderText="المستفيد" 
                                    SortExpression="sname" UniqueName="sname">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="sheek_date" DataType="System.DateTime" 
                                    HeaderText="تاريخ الايصال" SortExpression="sheek_date" UniqueName="sheek_date">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="eshkakdate" DataType="System.DateTime" 
                                    HeaderText="تاريخ الاستحقاق" SortExpression="eshkakdate" 
                                    UniqueName="eshkakdate">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="AccountId" DataType="System.Int32" 
                                    HeaderText="الحساب" SortExpression="AccountId" UniqueName="AccountId" 
                                    Display="False">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField=" AccountName" HeaderText="الحساب" 
                                    SortExpression=" AccountName" UniqueName=" AccountName">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="totalsheek" DataType="System.Double" 
                                    HeaderText="المبلغ" SortExpression="totalsheek" UniqueName="totalsheek">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridCheckBoxColumn DataField="trhel" DataType="System.Boolean" 
                                    HeaderText="تم ترحيله" SortExpression="trhel" UniqueName="trhel">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridCheckBoxColumn>
                                <telerik:GridBoundColumn DataField="notes" Display="False" HeaderText="ملاحظات" 
                                    SortExpression="notes" UniqueName="notes">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Edit" 
                                    UniqueName="EditColumn" HeaderText="تعديل">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridButtonColumn>
                                <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" 
                                    ConfirmDialogType="RadWindow" ConfirmText="هل انت متأكد؟" 
                                    ConfirmTitle="تحـــزير" UniqueName="DeleteColumn" HeaderText="حذف">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridButtonColumn>
                            </Columns>
                            <EditFormSettings>
                                <EditColumn ButtonType="ImageButton" CancelText="الغاء" EditText="تعديل" 
                                    InsertImageUrl="~/Images/AddTGrid.png" InsertText="اضافه" 
                                    UpdateText="حفظ التعديل">
                                    <FooterStyle ForeColor="Black" />
                                </EditColumn>
                                <FormTableStyle ForeColor="Black" HorizontalAlign="Center" Height="1px" 
                                    Width="1px" />
                                <FormMainTableStyle ForeColor="Black" />
                                <FormCaptionStyle HorizontalAlign="Center" VerticalAlign="Top" />
                                <FormTableItemStyle Font-Size="18px" HorizontalAlign="Center" 
                                    VerticalAlign="Top" />
                                <FormTableAlternatingItemStyle ForeColor="Black" HorizontalAlign="Center" 
                                    VerticalAlign="Top" />
                                <FormTableButtonRowStyle ForeColor="Black" HorizontalAlign="Center" 
                                    VerticalAlign="Top" />
                                <PopUpSettings ScrollBars="None" />
                            </EditFormSettings>
                            <ItemStyle ForeColor="Black" HorizontalAlign="Left" VerticalAlign="Top" />
                            <GroupHeaderItemStyle ForeColor="Black" />
                            <EditItemStyle ForeColor="Black" HorizontalAlign="Left" VerticalAlign="Top" />
                            <PagerStyle Font-Bold="False" NextPagesToolTip="الصفحات التاليه" 
                                NextPageToolTip="الصفحه التاليه" 
                                PagerTextFormat="تغير الصفحه: {4} &amp;nbsp;الصفحه المعروضه {0} من {1}, الصف {2} الي {3} من {5}." 
                                PrevPagesToolTip="الصفحات السابقه" PrevPageToolTip="صفحه السابقه" />
                            <HeaderStyle ForeColor="Black" />
                            <CommandItemStyle Font-Bold="False" />
                        </MasterTableView>
                        <EditItemStyle Font-Bold="True" ForeColor="Black" />
                        <FooterStyle ForeColor="Green" />
                        <CommandItemStyle Font-Bold="False" ForeColor="Black" />
                        <ItemStyle ForeColor="Black" HorizontalAlign="Left" />
                        <StatusBarSettings LoadingText="تحميل....." ReadyText="جاهز" />
                    </telerik:RadGrid>
                    <asp:SqlDataSource ID="SqlDataSourceCodez" runat="server" 
                        ConnectionString="Data Source=.;Initial Catalog=E_STORE;Integrated Security=True" 
                        DeleteCommand="DELETE FROM TBLalbankSarf WHERE (haraka_no = @original_haraka_no)" 
                        InsertCommand="INSERT INTO [TBLalbankSarf] ([sheek_no], [bankacountcode], [haraka_no], [esal_no], [sname], [sheek_date], [eshkakdate], [AccountId], [totalsheek], [notes], [trhel], [UserIn], [TimeIn]) VALUES (@sheek_no, @bankacountcode, (Select ISNULL(MAX(haraka_no) + 1, 1) AS NewID From TBLalbankSarf), @esal_no, @sname, @sheek_date, @eshkakdate, @AccountId, @totalsheek, @notes, @trhel, @UserIn, GETDATE())" 
                        OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                        SelectCommand="SELECT [sheek_no], [bankacountcode], [haraka_no], [esal_no], [sname], CONVERT(nvarchar, sheek_date, 103) AS sheek_date, 
                        CONVERT(nvarchar, eshkakdate, 103) AS eshkakdate, 
                        [AccountId], [totalsheek], [notes], [trhel], [UserIn], [TimeIn],
(Select AccountName From TblAccounts Where AccountId = TBLalbankSarf.AccountId) AS AccountName,
(Select bankacountname From CDbank Where bankacountcode = TBLalbankSarf.bankacountcode) AS bankacountname
 FROM [TBLalbankSarf]" 
                        
                        
                
                        
                UpdateCommand="UPDATE [TBLalbankSarf] SET [esal_no] = @esal_no, [sname] = @sname, [sheek_date] = @sheek_date, [eshkakdate] = @eshkakdate, [AccountId] = @AccountId, [totalsheek] = @totalsheek, [notes] = @notes, [trhel] = @trhel, [UserIn] = @UserIn, [TimeIn] = GETDATE() WHERE [haraka_no] = @original_haraka_no">
                        <DeleteParameters>
                            <asp:Parameter Name="original_haraka_no" Type="Double" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="sheek_no" Type="Double" />
                            <asp:Parameter Name="bankacountcode" Type="Int32" />
                            <asp:Parameter Name="esal_no" Type="String" />
                            <asp:Parameter Name="sname" Type="String" />
                            <asp:Parameter DbType="Date" Name="sheek_date" />
                            <asp:Parameter DbType="Date" Name="eshkakdate" />
                            <asp:Parameter Name="AccountId" Type="Int32" />
                            <asp:Parameter Name="totalsheek" Type="Double" />
                            <asp:Parameter Name="notes" Type="String" />
                            <asp:Parameter Name="trhel" Type="Boolean" />
                            <asp:SessionParameter Name="UserIn" SessionField="UserID" Type="Int32" />
                            <asp:Parameter Name="haraka_no" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="esal_no" Type="String" />
                            <asp:Parameter Name="sname" Type="String" />
                            <asp:Parameter DbType="Date" Name="sheek_date" />
                            <asp:Parameter DbType="Date" Name="eshkakdate" />
                            <asp:Parameter Name="AccountId" Type="Int32" />
                            <asp:Parameter Name="totalsheek" Type="Double" />
                            <asp:Parameter Name="notes" Type="String" />
                            <asp:Parameter Name="trhel" Type="Boolean" />
                            <asp:SessionParameter Name="UserIn" SessionField="UserID" Type="Int32" />
                            <asp:Parameter Name="original_haraka_no" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
        </td>
    </tr>
</table>

