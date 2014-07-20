<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditorDailyConstraints.ascx.cs" Inherits="UC_EditorDailyConstraints" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<style type="text/css">
    .style1
    {
        width: 419px;
    }
    .style2
    {
        width: 88px;
    }
    .style3
    {
        width: 59px;
    }
    .style5
    {
        width: 98px;
    }
    .style7
    {
        width: 100px;
    }
    .style8
    {
        width: 300px;
        text-align: right;
    }
    .style9
    {
        width: 285px;
    }
</style>

<div dir="rtl">
<telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
<table class="style1" dir="rtl" align="center" style="width: 416px" border="1">
        <tr>
            <td colspan="2" style="text-align: center; direction: ltr;">
                <asp:Button ID="BtnBack" runat="server" onclick="BtnBack_Click" Text="عوده" 
                    Width="100px" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                    <asp:Label ID="Label25" runat="server" Font-Bold="True" Font-Size="14px" 
                        ForeColor="Black" Text="بحق بتاريخ القيد"></asp:Label>
            </td>
            <td style="text-align: right" class="style9">
                    <telerik:RadDatePicker ID="RDPSearch" Runat="server" Culture="en-US" 
                        DateInput-EmptyMessage="MinDate" MaxDate="3000-01-01" 
                        MinDate="1000-01-01" Width="200px" AutoPostBack="True" 
                        onselecteddatechanged="RDPSearch_SelectedDateChanged">
                        <Calendar>
                            <SpecialDays>
                                <telerik:RadCalendarDay ItemStyle-CssClass="rcToday" Repeatable="Today">
                                    <ItemStyle CssClass="rcToday" />
                                </telerik:RadCalendarDay>
                            </SpecialDays>
                        </Calendar>
                        <DateInput DateFormat="d/M/yyyy" 
                            InvalidStyleDuration="100" AutoPostBack="True">
                        </DateInput>
                    </telerik:RadDatePicker>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label10" runat="server" Text="جميع القيود" Font-Bold="True" 
                    Font-Size="14px" ForeColor="Black"></asp:Label>
            </td>
            <td style="text-align: right" class="style9">
                <telerik:RadComboBox ID="RCBBillz" Runat="server" 
                    LoadingMessage="تحميل..." Width="200px" 
                    onselectedindexchanged="RCBBillz_SelectedIndexChanged" 
                    AutoPostBack="True" MarkFirstMatch="True">
                </telerik:RadComboBox>
                <asp:Button ID="BtnNewBill" runat="server" Text="قيد جديد" Width="100px" 
                    Font-Bold="True" Font-Size="14px" ForeColor="#353535" 
                    onclick="BtnNewBill_Click" />
                <asp:Button ID="BtnDelBill" runat="server" Text="حذف" Width="100px" 
                    Font-Bold="True" Font-Size="14px" ForeColor="#353535" 
                    onclick="BtnDelBill_Click" 
                    onclientclick="javascript: return confirm('هل انت متاكد ؟')" />
            </td>
        </tr>
    </table>
    <asp:Panel ID="PnlGeneral" runat="server" Visible="False">
    
        <table align="center" class="style1" dir="rtl" style="width: 424px" border="1">
            <tr>
                <td class="style5" valign="top">
                    <asp:Label ID="Label24" runat="server" Font-Bold="True" Font-Size="14px" 
                        ForeColor="Black" Text="رقم القيد"></asp:Label>
                </td>
                <td class="style8">
                    <asp:TextBox ID="TxtID" runat="server" style="text-align: right" Width="200px" 
                        ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style5" valign="top">
                    <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="14px" 
                        ForeColor="Black" Text="السنه الماليه"></asp:Label>
                </td>
                <td class="style8">
                    <telerik:RadComboBox ID="RCBYearID" Runat="server" LoadingMessage="تحميل..." 
                        MarkFirstMatch="True" Skin="Sunset" Width="200px">
                    </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Size="14px" 
                        ForeColor="Black" Text="رقم القيد في السجل"></asp:Label>
                </td>
                <td class="style8" style="text-align: right">
                    <asp:TextBox ID="TxtKIEDNO" runat="server" Width="200px" 
                        style="text-align: right"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="14px" 
                        ForeColor="Black" Text="تاريخ القيد"></asp:Label>
                </td>
                <td class="style8">
                    <telerik:RadDatePicker ID="RDPKIEDDATE" Runat="server" Culture="en-US" 
                        DateInput-EmptyMessage="MinDate" MaxDate="3000-01-01" 
                        MinDate="1000-01-01" Width="200px">
                        <Calendar>
                            <SpecialDays>
                                <telerik:RadCalendarDay ItemStyle-CssClass="rcToday" Repeatable="Today">
                                    <ItemStyle CssClass="rcToday" />
                                </telerik:RadCalendarDay>
                            </SpecialDays>
                        </Calendar>
                        <DateInput DateFormat="d/M/yyyy" 
                            InvalidStyleDuration="100">
                        </DateInput>
                    </telerik:RadDatePicker>
                </td>
            </tr>
            <tr>
                <td class="style5">
                    &nbsp;</td>
                <td style="text-align: right" class="style8">
                    <asp:Button ID="BtnUpdateBill" runat="server" Font-Bold="True" Font-Size="14px" 
                        ForeColor="#353535" onclick="BtnUpdateBill_Click" Text="حفظ التعديل" 
                        Width="100px" onclientclick="javascript: return confirm('هل انت متاكد ؟')" />
                    <asp:Button ID="BtnUpdateBillCancel" runat="server" Font-Bold="True" 
                        Font-Size="14px" ForeColor="#353535" onclick="BtnUpdateBillCancel_Click" 
                        Text="الغاء التعديل" Visible="False" Width="100px" />
                    <asp:Button ID="BtnAddBill" runat="server" Font-Bold="True" Font-Size="14px" 
                        ForeColor="#353535" onclick="BtnAddBill_Click" Text="اضافة" Width="100px" />
                </td>
            </tr>
        </table>
    </asp:Panel>
    
