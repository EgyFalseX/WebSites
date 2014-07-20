<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditorBillDiscard.ascx.cs" Inherits="EditorBillDiscard" %>
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
    .style3
    {
        width: 155px;
        height: 29px;
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
    </style>
<telerik:RadScriptManager ID="RadScriptManager1" runat="server">
                </telerik:RadScriptManager>
<table class="Wardstyle1" dir="rtl" align="center" border="1">
        <tr>
            <td colspan="2" style="text-align: center">
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
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="14px" 
                            Text="التاريخ" ForeColor="Black"></asp:Label>
                    </td>
                    <td class="Wardstyle5">
                        <telerik:RadDatePicker ID="RadDatePickerDateOut" Runat="server" Culture="en-US" 
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
                        <asp:Label ID="Label18" runat="server" Text="المورد" Font-Bold="True" 
                    Font-Size="14px" ForeColor="Black"></asp:Label>
                    </td>
                    <td class="Wardstyle5">
                        <telerik:RadComboBox ID="RadComboBoxSupplierId" Runat="server" Skin="Default" 
                    Width="200px" MarkFirstMatch="True" 
                            onselectedindexchanged="RadComboBoxSupplierId_SelectedIndexChanged" 
                            AutoPostBack="True">
                        </telerik:RadComboBox>
                    </td>
                </tr>
                <tr>
                    <td class="Wardstyle3">
                        <asp:Label ID="Label23" runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Black" Text="الفواتير"></asp:Label>
                    </td>
                    <td class="Wardstyle5">
                        <telerik:RadComboBox ID="RadComboBoxInvIDIn" Runat="server" 
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
                    <asp:Label ID="LblState" runat="server" Font-Bold="True" Font-Size="16px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <telerik:RadGrid ID="RadGridEditor" runat="server" 
                        AllowFilteringByColumn="True" AllowPaging="True" AutoGenerateColumns="False" 
                        DataSourceID="SqlDataSourceCodez" EnableTheming="True" Font-Bold="True" 
                        Font-Size="14px" ForeColor="Black" GridLines="None" 
                        onitemdeleted="RadGridEditor_ItemDeleted" 
                        oniteminserted="RadGridEditor_ItemInserted" 
                        onitemupdated="RadGridEditor_ItemUpdated" ShowFooter="True" 
                        ShowStatusBar="True" Skin="Vista" style="direction: ltr; text-align: center;">
                        <SortingSettings SortToolTip="اضغظ هنا للترتيب" />
                        <ValidationSettings CommandsToValidate="Insert,Update" />
                        <MasterTableView AllowAutomaticDeletes="True" AllowAutomaticInserts="True" 
                            AllowAutomaticUpdates="True" CommandItemDisplay="TopAndBottom" 
                            datakeynames="InvIDOut,MaterialId" datasourceid="SqlDataSourceCodez" Dir="RTL" 
                            Font-Bold="False" Font-Names="Arial" Font-Size="14px" ForeColor="Black" 
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
                                <telerik:GridDropDownColumn DataField="MaterialId" 
                                    DataSourceID="SqlDataSourceMaterialId" HeaderText="اسم الصنف" 
                                    ListTextField="Details" ListValueField="MaterialId" SortExpression="MaterialId" 
                                    UniqueName="MaterialId" DropDownControlType="DropDownList">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridDropDownColumn>
                                <telerik:GridDropDownColumn DataField="StoreId" 
                                    DataSourceID="SqlDataSourceStore" DropDownControlType="DropDownList" 
                                    HeaderText="المخزن" ListTextField="Storename" ListValueField="StoreId" 
                                    SortExpression="StoreId" UniqueName="StoreId">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridDropDownColumn>
                                <telerik:GridBoundColumn DataField="OutQty" DataType="System.Int32" 
                                    HeaderText="عدد الوحدات" SortExpression="OutQty" UniqueName="OutQty">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="Total" HeaderText="المجموع" ReadOnly="True" 
                                    SortExpression="Total" UniqueName="Total">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
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
                        InsertCommand="INSERT INTO [tblOutDetails] ([InvIDOut], [MaterialId], [StoreId], [UnitPriceOut], [OutQty], [UserIn], [TimeIn]) Select @InvIDOut, @MaterialId, @StoreId,
(SELECT UnitPriceIn AS UnitPriceOut FROM TblWareddetails
Where InvIDIn = @InvIDIn And MaterialId = @MaterialId),
 @OutQty, @UserIn, GETDATE()" 
                        OldValuesParameterFormatString="original_{0}" 
                        onselected="SqlDataSourceCodez_Selected" ProviderName="System.Data.SqlClient" 
                        SelectCommand="SELECT        (SELECT        Material
                           FROM            TblMaterialDetiels
                           WHERE        (MaterialId = tblOutDetails.MaterialId)) AS Material,
                             (SELECT        CategoryId
                                FROM            TblMaterialDetiels AS TblMaterialDetiels_1
                                WHERE        (MaterialId = tblOutDetails.MaterialId)) AS CategoryId, InvIDOut, MaterialId, UnitPriceOut, OutQty, StoreId, UnitPriceOut * OutQty AS Total
