﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditorWared.ascx.cs" Inherits="EditorWared" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<style type="text/css">
    .Wardstyle1
    {
        width: 435px;
        height: 71px;
    }
    .Wardstyle3
    {
    }
    .Wardstyle5
    {
        width: 271px;
        text-align: right;
    }
    .Wardstyle6
    {
        width: 872px;
        height: 413px;
    }
    .Wardstyle8
    {
        width: 600px;
    }
    .Wardstyle9
    {
    }
    .Wardstyle10
    {
        width: 255px;
        text-align: left;
    }
    .Wardstyle11
    {
        height: 249px;
    }
    .Wardstyle12
    {
        height: 143px;
    }
    .style1
    {
        width: 122px;
    }
    .modalPopup
    {
        text-align: center;
        direction: ltr;
    }
    .style3
    {
        height: 21px;
    }
    .style4
    {
        width: 311px;
    }
    .style6
    {
        height: 26px;
    }
    </style>
<telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
    <table class="Wardstyle1" dir="rtl" align="center" border="1">
        <tr>
            <td colspan="2" style="text-align: center; direction: ltr">
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
           <asp:Panel ID="PnlShowHide" runat="server">
            <table class="Wardstyle1" dir="rtl" align="center" border="1">
                <tr>
                    <td class="style1">
                        &nbsp;</td>
                    <td class="Wardstyle5">
                        <asp:TextBox ID="TxtInvIDIn" runat="server" Width="1px" ReadOnly="True" 
                            Height="1px" Visible="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        <asp:Label ID="Label23" runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Black" Text="رقم الفاتوه"></asp:Label>
                    </td>
                    <td class="Wardstyle5">
                        <asp:TextBox ID="Txtnotype" runat="server" ReadOnly="True" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;</td>
                    <td class="Wardstyle5">
                        <asp:DropDownList ID="DDLType" runat="server" Width="200px" Visible="False">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="14px" 
                            Text="التاريخ" ForeColor="Black"></asp:Label>
                    </td>
                    <td class="Wardstyle5">
                        <telerik:RadDatePicker ID="RadDatePickerDateIn" Runat="server" Width="200px" 
                            DateInput-EmptyMessage="ادخل تاريخ" MaxDate="3000-01-01" 
                            MinDate="1000-01-01" style="direction: rtl" Culture="en-US">
                            <Calendar>
                                <SpecialDays>
                                    <telerik:RadCalendarDay ItemStyle-CssClass="rcToday" Repeatable="Today">
                                        <ItemStyle CssClass="rcToday" />
                                    </telerik:RadCalendarDay>
                                </SpecialDays>
                            </Calendar>
                            <DateInput InvalidStyleDuration="100" 
                                DateFormat="d/M/yyyy">
                            </DateInput>
                        </telerik:RadDatePicker>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        <asp:Label ID="Label4" runat="server" Text="المورد" Font-Bold="True" 
                    Font-Size="14px" ForeColor="Black"></asp:Label>
                    </td>
                    <td class="Wardstyle5">
                        <telerik:RadComboBox ID="RadComboBoxSupplierId" Runat="server" Skin="Default" 
                    Width="200px" MarkFirstMatch="True">
                        </telerik:RadComboBox>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        <asp:Label ID="Label7" runat="server" Text="رقم الفاتورة سجلات المورد" Font-Bold="True" 
                    Font-Size="14px" ForeColor="Black"></asp:Label>
                    </td>
                    <td class="Wardstyle5">
                        <asp:TextBox ID="TxtInvIDInSupplier" runat="server" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        <asp:Label ID="Label8" runat="server" Text="رقم الطلبية" Font-Bold="True" 
                    Font-Size="14px" ForeColor="Black"></asp:Label>
                    </td>
                    <td class="Wardstyle5">
                        <asp:TextBox ID="TxtTalabiaNo" runat="server" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: center">
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
                <tr>
                    <td bgcolor="Yellow" colspan="2" style="text-align: center">
                        <asp:Label ID="LblState" runat="server" Font-Bold="True" Font-Size="16px" 
                            Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <table align="center" border="1" dir="rtl">
                   <tr>
                       <td style="text-align: center">
                           <asp:ImageButton ID="BtnShowHide" runat="server" Height="25px" 
                               ImageUrl="~/Images/ShowHide.png" onclick="BtnShowHide_Click" 
                               style="text-align: center" Width="50px" />
                       </td>
                   </tr>
               </table>