</div>
    <asp:Panel ID="PnlDetials" runat="server" Visible="False">
    <table class="style1" dir="rtl" align="center" border="1">
        <tr>
            <td style="text-align: center">
                        <asp:ImageButton ID="BtnShowHide" runat="server" Height="25px" 
                            ImageUrl="~/Images/ShowHide.png" style="text-align: center" Width="50px" 
                            onclick="BtnShowHide_Click" />
            </td>
        </tr>
        <tr>
            <td bgcolor="Yellow" style="text-align: center">
                        <asp:Label ID="LblState" runat="server" Font-Bold="True" Font-Size="16px"></asp:Label>
            </td>
        </tr>
    </table>
        <table align="center" class="style7">
            <tr>
                <td>
                    <asp:SqlDataSource ID="SqlDataSourceCodez" runat="server" 
                        ConflictDetection="CompareAllValues" 
                        ConnectionString="Data Source=.;Initial Catalog=E_STORE;Integrated Security=True" 
                        
                        DeleteCommand="DELETE FROM [TBLTRAANSDETAILS] WHERE [TRANSID] = @original_TRANSID AND [TNO] = @original_TNO" InsertCommand="INSERT INTO [TBLTRAANSDETAILS] ([TRANSID], [TNO], [AccountIdM], [AccountIdD], [Madeen], [Daien], [kieddes]) VALUES (@TRANSID, 
(SELECT ISNULL(MAX(TNO) + 1, 1) FROM TBLTRAANSDETAILS),
 @AccountIdM, @AccountIdD, @Madeen, @Daien, @kieddes)" 
                        OldValuesParameterFormatString="original_{0}" 
                        ProviderName="System.Data.SqlClient" 
                        SelectCommand="SELECT TRANSID, TNO, AccountIdM, AccountIdD, (SELECT AccountName FROM TblAccounts WHERE (AccountId = TBLTRAANSDETAILS.AccountIdM)) AS AccountNameM, (SELECT AccountName FROM TblAccounts AS TblAccounts_1 WHERE (AccountId = TBLTRAANSDETAILS.AccountIdD)) AS AccountNameD, Madeen, Daien, kieddes FROM TBLTRAANSDETAILS WHERE (TRANSID = @TRANSID)" UpdateCommand="UPDATE [TBLTRAANSDETAILS] SET [Madeen] = @Madeen, [Daien] = @Daien, [kieddes] = @kieddes,
