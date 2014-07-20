<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditorCommercialBill.ascx.cs" Inherits="EditorCommercialBill" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<style type="text/css">

    .Wardstyle1
    {
        width: 435px;
        height: 71px;
    }
    .Wardstyle5
    {
        width: 271px;
        text-align: right;
    }
    .Wardstyle6
    {
        width: 872px;
        height: 440px;
    }
    .Wardstyle10
    {
        width: 255px;
    }
    .Wardstyle12
    {
        height: 143px;
    }
    .Wardstyle8
    {
        width: 507px;
    }
    .Wardstyle9
    {
        width: 77px;
    }
    .Wardstyle11
    {
        height: 249px;
        text-align: left;
    }
    .style4
    {
        width: 336px;
    }
    .style6
    {
        width: 89px;
    }
    .Wardstyle3
    {
        text-align: center;
    }
    .style7
    {
        height: 36px;
    }
    .style1
    {
        width: 312px;
    }
    </style>
<telerik:RadScriptManager ID="RadScriptManager1" runat="server">
                </telerik:RadScriptManager>
<table class="Wardstyle1" dir="rtl" align="center" border="1">
        <tr>
            <td class="Wardstyle3" colspan="2">
                <asp:Button ID="BtnBack" runat="server" onclick="BtnBack_Click" Text="عوده" 
                    Width="100px" />
            </td>
        </tr>
        <tr>
            <td class="Wardstyle3">
                <asp:Label ID="Label10" runat="server" Text="جميع الفواتير" Font-Bold="True" 
                    Font-Size="14px" ForeColor="Black"></asp:Label>
            </td>
            <td class="Wardstyle5">
                <telerik:RadComboBox ID="RadComboBoxBillz" Runat="server" Skin="Default" 
                    LoadingMessage="تحميل..." Width="257px" 
                    onselectedindexchanged="RadComboBoxBillz_SelectedIndexChanged" 
                    AutoPostBack="True" MarkFirstMatch="True">
                </telerik:RadComboBox>
                <asp:Button ID="BtnNewBill" runat="server" Text="فاتوره جديده" Width="100px" 
                    Font-Bold="True" Font-Size="14px" ForeColor="#353535" 
                    onclick="BtnNewBill_Click" />
                <asp:Button ID="BtnDelBill" runat="server" Text="حذف" Width="100px" 
                    Font-Bold="True" Font-Size="14px" ForeColor="#353535" 
                    onclick="BtnDelBill_Click" 
                    onclientclick="javascript: return confirm('هل انت متاكد ؟')" />
            </td>
        </tr>
        </table>
        <br />
        <asp:Panel ID="PnlBillGeneral" runat="server" Visible="False">
            <table class="Wardstyle1" dir="rtl" align="center" border="1">
                <tr>
                    <td class="Wardstyle3" colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="Wardstyle3">
                        <asp:Label ID="Label1" runat="server" Text="رقم الفاتوره" Font-Bold="True" 
                    Font-Size="14px" ForeColor="Black"></asp:Label>
                    </td>
                    <td class="Wardstyle5">
                        <asp:TextBox ID="Txtnotypeout" runat="server" ReadOnly="True" 
                            Width="200px"></asp:TextBox>
                        <asp:TextBox ID="TxtInvIDOut" runat="server" Width="20px" ReadOnly="True" 
                            Visible="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Wardstyle3">
                        <asp:Label ID="Label18" runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Black" Text="العميل"></asp:Label>
                    </td>
                    <td class="Wardstyle5">
                        <telerik:RadComboBox ID="RadComboBoxCustomerId" Runat="server" 
                            MarkFirstMatch="True" 
                            onselectedindexchanged="RadComboBoxCustomerId_SelectedIndexChanged" 
                            Skin="Default" Width="200px" AutoPostBack="True">
                        </telerik:RadComboBox>
                    </td>
                </tr>
                <tr>
                    <td class="Wardstyle3">
                        <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Black" Text="طريقة الدفع"></asp:Label>
                    </td>
                    <td class="Wardstyle5">
                        <asp:DropDownList ID="DDLType" runat="server" Width="200px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Wardstyle3">
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="14px" 
                            Text="التاريخ" ForeColor="Black"></asp:Label>
                    </td>
                    <td class="Wardstyle5">
                        <telerik:RadDatePicker ID="RadDatePickerDateOut" Runat="server" Culture="en-US" 
                            Width="200px" ForeColor="Black" AutoPostBack="True" 
                            onselecteddatechanged="RadDatePickerDateOut_SelectedDateChanged">
                            <Calendar ForeColor="Black">
                            </Calendar>
                            <DateInput DateFormat="d/M/yyyy" InvalidStyleDuration="100" AutoPostBack="True">
                            </DateInput>
                            <DatePopupButton CssClass="radPopupImage_Mac" />
                        </telerik:RadDatePicker>
                    </td>
                </tr>
                <tr>
                    <td class="Wardstyle3">
                        <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Black" Text="الفرع"></asp:Label>
                    </td>
                    <td class="Wardstyle5">
                        <asp:DropDownList ID="DDLBranchecode" runat="server" Width="200px">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="Wardstyle3">
                        <asp:Label ID="Label23" runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Black" Text="العقد"></asp:Label>
                    </td>
                    <td class="Wardstyle5">
                        <telerik:RadComboBox ID="RadComboBoxContractId" Runat="server" 
                            MarkFirstMatch="True" 
                            onselectedindexchanged="RadComboBoxContractId_SelectedIndexChanged" 
                            Skin="Default" Width="200px" AutoPostBack="True">
                        </telerik:RadComboBox>
                    </td>
                </tr>
                <tr>
                    <td class="Wardstyle3">
                        <asp:Label ID="Label24" runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Black" Text="النظام"></asp:Label>
                    </td>
                    <td class="Wardstyle5">
                        <telerik:RadComboBox ID="RadComboBoxSystemId" Runat="server" 
                            MarkFirstMatch="True" Skin="Default" Width="200px">
                        </telerik:RadComboBox>
                    </td>
                </tr>
                <tr>
                    <td class="Wardstyle3">
                        &nbsp;</td>
                    <td class="Wardstyle5">
                        <asp:Button ID="BtnUpdateBill" runat="server" Text="حفظ التعديل" Width="100px" 
                    Font-Bold="True" Font-Size="14px" ForeColor="#353535" onclick="BtnUpdateBill_Click" 
                     />
                        <asp:Button ID="BtnUpdateBillCancel" runat="server" Text="الغاء التعديل" Width="100px" 
                    Font-Bold="True" Font-Size="14px" ForeColor="#353535" Visible="False" onclick="BtnUpdateBillCancel_Click" 
                     />
                        <asp:Button ID="BtnAddBill" runat="server" Text="اضافة" Width="100px" 
                    Font-Bold="True" Font-Size="14px" ForeColor="#353535" onclick="BtnAddBill_Click" />
                    </td>
                </tr>
            </table>