FROM            tblOutDetails
WHERE        (InvIDOut = @InvIDOut)" 
                        
                        
                        UpdateCommand="UPDATE [tblOutDetails] SET [StoreId] = @StoreId, [OutQty] = @OutQty, [UserIn] = @UserIn, [TimeIn] = GETDATE() WHERE [InvIDOut] = @original_InvIDOut AND [MaterialId] = @original_MaterialId">
                        <DeleteParameters>
                            <asp:Parameter Name="original_InvIDOut" Type="Int32" />
                            <asp:Parameter Name="original_MaterialId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="RadComboBoxBillz" Name="InvIDOut" 
                                PropertyName="SelectedValue" Type="Int32" />
                            <asp:Parameter Name="MaterialId" Type="Int32" />
                            <asp:Parameter Name="StoreId" Type="Int32" />
                            <asp:Parameter Name="OutQty" Type="Int32" />
                            <asp:SessionParameter Name="UserIn" SessionField="UserID" Type="Int32" />
                            <asp:ControlParameter ControlID="RadComboBoxInvIDIn" Name="InvIDIn" 
                                PropertyName="SelectedValue" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="RadComboBoxBillz" Name="InvIDOut" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="StoreId" Type="Int32" />
                            <asp:Parameter Name="OutQty" Type="Int32" />
                            <asp:SessionParameter Name="UserIn" SessionField="UserID" Type="Int32" />
                            <asp:Parameter Name="original_InvIDOut" Type="Int32" />
                            <asp:Parameter Name="original_MaterialId" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceStore" runat="server" 
                        ConnectionString="Data Source=.;Initial Catalog=E_STORE;Integrated Security=True" 
                        OldValuesParameterFormatString="original_{0}" 
                        ProviderName="System.Data.SqlClient" 
                        SelectCommand="SELECT [StoreId], [Storename] FROM [CdStore]">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceMaterialId" runat="server" 
                        ConnectionString="Data Source=.;Initial Catalog=E_STORE;Integrated Security=True" 
                        OldValuesParameterFormatString="original_{0}" 
                        ProviderName="System.Data.SqlClient" SelectCommand="SELECT MaterialId, FactorySerial + '  -  ' + Cast((SELECT Material FROM TblMaterialDetiels WHERE (MaterialId = TblWaredSerial.MaterialId)) AS nvarchar)  + '  -  ' +  
Cast((SELECT UnitPriceIn FROM TblWareddetails WHERE (InvIDIn = @InvIDIn) AND (MaterialId = TblWaredSerial.MaterialId)) AS nvarchar) AS Details
FROM TblWaredSerial
WHERE (InvIDIn = @InvIDIn)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="RadComboBoxInvIDIn" Name="InvIDIn" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
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
                    <asp:Button ID="BtnEznSrf" runat="server" Text="اذن الصرف" 
                    Width="100px" />
                    <asp:Button ID="BtnPrint" runat="server" Text="طباعة الفاتوه" Width="100px" />
                    <table align="center" border="1" class="style4" frame="border">
                        <tr>
                            <td style="text-align: right">
                                <telerik:RadDatePicker ID="RadDatePickerdateTrhel" Runat="server" 
                                    Culture="en-US" ForeColor="Black" Width="200px" style="direction: rtl">
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
                            <td class="style6" align="right" valign="top">
                                <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="14px" 
                                    ForeColor="Black" Text="تاريخ الترحيل"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
</asp:Panel>