</asp:Panel>

    <asp:Panel ID="PnlDetails" runat="server" style="text-align: center" 
    Visible="False">
        <table align="center">
            <tr>
                <td>
                    <telerik:RadGrid ID="RadGridEditor" runat="server" 
                                AllowFilteringByColumn="True" AllowPaging="True" AutoGenerateColumns="False" 
                                DataSourceID="SqlDataSourceCodez" EnableTheming="True" Font-Bold="True" 
                                Font-Size="14px" ForeColor="Black" GridLines="None" 
                                onitemdeleted="RadGridEditor_ItemDeleted" 
                                oniteminserted="RadGridEditor_ItemInserted" 
                                onitemupdated="RadGridEditor_ItemUpdated" ShowStatusBar="True" 
                    Skin="Vista" style="direction: ltr; text-align: center;" ShowFooter="True">
                        <SortingSettings SortToolTip="اضغظ هنا للترتيب" />
                        <ValidationSettings CommandsToValidate="Insert,Update" />
                        <MasterTableView AllowAutomaticDeletes="True" AllowAutomaticInserts="True" 
                                    AllowAutomaticUpdates="True" CommandItemDisplay="TopAndBottom" 
                                    datakeynames="InvIDIn,MaterialId" 
                            datasourceid="SqlDataSourceCodez" Dir="RTL" 
                                    Font-Bold="True" Font-Names="Arial" Font-Size="14px" ForeColor="Black" 
                                    GridLines="Both" HorizontalAlign="NotSet" 
                                    NoDetailRecordsText="لا يوجد سجلات داخليه" 
                                    NoMasterRecordsText="لا يوجد سجلات" 
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
                                <telerik:GridTemplateColumn DataField="MaterialId" HeaderText="الصنف" 
                                            SortExpression="MaterialId" UniqueName="MaterialId" 
                                            ItemStyle-HorizontalAlign="NotSet" HeaderButtonType="LinkButton" 
                                            ItemStyle-VerticalAlign="Top">
                                    <EditItemTemplate>
                                        <table align="center" dir="ltr">
                                            <tr>
                                                <td>
                                                    <asp:Panel ID="PnlPop" runat="server" BackColor="White" BorderColor="#3399FF" 
                                                                BorderStyle="Solid" Height="200px" ScrollBars="Auto" 
                                                                style="direction: ltr" HorizontalAlign="NotSet">
                                                        <telerik:RadPanelBar ID="RadPanelBarItems" Runat="server" 
                                                                    onload="RadPanelBarItems_Load" Skin="Vista">
                                                        </telerik:RadPanelBar>
                                                    </asp:Panel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style3">
                                                    <asp:Label ID="LblItemName" runat="server" Text='<%# bind("Material") %>'></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style6">
                                                    <asp:TextBox ID="TxtItemCatID" runat="server" style="direction: rtl" 
                                                                Text='<%# Bind("CategoryId") %>'></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Button ID="BtnOk" runat="server" onclick="BtnOk_Click" Text="موافق" 
                                                                Width="215px" />
                                                    <asp:HiddenField ID="HiddenFieldMaterialId" runat="server" 
                                                                Value='<%# bind("MaterialId") %>' />
                                                </td>
                                            </tr>
                                        </table>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label18" runat="server" Text='<%# bind("Material") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridTemplateColumn>
                                <telerik:GridBoundColumn DataField="UnitPriceIn" DataType="System.Double" 
                                            HeaderText="سعر الوحده" SortExpression="UnitPriceIn" 
                                    UniqueName="UnitPriceIn">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="InQty" DataType="System.Int32" 
                                            HeaderText="الكميه" SortExpression="InQty" UniqueName="InQty">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridBoundColumn>
                                <telerik:GridTemplateColumn DataField="Total" HeaderText="الاجمالي" 
                                            SortExpression="Total" UniqueName="Total">
                                    <ItemTemplate>
                                        <asp:Label ID="LblTotal" runat="server" Text='<%# bind("Total") %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridTemplateColumn>
                                <telerik:GridDropDownColumn DataField="StoreId" 
                                    DataSourceID="SqlDataSourceStore" DropDownControlType="DropDownList" 
                                    HeaderText="المخزن" ListTextField="Storename" ListValueField="StoreId" 
                                    SortExpression="StoreId" UniqueName="StoreId">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridDropDownColumn>
                                <telerik:GridButtonColumn  UniqueName="EditColumn" ButtonType="ImageButton" 
                                            CommandName="Edit" >
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </telerik:GridButtonColumn>
                                <telerik:GridButtonColumn  UniqueName="DeleteColumn" 
                                            ConfirmText="هل انت متأكد؟" ConfirmDialogType="RadWindow"
                                        ConfirmTitle="تحـــزير" ButtonType="ImageButton" CommandName="Delete" >
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
                            <PagerStyle NextPagesToolTip="الصفحات التاليه" NextPageToolTip="الصفحه التاليه" 
                                        PagerTextFormat="تغير الصفحه: {4} &amp;nbsp;الصفحه المعروضه {0} من {1}, الصف {2} الي {3} من {5}." 
                                        PrevPagesToolTip="الصفحات السابقه" PrevPageToolTip="صفحه السابقه" 
                                        Font-Bold="False" />
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
                                ConflictDetection="CompareAllValues" 
                                ConnectionString="Data Source=.;Initial Catalog=E_STORE;Integrated Security=True" 
                                DeleteCommand="DELETE FROM [TblWareddetails] WHERE [InvIDIn] = @original_InvIDIn AND [MaterialId] = @original_MaterialId AND [UnitPriceIn] = @original_UnitPriceIn AND [InQty] = @original_InQty AND (([StoreId] = @original_StoreId) OR ([StoreId] IS NULL AND @original_StoreId IS NULL)) AND (([UserIn] = @original_UserIn) OR ([UserIn] IS NULL AND @original_UserIn IS NULL)) AND (([TimeIn] = @original_TimeIn) OR ([TimeIn] IS NULL AND @original_TimeIn IS NULL))" 
                                InsertCommand="INSERT INTO [TblWareddetails] ([InvIDIn], [MaterialId], [UnitPriceIn], [InQty], [StoreId], [UserIn], [TimeIn]) VALUES (@InvIDIn, @MaterialId, @UnitPriceIn, @InQty, @StoreId, @UserIn, GETDATE())" 
                                OldValuesParameterFormatString="original_{0}" 
                                ProviderName="System.Data.SqlClient" SelectCommand="SELECT InvIDIn, MaterialId, UnitPriceIn, InQty, UnitPriceIn * InQty AS Total, (SELECT Material FROM TblMaterialDetiels WHERE (MaterialId = TblWareddetails_1.MaterialId)) AS Material, (SELECT CategoryId FROM TblMaterialDetiels AS TblMaterialDetiels_1 WHERE (MaterialId = TblWareddetails_1.MaterialId)) AS CategoryId, StoreId, UserIn, TimeIn FROM TblWareddetails AS TblWareddetails_1 WHERE (InvIDIn = @InvIDIn)" 
                                
                                
                    
                                
                                UpdateCommand="UPDATE [TblWareddetails] SET [MaterialId] = @MaterialId, [UnitPriceIn] = @UnitPriceIn, [InQty] = @InQty, [StoreId] = @StoreId, [UserIn] = @UserIn, [TimeIn] = GETDATE() WHERE [InvIDIn] = @original_InvIDIn AND [MaterialId] = @original_MaterialId" 
                                onselected="SqlDataSourceCodez_Selected">
                        <DeleteParameters>
                            <asp:Parameter Name="original_InvIDIn" Type="Int32" />
                            <asp:Parameter Name="original_MaterialId" Type="Int32" />
                            <asp:Parameter Name="original_UnitPriceIn" Type="Double" />
                            <asp:Parameter Name="original_InQty" Type="Int32" />
                            <asp:Parameter Name="original_StoreId" Type="Int32" />
                            <asp:Parameter Name="original_UserIn" Type="Int32" />
                            <asp:Parameter Name="original_TimeIn" Type="DateTime" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:ControlParameter ControlID="RadComboBoxBillz" Name="InvIDIn" 
                                        PropertyName="SelectedValue" Type="Int32" />
                            <asp:Parameter Name="MaterialId" Type="Int32" />
                            <asp:Parameter Name="UnitPriceIn" Type="Double" />
                            <asp:Parameter Name="InQty" Type="Int32" />
                            <asp:Parameter Name="StoreId" Type="Int32" />
                            <asp:SessionParameter Name="UserIn" SessionField="UserID" Type="Int32" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="RadComboBoxBillz" Name="InvIDIn" 
                                        PropertyName="SelectedValue" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="MaterialId" />
                            <asp:Parameter Name="UnitPriceIn" Type="Double" />
                            <asp:Parameter Name="InQty" Type="Int32" />
                            <asp:Parameter Name="StoreId" Type="Int32" />
                            <asp:SessionParameter Name="UserIn" SessionField="UserID" Type="Int32" />
                            <asp:Parameter Name="TimeIn" Type="DateTime" />
                            <asp:Parameter Name="original_InvIDIn" Type="Int32" />
                            <asp:Parameter Name="original_MaterialId" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSourceStore" runat="server" 
                                ConnectionString="Data Source=.;Initial Catalog=E_STORE;Integrated Security=True" 
                                OldValuesParameterFormatString="original_{0}" 
                                ProviderName="System.Data.SqlClient" 
                    SelectCommand="SELECT [StoreId], [Storename] FROM [CdStore]">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LblOverTotal" runat="server" BackColor="Black" 
                                BorderColor="Lime" BorderStyle="Solid" BorderWidth="5px" Font-Bold="True" 
                                Font-Size="14pt" ForeColor="White" style="text-align: center"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="direction: ltr">
                    <asp:Button ID="BtnPrintBill" runat="server" Text="طباعة الفاتوه" Width="100px" 
                        onclick="BtnPrintBill_Click" />
                    <asp:Button ID="BtnPrintBarcodeSerial" runat="server" Text="طباعة سريال الباركود" 
                        Width="100px" onclick="BtnPrintBarcodeSerial_Click" />
                    <asp:Button ID="BtnPrintSerial" runat="server" Text="طباعة سريال المصنع فارغ" 
                        Width="150px" onclick="BtnPrintSerial_Click" />
                    <table align="center" border="1" class="style4" frame="border">
                        <tr>
                            <td style="text-align: right">
                                <telerik:RadDatePicker ID="RadDatePickerdateTrhel" runat="server" 
                                    Culture="en-US" DateInput-EmptyMessage="ادخل تاريخ" MaxDate="3000-01-01" 
                                    MinDate="1000-01-01" style="direction: rtl" Width="200px">
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
                            <td>
                                <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="14px" 
                                    ForeColor="Black" Text="تاريخ التخزين"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right">
                                <asp:CheckBox ID="CheckBoxTrhel" runat="server" AutoPostBack="True" 
                                    Font-Bold="True" Font-Size="14px" ForeColor="Black" 
                                    oncheckedchanged="CheckBoxTrhel_CheckedChanged" Text="تخزين" />
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
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
</asp:Panel>

        
                                                