</asp:Panel>
        
<asp:Panel ID="PnlBillDetials" runat="server" style="text-align: center" 
    Visible="False">
        <table align="center">
            <tr>
                <td>
                    <asp:ImageButton ID="BtnShowHide" runat="server" Height="25px" 
                        ImageUrl="~/Images/ShowHide.png" onclick="BtnShowHide_Click" 
                        style="text-align: center" Width="50px" />
                </td>
            </tr>
            <tr>
                <td bgcolor="Yellow">
                    <asp:Label ID="LblState" runat="server" Font-Bold="True" Font-Size="16px" 
                        Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
        <table align="center" class="style1" dir="rtl">
            <tr>
                <td>
                    <asp:Label ID="Label25" runat="server" Font-Bold="True" Font-Size="14px" 
                        Text="القائمه"></asp:Label>
                </td>
                <td style="text-align: right" colspan="2">
                    <telerik:RadComboBox ID="RadComboBoxPricelistId" Runat="server" 
                        AutoPostBack="True" MarkFirstMatch="True" 
                        onselectedindexchanged="RadComboBoxPricelistId_SelectedIndexChanged" 
                         Width="200px">
                    </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="14px" 
                        Text="الصنف"></asp:Label>
                </td>
                <td style="text-align: right" colspan="2">
                    <telerik:RadComboBox ID="RadComboBoxMaterialId" Runat="server" 
                        AutoPostBack="True" MarkFirstMatch="True" 
                        onselectedindexchanged="RadComboBoxMaterialId_SelectedIndexChanged" 
                         Width="200px">
                    </telerik:RadComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label26" runat="server" Font-Bold="True" Font-Size="14px" 
                        Text="السعر"></asp:Label>
                </td>
                <td style="text-align: right" colspan="2">
                    <asp:TextBox ID="TxtUnitPriceOut" runat="server" ReadOnly="True" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="14px" 
                        Text="الكميه"></asp:Label>
                </td>
                <td style="text-align: right" colspan="2">
                    <asp:TextBox ID="TxtOutQty" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td style="text-align: right">
                    <asp:ImageButton ID="ImgBtnAdd" runat="server" Height="16px" 
                        ImageUrl="~/Images/AddTGrid.png" onclick="ImgBtnAdd_Click" Width="16px" />
                </td>
                <td style="text-align: left">
                    <asp:ImageButton ID="ImgBtnEdit" runat="server" Height="16px" 
                        ImageUrl="~/Images/Edit.png" onclick="ImgBtnAdd_Click" Visible="False" 
                        Width="16px" />
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:HiddenField ID="HiddenField1" runat="server" />
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
                        oniteminserted="RadGridEditor_ItemInserted" 
                        onitemupdated="RadGridEditor_ItemUpdated" ShowFooter="True" 
                        ShowStatusBar="True" Skin="Vista" 
                        style="direction: ltr; text-align: center;" 
                        oneditcommand="RadGridEditor_EditCommand">
                        <SortingSettings SortToolTip="اضغظ هنا للترتيب" />
                        <ValidationSettings CommandsToValidate="Insert,Update" />
                        <MasterTableView AllowAutomaticDeletes="True" AllowAutomaticInserts="True" 
                            AllowAutomaticUpdates="True" datakeynames="InvIDOut,MaterialId" 
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
                                <telerik:GridBoundColumn DataField="PricelistId" HeaderText="قائمة الاسعار" 
                                    SortExpression="PricelistId" UniqueName="PricelistId">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="MaterialId" HeaderText="الصنف" 
                                    SortExpression="MaterialId" UniqueName="MaterialId">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="UnitPriceOut" DataType="System.Double" 
                                    HeaderText="السعر" SortExpression="UnitPriceOut" UniqueName="UnitPriceOut">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="OutQty" DataType="System.Int32" 
                                    HeaderText="الكميه" SortExpression="OutQty" UniqueName="OutQty">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Edit" 
                                    UniqueName="EditColumn" HeaderText="تعديل" Visible="False">
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
                        DeleteCommand="DELETE FROM [tblOutDetails] WHERE [InvIDOut] = @original_InvIDOut AND [MaterialId] = @original_MaterialId" 
                        InsertCommand="INSERT INTO [tblOutDetails] ([InvIDOut], [MaterialId], [UnitPriceOut], [OutQty], [PricelistId], [UserIn], [TimeIn]) VALUES (@InvIDOut, @MaterialId, @UnitPriceOut, @OutQty, @PricelistId, @UserIn, @TimeIn)" 
                        OldValuesParameterFormatString="original_{0}" 
                        onselected="SqlDataSourceCodez_Selected" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [InvIDOut], [MaterialId], 
