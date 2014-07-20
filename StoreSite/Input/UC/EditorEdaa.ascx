<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditorEdaa.ascx.cs" Inherits="EditorEdaa" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<style type="text/css">
    .style1
    {
        width: 367px;
    }

.RadGrid_Vista
{
    font:11px/14px "segoe ui",arial,sans-serif;
}

.RadGrid_Vista
{
    border:1px solid #a7bac5;
    background:#fcfcfc;
    color:#333;
}

.MasterTable_Vista
{
    border-collapse:separate !important;
}

.MasterTable_Vista
{
    font:11px/14px "segoe ui",arial,sans-serif;
}

.GridCommandRow_Vista
{
	background:url('mvwres://Telerik.Web.UI, Version=2008.1.415.35, Culture=neutral, PublicKeyToken=5798b630e02d74fc/Telerik.Web.UI.Skins.Vista.Grid.sprite.gif') 0 -200px repeat-x #5ca6bc;
	color:#fff;
}

.GridCommandRow_Vista a
{
	color:#fff;
	text-decoration:none;
}

.GridCommandRow_Vista img
{
	vertical-align:middle;
}

.GridHeader_Vista
{
    color:#333;
    text-decoration:none;
}

.GridHeader_Vista
{
	border:1px solid;
	border-color:#fff #fcfcfd #d5d5d5 #e7e8ea;
	padding-top:3px;
	padding-bottom:4px;
	background:url('mvwres://Telerik.Web.UI, Version=2008.1.415.35, Culture=neutral, PublicKeyToken=5798b630e02d74fc/Telerik.Web.UI.Skins.Vista.Grid.sprite.gif') 0 -400px repeat-x #f1f2f4;
	text-align:left;
	font-weight:normal;
}

.GridHeader_Vista
{
	padding-left:7px;
	padding-right:7px;
}

.GridHeader_Vista a
{
    color:#333;
    text-decoration:none;
}

.GridFilterRow_Vista input[type="text"]
{
	border:1px solid;
	border-color:#abadb3 #dbdfe6 #e3e9ef #e2e3ea;
	font:12px "segoe ui",arial,sans-serif;
	color:#333;
	vertical-align:middle;
}

.GridFilterRow_Vista img
{
	vertical-align:middle;
}

.GridFooter_Vista
{
	color:#999;
}

.GridPager_Vista
{
    background:url('mvwres://Telerik.Web.UI, Version=2008.1.415.35, Culture=neutral, PublicKeyToken=5798b630e02d74fc/Telerik.Web.UI.Skins.Vista.Grid.sprite.gif') 0 -600px repeat-x #f1fbfe;
    line-height:20px;
}

.PagerLeft_Vista
{
	float:left;
}

.GridPager_Vista div span
{
	color:#333;
}

.GridPager_Vista span
{
	color:#999;
}

.GridPager_Vista img
{
	vertical-align:middle;
}

.PagerRight_Vista
{
	float:right;
}

    .style4
    {
        width: 248px;
    }
    .style5
    {
        width: 237px;
    }
    
</style>

