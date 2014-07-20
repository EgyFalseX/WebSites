<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditorWared_.ascx.cs" Inherits="EditorWared" %>
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
        height: 440px;
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
    .style2
    {
        width: 5px;
    }
    .style3
    {
        height: 30px;
    }
    .style4
    {
        width: 5px;
        height: 30px;
        text-align: left;
    }
    .style6
    {
        height: 30px;
        }
    .style8
    {
    }
    .style10
    {
        height: 30px;
        width: 175px;
    }
    .style11
    {
        width: 158px;
    }
    .style12
    {
        width: 175px;
    }
</style>
<telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
    <table class="Wardstyle1" dir="rtl" align="center" border="1">
        <tr>
            <td class="Wardstyle3">
                <asp:Button ID="BtnBack" runat="server" onclick="BtnBack_Click" Text="عوده" 
                    Width="100px" />
            </td>
            <td class="Wardstyle5">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="Wardstyle3">
                <asp:Label ID="Label10" runat="server" Text="جميع الفواتير" Font-Bold="True" 
                    Font-Size="14px" ForeColor="Black"></asp:Label>
            </td>
            <td class="Wardstyle5">
                <telerik:RadComboBox ID="RadComboBoxBillz" Runat="server" Skin="Sunset" 
                    LoadingMessage="تحميل..." Width="257px" 
                    onselectedindexchanged="RadComboBoxBillz_SelectedIndexChanged" 
                    AutoPostBack="True">
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
        <asp:HiddenField ID="HiddenFieldMaterialId" runat="server" />
        <br />
    <asp:Panel ID="PnlBillGeneral" runat="server" Visible="False">
           <asp:Panel ID="PnlShowHide" runat="server">
            <table class="Wardstyle1" dir="rtl" align="center" border="1">
                <tr>
                    <td class="style1">
                        <asp:Label ID="Label1" runat="server" Text="رقم الفاتوه" Font-Bold="True" 
                    Font-Size="14px" ForeColor="Black"></asp:Label>
                    </td>
                    <td class="Wardstyle5">
                        <asp:TextBox ID="TxtInvIDIn" runat="server" Width="200px" ReadOnly="True"></asp:TextBox>
                        <asp:Button ID="BtnGetID" runat="server" Text="رقم جديد" Width="100px" 
                    Font-Bold="True" Font-Size="14px" ForeColor="#353535" onclick="BtnGetID_Click" 
                            Visible="False" />
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        <asp:Label ID="Label16" runat="server" Font-Bold="True" Font-Size="14px" 
                            Text="نوع الفاتوره" ForeColor="Black"></asp:Label>
                    </td>
                    <td class="Wardstyle5">
                        <asp:DropDownList ID="DDLType" runat="server" Width="200px">
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
                        <telerik:RadComboBox ID="RadComboBoxSupplierId" Runat="server" Skin="Sunset" 
                    Width="200px">
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
                    <td class="style1">
                        &nbsp;</td>
                    <td class="Wardstyle5">
                        <asp:CheckBox ID="CheckBoxTrhel" runat="server" AutoPostBack="True" 
                            Font-Bold="True" Font-Size="14px" ForeColor="Black" 
                            Text="تخزين" oncheckedchanged="CheckBoxTrhel_CheckedChanged" />
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="14px" 
                            ForeColor="Black" Text="تاريخ التخزين"></asp:Label>
                    </td>
                    <td class="Wardstyle5">
                        <telerik:RadDatePicker ID="RadDatePickerdateTrhel" runat="server" 
                            DateInput-EmptyMessage="ادخل تاريخ" MaxDate="3000-01-01" 
                            MinDate="1000-01-01" style="direction: rtl" Width="200px" Culture="en-US">
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
            </table>

        </asp:Panel>
            <table align="center" border="1" class="Wardstyle1" dir="rtl">
                <tr>
                    <td style="text-align: center">
                        <asp:ImageButton ID="BtnShowHide" runat="server" Height="25px" 
                            ImageUrl="~/Images/ShowHide.png" style="text-align: center" Width="50px" 
                            onclick="BtnShowHide_Click" />
                    </td>
                    <td class="Wardstyle5">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td align="center" bgcolor="Yellow" class="Wardstyle3" colspan="2">
                        <asp:Label ID="LblState" runat="server" Font-Bold="True" Font-Size="16px" 
                            Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>            