(Select Material From TblMaterialDetiels Where MaterialId = tblOutDetails.MaterialId) AS Material,
[UnitPriceOut], [OutQty], [PricelistId], 
[UserIn], [TimeIn] FROM [tblOutDetails]
Where InvIDOut = @InvIDOut" 
                        UpdateCommand="UPDATE [tblOutDetails] SET [UnitPriceOut] = @UnitPriceOut, [OutQty] = @OutQty, [PricelistId] = @PricelistId, [UserIn] = @UserIn, [TimeIn] = @TimeIn WHERE [InvIDOut] = @original_InvIDOut AND [MaterialId] = @original_MaterialId">
                        <DeleteParameters>
                            <asp:Parameter Name="original_InvIDOut" Type="Int32" />
                            <asp:Parameter Name="original_MaterialId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="InvIDOut" Type="Int32" />
                            <asp:Parameter Name="MaterialId" Type="Int32" />
                            <asp:Parameter Name="UnitPriceOut" Type="Double" />
                            <asp:Parameter Name="OutQty" Type="Int32" />
                            <asp:Parameter Name="PricelistId" Type="Int32" />
                            <asp:Parameter Name="UserIn" Type="Int32" />
                            <asp:Parameter Name="TimeIn" Type="DateTime" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="RadComboBoxBillz" Name="InvIDOut" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="UnitPriceOut" Type="Double" />
                            <asp:Parameter Name="OutQty" Type="Int32" />
                            <asp:Parameter Name="PricelistId" Type="Int32" />
                            <asp:Parameter Name="UserIn" Type="Int32" />
                            <asp:Parameter Name="TimeIn" Type="DateTime" />
                            <asp:Parameter Name="original_InvIDOut" Type="Int32" />
                            <asp:Parameter Name="original_MaterialId" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style7">
                    <asp:Label ID="LblOverTotal" runat="server" BackColor="Black" 
                        BorderColor="Lime" BorderStyle="Solid" BorderWidth="5px" Font-Bold="True" 
                        Font-Size="14pt" ForeColor="White" style="text-align: center"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="BtnEznSrf" runat="server" Text="اذن الصرف" Width="100px" />
                    <asp:Button ID="BtnPrint" runat="server" Text="طباعة الفاتوه" Width="100px" />
                    <table align="center" border="1" class="style4" frame="border">
                        <tr>
                            <td style="text-align: right">
                                <telerik:RadDatePicker ID="RadDatePickerdateTrhel" Runat="server" 
                                    Culture="en-US" ForeColor="Black" style="direction: rtl" Width="200px">
                                    <DateInput DateFormat="d/M/yyyy" InvalidStyleDuration="100">
                                    </DateInput>
                                    <DatePopupButton CssClass="radPopupImage_Mac" />
                                </telerik:RadDatePicker>
                            </td>
                            <td class="style6">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <asp:CheckBox ID="CheckBoxTrhel" runat="server" AutoPostBack="True" 
                                    Font-Bold="True" Font-Size="14px" ForeColor="Black" 
                                    oncheckedchanged="CheckBoxTrhel_CheckedChanged" Text="حفظ و ترحيل للحسابات" />
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
                            <td align="right" class="style6" valign="top">
                                <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="14px" 
                                    ForeColor="Black" Text="تاريخ الترحيل"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
</asp:Panel>