<table align="center" style="width: 373px" border="1">
    <tr>
        <td style="text-align: center" colspan="2">
                <telerik:RadScriptManager ID="RadScriptManagerFX" Runat="server">
                <Services>
                <asp:ServiceReference Path="~/AutoComplete.asmx" />
                </Services>
                </telerik:RadScriptManager>
                <asp:Button ID="BtnBack" runat="server" onclick="BtnBack_Click" Text="عوده" 
                    Width="100px" />
            </td>
    </tr>
    <tr>
        <td style="text-align: right; direction: rtl;" class="style4">
                <asp:Label ID="Lblharaka_no" runat="server" Font-Bold="True" Font-Names="Arial" 
                    Font-Size="14px"></asp:Label>
            </td>
        <td style="text-align: right">
                <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Names="Arial" 
                    Font-Size="14px" Text="رقم الحركه"></asp:Label>
            </td>
    </tr>
    <tr>
        <td style="text-align: right; direction: rtl;" class="style4">
                <asp:DropDownList ID="DDLedaatype" runat="server" Width="160px" 
                    onselectedindexchanged="DDLedaatype_SelectedIndexChanged" 
                    AutoPostBack="True">
                </asp:DropDownList>
            </td>
        <td style="text-align: right">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Names="Arial" 
                    Font-Size="14px" Text="نوع الايداع"></asp:Label>
            </td>
    </tr>
    <tr>
        <td style="text-align: right; direction: rtl;" class="style4">
                <asp:TextBox ID="Txtkasema_no" runat="server" Width="150px"></asp:TextBox>
        </td>
        <td style="text-align: right">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Names="Arial" 
                    Font-Size="14px" Text="القسيمه"></asp:Label>
            </td>
    </tr>
    <tr>
        <td style="text-align: right; direction: rtl;" class="style4">
                <asp:TextBox ID="Txttotalsheek" runat="server" Width="150px"></asp:TextBox>
        </td>
        <td style="text-align: right">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Names="Arial" 
                    Font-Size="14px" Text="المبلغ"></asp:Label>
            </td>
    </tr>
    <tr>
        <td style="text-align: right; direction: rtl;" class="style4">
                <asp:TextBox ID="Txtname" runat="server" Width="150px"></asp:TextBox>
        </td>
        <td style="text-align: right">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Names="Arial" 
                    Font-Size="14px" Text="المودع"></asp:Label>
            </td>
    </tr>
    <tr>
        <td style="text-align: right; direction: rtl;" class="style4">
                        <asp:TextBox ID="Txtedaadate" runat="server" Text='<%# Bind("sheek_date") %>' 
                            Width="150px"></asp:TextBox>
                        <cc1:CalendarExtender ID="Txtedaadate_CalendarExtender" runat="server" 
                            Format="dd/MM/yyyy" TargetControlID="Txtedaadate">
                        </cc1:CalendarExtender>
            </td>
        <td style="text-align: right">
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Arial" 
                    Font-Size="14px" Text="تاريخ الايداع"></asp:Label>
            </td>
    </tr>
    <tr>
        <td style="text-align: right; direction: rtl;" class="style4">
                <telerik:RadComboBox ID="RCBbankacountcode" Runat="server" Skin="Default" 
                    LoadingMessage="تحميل..." Width="140px" 
                    AutoPostBack="True" MarkFirstMatch="True">
                </telerik:RadComboBox>
                </td>
        <td style="text-align: right">
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Names="Arial" 
                    Font-Size="14px" Text="رقم الحساب"></asp:Label>
            </td>
    </tr>
    <tr>
        <td style="text-align: right; direction: rtl;" class="style4">
                <asp:TextBox ID="Txtnotes" runat="server" Height="70px" TextMode="MultiLine" 
                    Width="150px"></asp:TextBox>
        </td>
        <td style="text-align: right" valign="top">
                <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Names="Arial" 
                    Font-Size="14px" Text="البيان"></asp:Label>
            </td>
    </tr>
    </table>
<table align="center" border="1" style="width: 375px">
                <tr>
                    <td valign="top" style="direction: ltr; text-align: left" class="style4">
                        <telerik:RadTreeView ID="RadTreeViewAcc" Runat="server" Font-Bold="True" 
                            Font-Size="14px" ForeColor="Black" SingleExpandPath="True" Skin="Telerik" 
                            style="direction: ltr" Width="233px" Font-Names="Arial">
                        </telerik:RadTreeView>
                    </td>
                    <td style="text-align: right" dir="ltr" valign="top">
                        <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Black" Text="كود الحساب"></asp:Label>
                    </td>
                </tr>
                </table>
<table align="center" style="width: 373px" border="1">
    <tr>
        <td style="text-align: right; direction: rtl;" class="style5">
                <asp:TextBox ID="Txtbankedaaname" runat="server" Width="150px"></asp:TextBox>
        </td>
        <td style="text-align: right">
                <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Names="Arial" 
                    Font-Size="14px" Text="البنك الصادر منه الشيك"></asp:Label>
            </td>
    </tr>
    <tr>
        <td style="text-align: right; direction: rtl;" class="style5">
                        <asp:TextBox ID="Txtsheek_date" runat="server" Text='<%# Bind("sheek_date") %>' 
                            Width="150px"></asp:TextBox>
                        <cc1:CalendarExtender ID="Txtsheek_date_CalendarExtender" runat="server" 
                            Format="dd/MM/yyyy" TargetControlID="Txtsheek_date">
                        </cc1:CalendarExtender>
            </td>
        <td style="text-align: right">
                <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Names="Arial" 
                    Font-Size="14px" Text="تاريخ التحرير"></asp:Label>
            </td>
    </tr>
    <tr>
        <td style="text-align: right; direction: rtl;" class="style5">
                        <asp:TextBox ID="Txteshkakdate" runat="server" Text='<%# Bind("sheek_date") %>' 
                            Width="150px"></asp:TextBox>
                        <cc1:CalendarExtender ID="Txteshkakdate_CalendarExtender" runat="server" 
                            Format="dd/MM/yyyy" TargetControlID="Txteshkakdate">
                        </cc1:CalendarExtender>
            </td>
        <td style="text-align: right">
                <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Names="Arial" 
                    Font-Size="14px" Text="تاريخ الاستحقاق"></asp:Label>
            </td>
    </tr>
    <tr>
        <td style="text-align: right; direction: rtl;" class="style5">
                <asp:TextBox ID="Txtsheek_no" runat="server" Width="150px"></asp:TextBox>
        </td>
        <td style="text-align: right">
                <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Names="Arial" 
                    Font-Size="14px" Text="رقم الشيك"></asp:Label>
            </td>
    </tr>
    <tr>
        <td style="text-align: right; direction: rtl;" class="style5">
                <asp:CheckBox ID="CBtrhel" runat="server" Font-Bold="True" Font-Names="Arial" 
                    Text="ترحيل" />
        </td>
        <td style="text-align: right">
                &nbsp;</td>
    </tr>
    <tr>
        <td style="text-align: right" class="style5">
                <asp:Button ID="BtnUpdate" runat="server" Text="تعديل" Width="80px" 
                    Enabled="False" onclick="BtnUpdate_Click" />
                <asp:Button ID="BtnSave" runat="server" Text="حفظ" onclick="BtnSave_Click" 
                    Width="80px" />
        </td>
        <td style="text-align: right">
                <asp:Button ID="BtnNew" runat="server" Text="جديد" onclick="BtnNew_Click" 
                    Width="80px" />
            </td>
    </tr>
    <tr>
        <td style="text-align: center" bgcolor="Yellow" colspan="2">
                <asp:Label ID="LblState" runat="server" Font-Bold="False" Font-Names="Arial" 
                    Font-Size="14px"></asp:Label>
        </td>
    </tr>
    </table>