</asp:Panel>
    <asp:Panel ID="PnlBillDetials" runat="server" Visible="False" 
    style="text-align: center">
    <table align="center" class="Wardstyle6" dir="rtl">
        <tr>
            <td valign="top" class="Wardstyle12">
                <table align="center" border="1" class="Wardstyle8" dir="rtl">
                    <tr>
                        <td class="style12">
                            <asp:Label ID="Label17" runat="server" Font-Bold="True" Font-Size="14px" 
                                ForeColor="Black" Text="اسم الوحده "></asp:Label>
                            <asp:ImageButton ID="BtnSelectMatrial" runat="server" CausesValidation="False" 
                                ImageUrl="~/Images/select.gif" />
                            <ajaxToolkit:ModalPopupExtender ID="MPopupEx" runat="server" 
                                DynamicServicePath="" Enabled="True" 
                                TargetControlID="BtnSelectMatrial" PopupControlID="PnlPop" CancelControlID="BtnCancel">
                            </ajaxToolkit:ModalPopupExtender>
                        </td>
                        <td class="Wardstyle9">
                            <asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="14px" 
                                ForeColor="Black" Text="سعر الوحدة"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Size="14px" 
                                ForeColor="Black" Text="الكمية"></asp:Label>
                        </td>
                        <td class="style2">
                            <asp:Label ID="Label15" runat="server" Font-Bold="True" Font-Size="14px" 
                                ForeColor="Black" Text="المخزن"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style12">
                            <asp:Label ID="LblItemName" runat="server" Font-Bold="True" Font-Size="14px" 
                                ForeColor="Black"></asp:Label>
                        </td>
                        <td class="Wardstyle9">
                            <asp:TextBox ID="TxtUnitPriceIn" runat="server" Width="50px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="TxtInQty" runat="server" Width="50px"></asp:TextBox>
                        </td>
                        <td class="style2">
                            <telerik:RadComboBox ID="RadComboBoxStoreId" Runat="server" Skin="Sunset" 
                                Width="100px">
                            </telerik:RadComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style8" colspan="4">
                            <asp:ImageButton ID="BtnAddItem" runat="server" Height="32px" 
                                ImageUrl="~/Images/Add.png" onclick="BtnAddItem_Click" Width="32px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style10">
                            &nbsp;</td>
                        <td class="style3">
                            <asp:Button ID="BtnPrint" runat="server" Text="طباعة الفاتوه" Width="100px" />
                        </td>
                        <td class="style3">
                            <asp:Button ID="BtnPrint0" runat="server" Text="طباعة سريال الباركود" 
                                Width="100px" />
                        </td>
                        <td class="style4">
                            <asp:Button ID="BtnPrint1" runat="server" Text="طباعة سريال المصنع فارغ" 
                                Width="150px" />
                        </td>
                    </tr>
                    <tr>
                        <td class="style6" colspan="4">
                            <asp:GridView ID="GridViewMaterial" runat="server" AutoGenerateColumns="False" 
                                CellPadding="4" EmptyDataText="لا يوجد اصناف" EnableModelValidation="True" 
                                Font-Bold="True" Font-Size="14px" ForeColor="#333333" GridLines="None" 
                                Width="581px">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="Material" HeaderText="اسم الصنف" />
                                    <asp:BoundField DataField="UnitPriceIn" HeaderText="سعر الوحدة" />
                                    <asp:BoundField DataField="InQty" HeaderText="الكمية" />
                                    <asp:BoundField DataField="Storename" HeaderText="المخزن" />
                                    <asp:TemplateField HeaderText="حذف" ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButtonDelete" runat="server" Height="26px" 
                                                ImageUrl="~/Images/Delete.png" onclick="ImageButtonDelete_Click" 
                                                onclientclick="javascript: return confirm('هل انت متاكد ؟')" Width="33px" />
                                            <asp:HiddenField ID="HiddenFieldDeleteMaterialId" runat="server" 
                                                Value='<%# Bind("MaterialId") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                                <EditRowStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EFF3FB" />
                                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Panel>

<asp:Panel ID="PnlPop" ScrollBars="Both" Style="display: none"
        runat="server" Width="230px" Height="450px" CssClass="modalPopup" 
    BackColor="White" BorderColor="#3399FF" BorderStyle="Solid"  >
        <telerik:RadTreeView ID="RadTreeViewCat" Runat="server" BorderColor="#507CD1" LoadingMessage="تحميـــــــــل ..." 
            Skin="Hay" style="text-align: left; direction: ltr;" BackColor="White" 
            Font-Bold="True" Font-Size="14px" Height="300px">
            <ExpandAnimation Duration="100" />
            <CollapseAnimation Duration="100" Type="OutQuint" />
        </telerik:RadTreeView>
        <asp:TextBox ID="TxtItemCatID" runat="server" style="direction: rtl" 
            Width="215px"></asp:TextBox>
        <asp:Button ID="BtnOk" runat="server" onclick="BtnOk_Click" Text="موافق" 
            Width="215px" />
        <asp:Button ID="BtnCancel" runat="server" onclick="BtnCancel_Click" 
            Text="اغلاق" Width="215px" />
</asp:Panel>