AccountIdD = @AccountIdD, AccountIdM = @AccountIdM
 WHERE [TRANSID] = @original_TRANSID AND [TNO] = @original_TNO" 
                        onselected="SqlDataSourceCodez_Selected">
                        <DeleteParameters>
                            <asp:Parameter Name="original_TRANSID" Type="Int32" />
                            <asp:Parameter Name="original_TNO" Type="Byte" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="RCBBillz" Name="TRANSID" 
                                PropertyName="SelectedValue" Type="Int32" />
                            <asp:Parameter Name="AccountIdM" Type="Int32" />
                            <asp:Parameter Name="AccountIdD" Type="Int32" />
                            <asp:Parameter Name="Madeen" Type="Double" />
                            <asp:Parameter Name="Daien" Type="Double" />
                            <asp:Parameter Name="kieddes" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="RCBBillz" Name="TRANSID" 
                                PropertyName="SelectedValue" Type="Int16" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="Madeen" Type="Double" />
                            <asp:Parameter Name="Daien" Type="Double" />
                            <asp:Parameter Name="kieddes" Type="String" />
                            <asp:Parameter Name="AccountIdD" />
                            <asp:Parameter Name="AccountIdM" />
                            <asp:Parameter Name="original_TRANSID" Type="Int32" />
                            <asp:Parameter Name="original_TNO" Type="Byte" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <telerik:RadGrid ID="RadGridEditor" runat="server" 
                        AllowFilteringByColumn="True" AllowPaging="True" AutoGenerateColumns="False" 
                        DataSourceID="SqlDataSourceCodez" EnableTheming="True" Font-Bold="True" 
                        Font-Size="14px" ForeColor="Black" GridLines="None" 
                        onitemdeleted="RadGridEditor_ItemDeleted" 
                        oniteminserted="RadGridEditor_ItemInserted" 
                        onitemupdated="RadGridEditor_ItemUpdated" ShowStatusBar="True" Skin="Vista">
                        <SortingSettings SortToolTip="اضغظ هنا للترتيب" />
                        <ValidationSettings CommandsToValidate="Insert,Update" />
                        <MasterTableView AllowAutomaticDeletes="True" AllowAutomaticInserts="True" 
                            AllowAutomaticUpdates="True" CommandItemDisplay="TopAndBottom" 
                            datakeynames="TRANSID,TNO,AccountIdM,AccountIdD" 
                            datasourceid="SqlDataSourceCodez" Dir="RTL" Font-Names="Arial" Font-Size="16px" 
                            ForeColor="Black" GridLines="None" HorizontalAlign="NotSet" 
                            NoDetailRecordsText="لا يوجد سجلات داخليه" NoMasterRecordsText="لا يوجد سجلات">
                            <CommandItemSettings AddNewRecordText="اضافه" RefreshText="تجديد البيانات" />
                            <GroupHeaderItemStyle ForeColor="Black" />
                            <CommandItemStyle Font-Bold="False" />
                            <RowIndicatorColumn Visible="False">
                                <HeaderStyle Width="20px" />
                            </RowIndicatorColumn>
                            <ExpandCollapseColumn ButtonType="ImageButton" Resizable="False" 
                                Visible="False">
                                <HeaderStyle ForeColor="Black" Width="20px" />
                            </ExpandCollapseColumn>
                            <Columns>
                                <telerik:GridBoundColumn DataField="TNO" DataType="System.Byte" 
                                    HeaderText="رقم الترتيب" ReadOnly="True" SortExpression="TNO" UniqueName="TNO">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn DataField="AccountIdM" DataType="System.Int32" 
                                    HeaderText="حساب مدين" SortExpression="AccountIdM" UniqueName="AccountIdM">
                                    <EditItemTemplate>
                                        <table border="1" dir="ltr">
                                            <tr>
                                                <td class="style3">
                                                    <asp:Panel ID="PnlPopD" runat="server" BackColor="White" BorderColor="#3399FF" 
                                                        BorderStyle="Solid" Height="200px" HorizontalAlign="NotSet" ScrollBars="Auto" 
                                                        style="direction: ltr">
                                                        <telerik:RadPanelBar ID="RadPanelBarD" Runat="server" 
                                                            onload="RadPanelBarM_Load" Skin="Vista" style="text-align: center">
                                                        </telerik:RadPanelBar>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Button ID="BtnD" runat="server" onclick="BtnD_Click" Text="اختيار" 
                                                        Width="100px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="LblItemD" runat="server" Text='<%# Eval("AccountNameD") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style3">
                                                    <asp:HiddenField ID="HiddenFieldAccountIdD" runat="server" 
                                                        Value='<%# Bind("AccountIdD") %>' />
                                                </td>
                                            </tr>
                                        </table>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="AccountIdDLabel" runat="server" 
                                            Text='<%# Eval("AccountNameD") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="Madeen" DataType="System.Double" 
                                    HeaderText="مدين" SortExpression="Madeen" UniqueName="Madeen">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn DataField="AccountIdD" DataType="System.Int32" 
                                    HeaderText="حساب دائن" SortExpression="AccountIdD" UniqueName="AccountIdD">
                                    <EditItemTemplate>
                                        <table border="1" dir="ltr">
                                            <tr>
                                                <td>
                                                    <asp:Panel ID="PnlPopM" runat="server" BackColor="White" BorderColor="#3399FF" 
                                                        BorderStyle="Solid" Height="200px" HorizontalAlign="NotSet" ScrollBars="Auto" 
                                                        style="direction: ltr">
                                                        <telerik:RadPanelBar ID="RadPanelBarM" Runat="server" 
                                                            onload="RadPanelBarM_Load" Skin="Vista" style="text-align: center">
                                                        </telerik:RadPanelBar>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style3">
                                                    <asp:Button ID="BtnM" runat="server" onclick="BtnM_Click" Text="اختيار" 
                                                        Width="100px" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:HiddenField ID="HiddenFieldAccountIdM" runat="server" 
                                                        Value='<%# Bind("AccountIdM") %>' />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style3">
                                                    <asp:Label ID="LblItemM" runat="server" Text='<%# Eval("AccountNameM") %>'></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="AccountIdMLabel" runat="server" 
                                            Text='<%# Eval("AccountNameM") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="Daien" DataType="System.Double" 
                                    HeaderText="دائن" SortExpression="Daien" UniqueName="Daien">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn DataField="kieddes" HeaderText="ملاحظات" 
                                    SortExpression="kieddes" UniqueName="kieddes">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="kieddesTextBox" runat="server" Height="89px" 
                                            Text='<%# Bind("kieddes") %>' TextMode="MultiLine" Width="223px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="kieddesLabel" runat="server" Text='<%# Eval("kieddes") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridTemplateColumn>
                                <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Edit" 
                                    UniqueName="EditColumn">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridButtonColumn>
                                <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" 
                                    ConfirmDialogType="RadWindow" ConfirmText="هل انت متأكد؟" 
                                    ConfirmTitle="تحـــزير" UniqueName="DeleteColumn">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridButtonColumn>
                            </Columns>
                            <EditFormSettings>
                                <EditColumn ButtonType="ImageButton" CancelText="الغاء" EditText="تعديل" 
                                    InsertImageUrl="~/Images/AddTGrid.png" InsertText="اضافه" 
                                    UpdateText="حفظ التعديل">
                                    <FooterStyle ForeColor="Black" />
                                    <HeaderStyle ForeColor="Black" />
                                    <ItemStyle ForeColor="Black" />
                                </EditColumn>
                                <FormStyle ForeColor="Black" />
                                <FormTableStyle ForeColor="Black" />
                                <FormMainTableStyle ForeColor="Black" />
                                <FormTableAlternatingItemStyle ForeColor="Black" />
                                <FormTableButtonRowStyle ForeColor="Black" />
                                <FormTableItemStyle Font-Size="16px" ForeColor="Black" />
                                <PopUpSettings ScrollBars="None" />
                            </EditFormSettings>
                            <ItemStyle ForeColor="Black" />
                            <EditItemStyle ForeColor="Black" />
                            <PagerStyle NextPagesToolTip="الصفحات التاليه" NextPageToolTip="الصفحه التاليه" 
                                PagerTextFormat="تغير الصفحه: {4} &amp;nbsp;الصفحه المعروضه {0} من {1}, الصف {2} الي {3} من {5}." 
                                PrevPagesToolTip="الصفحات السابقه" PrevPageToolTip="صفحه السابقه" />
                            <HeaderStyle ForeColor="Black" />
                        </MasterTableView>
                        <EditItemStyle Font-Bold="True" ForeColor="Black" />
                        <CommandItemStyle Font-Bold="False" ForeColor="Black" />
                        <ItemStyle ForeColor="Black" />
                        <StatusBarSettings LoadingText="تحميل....." ReadyText="جاهز" />
                    </telerik:RadGrid>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:Label ID="LblMadeen" runat="server" BorderColor="Lime" 
                        BorderStyle="Solid" BorderWidth="5px" Font-Bold="True" Font-Size="14px" 
                        style="text-align: center"></asp:Label>
                    <asp:Label ID="LblDayen" runat="server" BorderColor="Lime" 
                        BorderStyle="Solid" BorderWidth="5px" Font-Bold="True" Font-Size="14px" 
                        style="text-align: center"></asp:Label>
                </td>
            </tr>
        </table>
        <table align="center" style="width: 299px" border="1">
            <tr>
                <td style="text-align: right" valign="top">
                    <telerik:RadDatePicker ID="RDPTrhelDate" Runat="server" Culture="en-US" 
                        DateInput-EmptyMessage="MinDate" MaxDate="3000-01-01" MinDate="1000-01-01" 
                        style="direction: rtl" Width="200px">
                        <Calendar>
                            <SpecialDays>
                                <telerik:RadCalendarDay ItemStyle-CssClass="rcToday" Repeatable="Today">
                                    <ItemStyle CssClass="rcToday" />
                                </telerik:RadCalendarDay>
                            </SpecialDays>
                        </Calendar>
                        <DateInput DateFormat="d/M/yyyy" InvalidStyleDuration="100">
                        </DateInput>
                    </telerik:RadDatePicker>
                </td>
                <td style="text-align: right" valign="top">
                    <asp:Label ID="Label23" runat="server" Font-Bold="True" Font-Size="14px" 
                        ForeColor="Black" Text="تاريخ الترحيل"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align: right" valign="top">
                    <asp:CheckBox ID="CBtrhel" runat="server" AutoPostBack="True" 
                        oncheckedchanged="CBtrhel_CheckedChanged" 
                        onclientclick="javascript: return confirm('هل انت متاكد ؟')" />
                    <br />
                    <asp:Panel ID="PnlTarhel" runat="server" BorderColor="Red" BorderStyle="Double" 
                        Visible="False" Width="160px">
                        <asp:Label ID="Label22" runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Red" Text="هل انت متأكد ؟"></asp:Label>
                        <br />
                        <asp:Button ID="BtnTarhelCancel" runat="server" Height="20px" 
                            onclick="BtnTarhelCancel_Click" Text="الغاء" Width="80px" />
                        <asp:Button ID="BtnTarhelOK" runat="server" Height="20px" 
                            onclick="BtnTarhelOK_Click" Text="موافق" Width="80px" />
                    </asp:Panel>
                </td>
                <td style="text-align: right" valign="top">
                    <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Size="14px" 
                        ForeColor="Black" Text="يتم ترحيله"></asp:Label>
                </td>
            </tr>
        </table>
</asp:Panel>