<table align="center" class="style1">
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
                            datakeynames="kasema_no,bankacountcode" datasourceid="SqlDataSourceCodez" Dir="RTL" 
                            Font-Bold="True" Font-Names="Arial" Font-Size="14px" ForeColor="Black" 
                            GridLines="Both" HorizontalAlign="NotSet" 
                            NoDetailRecordsText="لا يوجد سجلات داخليه" NoMasterRecordsText="لا يوجد سجلات" 
                            ShowGroupFooter="True">
                            <CommandItemSettings AddNewRecordText="اضافه" RefreshText="تجديد البيانات" />
                            <RowIndicatorColumn Visible="False">
                                <HeaderStyle Width="20px" />
                            </RowIndicatorColumn>
                            <ExpandCollapseColumn ButtonType="ImageButton" Resizable="False" 
                                Visible="False">
                                <HeaderStyle ForeColor="Black" Width="20px" />
                            </ExpandCollapseColumn>
                            <Columns>
                                <telerik:GridBoundColumn DataField="haraka_no" HeaderText="رقم الحركه" 
                                    SortExpression="haraka_no" UniqueName="haraka_no" DataType="System.Int32">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="edaatype" HeaderText="edaatype" 
                                    SortExpression="edaatype" UniqueName="edaatype" DataType="System.Byte" 
                                    Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="kasema_no" DataType="System.Double" 
                                    HeaderText="القسيمه" SortExpression="kasema_no" UniqueName="kasema_no" 
                                    Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="totalsheek" HeaderText="المبلغ" 
                                    SortExpression="totalsheek" UniqueName="totalsheek" 
                                    DataType="System.Double">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="name" HeaderText="المودع" 
                                    SortExpression="name" UniqueName="name" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="edaadate" HeaderText="تاريخ الايداع" 
                                    SortExpression="edaadate" UniqueName="edaadate" DataType="System.DateTime">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="bankacountcode" DataType="System.Int32" 
                                    HeaderText="bankacountcode" SortExpression="bankacountcode" 
                                    UniqueName="bankacountcode" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="notes" 
                                    HeaderText="البيان" SortExpression="notes" UniqueName="notes" 
                                    Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="AccountId" DataType="System.Int32" 
                                    HeaderText="AccountId" SortExpression="AccountId" UniqueName="AccountId" 
                                    Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="bankedaaname" HeaderText="البنك الصادر منه الشيك" 
                                    SortExpression="bankedaaname" UniqueName="bankedaaname" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="sheek_date" DataType="System.DateTime" 
                                    HeaderText="تاريخ التحرير" SortExpression="sheek_date" 
                                    UniqueName="sheek_date" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="eshkakdate" DataType="System.DateTime" 
                                    HeaderText="تاريخ الاستحقاق" SortExpression="eshkakdate" 
                                    UniqueName="eshkakdate" Display="False">
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="sheek_no" HeaderText="رقم الشيــك" 
                                    SortExpression="sheek_no" UniqueName="sheek_no" DataType="System.Int32">
                                </telerik:GridBoundColumn>
                                <telerik:GridCheckBoxColumn DataField="trhel" DataType="System.Boolean" 
                                    HeaderText="الترحيل" SortExpression="trhel" UniqueName="trhel" 
                                    ForceExtractValue="Always">
                                </telerik:GridCheckBoxColumn>
                                <telerik:GridBoundColumn DataField="edaaname" HeaderText="نوع الايداع" SortExpression="edaaname" 
                                    UniqueName="edaaname"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="bankacountname" HeaderText="رقم الحساب" SortExpression="bankacountname" 
                                    UniqueName="bankacountname" Display="False"></telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="AccountName" HeaderText="كود الحساب" SortExpression="AccountName" 
                                    UniqueName="AccountName"></telerik:GridBoundColumn>
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
                    DeleteCommand="DELETE FROM [TBLalbank_edaa] WHERE [kasema_no] = @original_kasema_no AND [bankacountcode] = @original_bankacountcode" 
                    InsertCommand="INSERT INTO [TBLalbank_edaa] ([kasema_no], [bankacountcode], [edaatype], [edaadate], [haraka_no], [sheek_no], [eshkakdate], [sheek_date], [AccountId], [totalsheek], [notes], [name], [trhel], [bankedaaname], [TimeIn], [UserIn]) VALUES (@kasema_no, @bankacountcode, @edaatype, @edaadate, @haraka_no, @sheek_no, @eshkakdate, @sheek_date, @AccountId, @totalsheek, @notes, @name, @trhel, @bankedaaname, @TimeIn, @UserIn)" 
                    OldValuesParameterFormatString="original_{0}" ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [kasema_no], [bankacountcode], [edaatype], CONVERT(nvarchar, edaadate, 103) AS edaadate, [haraka_no], [sheek_no], CONVERT(nvarchar, eshkakdate, 103) AS eshkakdate, CONVERT(nvarchar, sheek_date, 103) AS sheek_date, [AccountId], [totalsheek], [notes], [name], [trhel], [bankedaaname], [TimeIn], [UserIn],
