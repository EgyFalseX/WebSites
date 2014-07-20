<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditorAksat.ascx.cs" Inherits="EditorAksat" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<style type="text/css">
    .style1
    {
        width: 442px;
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
<telerik:RadScriptManager ID="RadScriptManager1" runat="server">
                </telerik:RadScriptManager>
<table align="center" class="style1" dir="rtl" border="1">
    <tr>
        <td style="text-align: right">
            <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="14px" 
                Text="جميع الاقساط"></asp:Label>
        </td>
        <td style="text-align: right">
                        <telerik:RadComboBox ID="RadComboBoxKST_id" Runat="server" Skin="Default" 
                    Width="200px" MarkFirstMatch="True" 
                            onselectedindexchanged="RadComboBoxKST_id_SelectedIndexChanged" 
                            AutoPostBack="True">
                        </telerik:RadComboBox>
            <asp:Button ID="BtnDel" runat="server" Font-Bold="True" Text="حذف" 
                Width="100px" onclick="BtnDel_Click" />
                    </td>
    </tr>
    </table>
<p>
</p>
<table align="center" class="style1" dir="rtl" border="1">
    <tr>
        <td style="text-align: right">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="14px" 
                Text="نوع الاذن"></asp:Label>
        </td>
        <td dir="rtl" style="text-align: right">
                        <telerik:RadComboBox ID="RadComboBoxOutTypeId" Runat="server" Skin="Default" 
                    Width="200px" MarkFirstMatch="True" 
                            onselectedindexchanged="RadComboBoxOutTypeId_SelectedIndexChanged" 
                            AutoPostBack="True">
                        </telerik:RadComboBox>
                    </td>
    </tr>
    <tr>
        <td style="text-align: right">
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="14px" 
                Text="رقم فاتورة"></asp:Label>
        </td>
        <td dir="rtl" style="text-align: right">
                        <telerik:RadComboBox ID="RadComboBoxnotypeout" Runat="server" Skin="Default" 
                    Width="200px" MarkFirstMatch="True" 
                            onselectedindexchanged="RadComboBoxnotypeout_SelectedIndexChanged" 
                            AutoPostBack="True">
                        </telerik:RadComboBox>
                    </td>
    </tr>
    <tr>
        <td style="text-align: right">
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="14px" 
                Text="اجمالي المبلغ"></asp:Label>
        </td>
        <td style="text-align: right">
            <asp:TextBox ID="Txttotalout" runat="server" ReadOnly="True" Width="200px"></asp:TextBox>
            <cc1:FilteredTextBoxExtender ID="Txttotalout_FilteredTextBoxExtender" 
                runat="server" Enabled="True" FilterType="Numbers" 
                TargetControlID="Txttotalout">
            </cc1:FilteredTextBoxExtender>
        </td>
    </tr>
    <tr>
        <td style="text-align: right">
            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="14px" 
                Text="تاريخ القسط الاول"></asp:Label>
        </td>
        <td style="text-align: right">
                        <telerik:RadDatePicker ID="RadDatePickerdatefirest" Runat="server" Culture="en-US" 
                            Width="200px" ForeColor="Black">
                            <Calendar ForeColor="Black">
                            </Calendar>
                            <DateInput DateFormat="d/M/yyyy" InvalidStyleDuration="100">
                            </DateInput>
                            <DatePopupButton CssClass="radPopupImage_Mac" />
                        </telerik:RadDatePicker>
                    </td>
    </tr>
    <tr>
        <td style="text-align: right">
            <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="14px" 
                Text="عدد الاقساط"></asp:Label>
        </td>
        <td style="text-align: right">
            <asp:TextBox ID="Txtnoaksat" runat="server" Width="200px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Button ID="BtnNew" runat="server" Font-Bold="True" Text="جديد" 
                Width="100px" onclick="BtnNew_Click" />
        </td>
        <td>
            <asp:Button ID="BtnSave" runat="server" Font-Bold="True" Text="حفظ" 
                Width="100px" onclick="BtnSave_Click" />
            <asp:Button ID="BtnEdit" runat="server" Font-Bold="True" Text="تعديل" 
                Width="100px" onclick="BtnEdit_Click" Visible="False" />
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            <asp:Button ID="BtnCreateDetails" runat="server" Font-Bold="True" Text="انشاء الاقساط" 
                Width="100px" Visible="False" onclick="BtnCreateDetails_Click" />
        </td>
    </tr>
    <tr>
        <td bgcolor="Yellow" colspan="2" style="text-align: center">
            <asp:Label ID="LblState" runat="server" Font-Bold="False"></asp:Label>
        </td>
    </tr>
</table>
<p>
</p>
<table align="center" class="style1" dir="rtl">
    <tr>
        <td style="text-align: center">
                    <telerik:RadGrid ID="RadGridEditor" runat="server" 
                        AllowFilteringByColumn="True" AllowPaging="True" AutoGenerateColumns="False" 
                        DataSourceID="SqlDataSourceCodez" EnableTheming="True" Font-Bold="True" 
                        Font-Size="14px" ForeColor="Black" GridLines="None" 
                        onitemdeleted="RadGridEditor_ItemDeleted" ShowFooter="True" 
                        ShowStatusBar="True" Skin="Vista" 
                        style="direction: rtl; text-align: right;">
                        <SortingSettings SortToolTip="اضغظ هنا للترتيب" />
                        <ValidationSettings CommandsToValidate="Insert,Update" />
                        <MasterTableView AllowAutomaticDeletes="True" AllowAutomaticInserts="True" 
                            AllowAutomaticUpdates="True" datakeynames="KST_id,kast_no" 
                            datasourceid="SqlDataSourceCodez" Dir="RTL" Font-Bold="False" 
                            Font-Names="Arial" Font-Size="14px" ForeColor="Black" GridLines="Both" 
                            HorizontalAlign="NotSet" NoDetailRecordsText="لا يوجد سجلات داخليه" 
                            NoMasterRecordsText="لا يوجد سجلات" ShowGroupFooter="True">
                            <CommandItemSettings AddNewRecordText="اضافه" RefreshText="تجديد البيانات" />
                            <RowIndicatorColumn Visible="False">
                                <HeaderStyle Width="20px" />
                            </RowIndicatorColumn>
                            <ExpandCollapseColumn ButtonType="ImageButton" Resizable="False" 
                                Visible="False">
                                <HeaderStyle ForeColor="Black" Width="20px" />
                            </ExpandCollapseColumn>
                            <Columns>
                                <telerik:GridBoundColumn DataField="kast_no" HeaderText="رقم القسط" 
                                    SortExpression="kast_no" UniqueName="kast_no" DataType="System.Byte" 
                                    ReadOnly="True">
                                    <FooterStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="kast_date" HeaderText="تاريخ القسط" 
                                    SortExpression="kast_date" UniqueName="kast_date" 
                                    DataType="System.DateTime">
                                    <FooterStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="kast" DataType="System.Double" 
                                    HeaderText="قيمة القسط" SortExpression="kast" UniqueName="kast">
                                    <FooterStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" 
                                    ConfirmDialogType="RadWindow" ConfirmText="هل انت متأكد؟" 
                                    ConfirmTitle="تحـــزير" UniqueName="DeleteColumn" HeaderText="حذف">
                                </telerik:GridButtonColumn>
                            </Columns>
                            <EditFormSettings>
                                <EditColumn ButtonType="ImageButton" CancelText="الغاء" EditText="تعديل" 
                                    InsertImageUrl="~/Images/AddTGrid.png" InsertText="اضافه" 
                                    UpdateText="حفظ التعديل">
                                    <FooterStyle ForeColor="Black" />
                                </EditColumn>
                                <FormTableStyle ForeColor="Black" HorizontalAlign="Center" />
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
                        DeleteCommand="DELETE FROM [tblaksatDetails] WHERE [KST_id] = @original_KST_id AND [kast_no] = @original_kast_no" 
                        InsertCommand="INSERT INTO [tblaksatDetails] ([KST_id], [kast_no], [kast_date], [kast]) VALUES (@KST_id, @kast_no, Convert(Datetime, @kast_date, 103), @kast)" 
                        OldValuesParameterFormatString="original_{0}" 
                        ProviderName="System.Data.SqlClient" SelectCommand="SELECT [KST_id], [kast_no], Convert(nvarchar, kast_date, 103)AS kast_date, [kast] FROM [tblaksatDetails] 
Where KST_id = @KST_id" 
                        
                        
                
                        
                        
                        UpdateCommand="UPDATE [tblaksatDetails] SET [kast_date] =  Convert(Datetime, @kast_date, 103), [kast] = @kast WHERE [KST_id] = @original_KST_id AND [kast_no] = @original_kast_no">
                        <DeleteParameters>
                            <asp:Parameter Name="original_KST_id" Type="Int32" />
                            <asp:Parameter Name="original_kast_no" Type="Byte" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="KST_id" Type="Int32" />
                            <asp:Parameter Name="kast_no" Type="Byte" />
                            <asp:Parameter Name="kast_date" Type="String" />
                            <asp:Parameter Name="kast" Type="Double" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="RadComboBoxKST_id" Name="KST_id" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="kast_date" Type="String" />
                            <asp:Parameter Name="kast" Type="Double" />
                            <asp:Parameter Name="original_KST_id" Type="Int32" />
                            <asp:Parameter Name="original_kast_no" Type="Byte" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
    </tr>
</table>