(Select AccountName From TblAccounts Where AccountId = TBLalbank_edaa.AccountId) AS AccountName,
(Select edaaname From CDedaatype Where edaatype = TBLalbank_edaa.edaatype) AS edaaname,
(Select bankacountname From CDbank Where bankacountcode = TBLalbank_edaa.bankacountcode) AS bankacountname
 FROM [TBLalbank_edaa]" 
                    
                    
                    
                    
                    
                        
                        
                        UpdateCommand="UPDATE [TBLalbank_edaa] SET [edaatype] = @edaatype, [edaadate] = @edaadate, [haraka_no] = @haraka_no, [sheek_no] = @sheek_no, [eshkakdate] = @eshkakdate, [sheek_date] = @sheek_date, [AccountId] = @AccountId, [totalsheek] = @totalsheek, [notes] = @notes, [name] = @name, [trhel] = @trhel, [bankedaaname] = @bankedaaname, [TimeIn] = @TimeIn, [UserIn] = @UserIn WHERE [kasema_no] = @original_kasema_no AND [bankacountcode] = @original_bankacountcode">
                    <DeleteParameters>
                        <asp:Parameter Name="original_kasema_no" Type="Double" />
                        <asp:Parameter Name="original_bankacountcode" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="kasema_no" Type="Double" />
                        <asp:Parameter Name="bankacountcode" Type="Int32" />
                        <asp:Parameter Name="edaatype" Type="Byte" />
                        <asp:Parameter Name="edaadate" DbType="Date" />
                        <asp:Parameter Name="haraka_no" Type="Int32" />
                        <asp:Parameter Name="sheek_no" Type="Int32" />
                        <asp:Parameter Name="eshkakdate" DbType="Date" />
                        <asp:Parameter Name="sheek_date" DbType="Date" />
                        <asp:Parameter Name="AccountId" Type="Int32" />
                        <asp:Parameter Name="totalsheek" Type="Double" />
                        <asp:Parameter Name="notes" Type="String" />
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="trhel" Type="Boolean" />
                        <asp:Parameter Name="bankedaaname" Type="String" />
                        <asp:Parameter Name="TimeIn" Type="DateTime" />
                        <asp:Parameter Name="UserIn" Type="Int32" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="edaatype" Type="Byte" />
                        <asp:Parameter Name="edaadate" DbType="Date" />
                        <asp:Parameter Name="haraka_no" Type="Int32" />
                        <asp:Parameter Name="sheek_no" Type="Int32" />
                        <asp:Parameter Name="eshkakdate" DbType="Date" />
                        <asp:Parameter Name="sheek_date" DbType="Date" />
                        <asp:Parameter Name="AccountId" Type="Int32" />
                        <asp:Parameter Name="totalsheek" Type="Double" />
                        <asp:Parameter Name="notes" Type="String" />
                        <asp:Parameter Name="name" Type="String" />
                        <asp:Parameter Name="trhel" Type="Boolean" />
                        <asp:Parameter Name="bankedaaname" Type="String" />
                        <asp:Parameter Name="TimeIn" Type="DateTime" />
                        <asp:Parameter Name="UserIn" Type="Int32" />
                        <asp:Parameter Name="original_kasema_no" Type="Double" />
                        <asp:Parameter Name="original_bankacountcode" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                </td>
    </tr>
</table>

