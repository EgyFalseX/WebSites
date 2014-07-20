<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditorOptions.ascx.cs" Inherits="EditorOptions" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<style type="text/css">
    .style1
    {
        width: 581px;
    }
    .style2
    {
    }
    .style3
    {
        width: 238px;
        text-align: center;
    }
    .style4
    {
        width: 102px;
    }
</style>
<div dir ="rtl">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table class="style1" dir="rtl" border="1" align="center">
        <tr>
            <td align="left" colspan="3" style="text-align: center">
                <asp:Button ID="BtnBack" runat="server" onclick="BtnBack_Click" Text="عوده" 
                    Width="100px" />
                        </td>
        </tr>
        <tr>
            <td class="style2" align="left">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" Text="العملاء: "></asp:Label>
                            <asp:ImageButton ID="BtnSelectCus" runat="server" CausesValidation="False" 
                                ImageUrl="~/Images/select.gif" />
                            <ajaxToolkit:ModalPopupExtender ID="BtnSelectCus_ModalPopupExtender" 
                    runat="server" DynamicServicePath="" Enabled="True" PopupControlID="PnlPopCus" 
                    TargetControlID="BtnSelectCus" CancelControlID="BtnCancelCus">
                </ajaxToolkit:ModalPopupExtender>
                        </td>
            <td class="style3">
                <asp:Label ID="Lblcus" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black"></asp:Label>
                <asp:HiddenField ID="HiddenFieldCus" runat="server" />
            </td>
            <td class="style4">
                <asp:Button ID="BtnCus" runat="server" Text="حفظ" Width="100px" 
                    onclick="BtnCus_Click" />
            </td>
        </tr>
        <tr>
            <td class="style2" align="left">
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" Text="الموردين: "></asp:Label>
                            <asp:ImageButton ID="BtnSelectSup" runat="server" CausesValidation="False" 
                                ImageUrl="~/Images/select.gif" />
                        <ajaxToolkit:ModalPopupExtender ID="BtnSelectSup_ModalPopupExtender" 
                    runat="server" CancelControlID="BtnCancelSup" DynamicServicePath="" 
                    Enabled="True" PopupControlID="PnlPopSup" TargetControlID="BtnSelectSup">
                </ajaxToolkit:ModalPopupExtender>
                        </td>
            <td class="style3">
                <asp:Label ID="LblSup" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black"></asp:Label>
                <asp:HiddenField ID="HiddenFieldSup" runat="server" />
            </td>
            <td class="style4">
                <asp:Button ID="BtnSup" runat="server" Text="حفظ" Width="100px" 
                    onclick="BtnSup_Click" />
            </td>
        </tr>
        <tr>
            <td class="style2" align="left">
                <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" Text="الخزنه: "></asp:Label>
                            <asp:ImageButton ID="BtnSelectInv" runat="server" CausesValidation="False" 
                                ImageUrl="~/Images/select.gif" />
                        <ajaxToolkit:ModalPopupExtender ID="BtnSelectInv_ModalPopupExtender" 
                    runat="server" CancelControlID="BtnCancelInv" DynamicServicePath="" 
                    Enabled="True" PopupControlID="PnlPopInv" TargetControlID="BtnSelectInv">
                </ajaxToolkit:ModalPopupExtender>
                        </td>
            <td class="style3">
                <asp:Label ID="LblInv" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black"></asp:Label>
                <asp:HiddenField ID="HiddenFieldInv" runat="server" />
            </td>
            <td class="style4">
                <asp:Button ID="BtnInv" runat="server" Text="حفظ" Width="100px" 
                    onclick="BtnInv_Click" />
            </td>
        </tr>
        <tr>
            <td class="style2" align="left">
                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" Text="المشتريات:"></asp:Label>
                            <asp:ImageButton ID="BtnSelectPur" runat="server" CausesValidation="False" 
                                ImageUrl="~/Images/select.gif" />
                        <ajaxToolkit:ModalPopupExtender ID="BtnSelectPur_ModalPopupExtender" 
                    runat="server" CancelControlID="BtnCancelPur" DynamicServicePath="" 
                    Enabled="True" PopupControlID="PnlPopPur" TargetControlID="BtnSelectPur">
                </ajaxToolkit:ModalPopupExtender>
                        </td>
            <td class="style3">
                <asp:Label ID="LblPur" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black"></asp:Label>
                <asp:HiddenField ID="HiddenFieldPur" runat="server" />
            </td>
            <td class="style4">
                <asp:Button ID="BtnPur" runat="server" Text="حفظ" Width="100px" 
                    onclick="BtnPur_Click" />
            </td>
        </tr>
        <tr>
            <td class="style2" align="left">
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" Text="المبيعات:"></asp:Label>
                            <asp:ImageButton ID="BtnSelectSale" runat="server" CausesValidation="False" 
                                ImageUrl="~/Images/select.gif" />
                        <ajaxToolkit:ModalPopupExtender ID="BtnSelectSale_ModalPopupExtender" 
                    runat="server" CancelControlID="BtnCancelSale" DynamicServicePath="" 
                    Enabled="True" PopupControlID="PnlPopSale" TargetControlID="BtnSelectSale">
                </ajaxToolkit:ModalPopupExtender>
                        </td>
            <td class="style3">
                <asp:Label ID="LblSale" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black"></asp:Label>
                <asp:HiddenField ID="HiddenFieldSale" runat="server" />
            </td>
            <td class="style4">
                <asp:Button ID="BtnSale" runat="server" Text="حفظ" Width="100px" 
                    onclick="BtnSale_Click" />
            </td>
        </tr>
        <tr>
            <td class="style2" align="left">
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" Text="شيكات تحت الصرف"></asp:Label>
                            <asp:ImageButton ID="BtnSelectUnderEx" runat="server" CausesValidation="False" 
                                ImageUrl="~/Images/select.gif" />
                        <ajaxToolkit:ModalPopupExtender ID="BtnSelectUnderEx_ModalPopupExtender" 
                    runat="server" CancelControlID="BtnCancelUnderEx" DynamicServicePath="" 
                    Enabled="True" PopupControlID="pnlPopUnderEx" 
                    TargetControlID="BtnSelectUnderEx">
                </ajaxToolkit:ModalPopupExtender>
                        </td>
            <td class="style3">
                <asp:Label ID="LblUnderEx" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black"></asp:Label>
                <asp:HiddenField ID="HiddenFieldUnderEx" runat="server" />
            </td>
            <td class="style4">
                <asp:Button ID="BtnUnderEx" runat="server" Text="حفظ" Width="100px" 
                    onclick="BtnUnderEx_Click" />
            </td>
        </tr>
        <tr>
            <td class="style2" align="left">
                <asp:Label ID="Label7" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" Text="شيكات تحت التحصيل"></asp:Label>
                            <asp:ImageButton ID="BtnSelectUnderCol" runat="server" CausesValidation="False" 
                                ImageUrl="~/Images/select.gif" />
                        <ajaxToolkit:ModalPopupExtender ID="BtnSelectUnderCol_ModalPopupExtender" 
                    runat="server" CancelControlID="BtnCancelUnderCol" DynamicServicePath="" 
                    Enabled="True" PopupControlID="pnlPopUnderCol" 
                    TargetControlID="BtnSelectUnderCol">
                </ajaxToolkit:ModalPopupExtender>
                        </td>
            <td class="style3">
                <asp:Label ID="LblUnderCol" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black"></asp:Label>
                <asp:HiddenField ID="HiddenFieldUnderCol" runat="server" />
            </td>
            <td class="style4">
                <asp:Button ID="BtnUnderCol" runat="server" Text="حفظ" Width="100px" 
                    onclick="BtnUnderCol_Click" />
            </td>
        </tr>
        <tr>
            <td class="style2" align="left">
                <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" Text="مردود البيعات"></asp:Label>
                            <asp:ImageButton ID="BtnSelectSaleReturner" runat="server" CausesValidation="False" 
                                ImageUrl="~/Images/select.gif" />
                        <ajaxToolkit:ModalPopupExtender ID="BtnSelectSaleReturner_ModalPopupExtender" 
                    runat="server" CancelControlID="BtnCancelSaleReturner" DynamicServicePath="" 
                    Enabled="True" PopupControlID="pnlPopSaleReturner" 
                    TargetControlID="BtnSelectSaleReturner">
                </ajaxToolkit:ModalPopupExtender>
                        </td>
            <td class="style3">
                <asp:Label ID="LblSaleReturner" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black"></asp:Label>
                <asp:HiddenField ID="HiddenFieldSaleReturner" runat="server" />
            </td>
            <td class="style4">
                <asp:Button ID="BtnSaleReturner" runat="server" Text="حفظ" Width="100px" 
                    onclick="BtnSaleReturner_Click" />
            </td>
        </tr>
        <tr>
            <td class="style2" align="left">
                <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" Text="مرتجع الموردين"></asp:Label>
                            <asp:ImageButton ID="BtnSelectBuyReturner" runat="server" CausesValidation="False" 
                                ImageUrl="~/Images/select.gif" />
                        <ajaxToolkit:ModalPopupExtender ID="BtnSelectBuyReturner_ModalPopupExtender" 
                    runat="server" CancelControlID="BtnCancelBuyReturner" DynamicServicePath="" 
                    Enabled="True" PopupControlID="pnlPopBuyReturner" 
                    TargetControlID="BtnSelectBuyReturner">
                </ajaxToolkit:ModalPopupExtender>
                        </td>
            <td class="style3">
                <asp:Label ID="LblBuyReturner" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black"></asp:Label>
                <asp:HiddenField ID="HiddenFieldBuyReturner" runat="server" />
            </td>
            <td class="style4">
                <asp:Button ID="BtnSaleReturner0" runat="server" Text="حفظ" Width="100px" 
                    onclick="BtnBuyReturner_Click" />
            </td>
        </tr>
        <tr>
            <td class="style2" align="left">
                <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black" Text="عملاء البيع التجاري"></asp:Label>
                            <asp:ImageButton ID="BtnSelectCommercialCustomer" runat="server" CausesValidation="False" 
                                ImageUrl="~/Images/select.gif" />
                        <ajaxToolkit:ModalPopupExtender ID="BtnSelectCommercialCustomer_ModalPopupExtender" 
                    runat="server" CancelControlID="BtnCancelCommercialCustomer" DynamicServicePath="" 
                    Enabled="True" PopupControlID="pnlPopCommercialCustomer" 
                    TargetControlID="BtnSelectCommercialCustomer">
                </ajaxToolkit:ModalPopupExtender>
                        </td>
            <td class="style3">
                <asp:Label ID="LblCommercialCustomer" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black"></asp:Label>
                <asp:HiddenField ID="HiddenFieldCommercialCustomer" runat="server" />
            </td>
            <td class="style4">
                <asp:Button ID="BtnCommercialCustomer" runat="server" Text="حفظ" Width="100px" 
                    onclick="BtnCommercialCustomer_Click" />
            </td>
        </tr>
        <tr>
            <td bgcolor="Yellow" colspan="3" style="text-align: center">
                <asp:Label ID="LblState" runat="server" Font-Bold="True" Font-Size="14px" 
                    ForeColor="Black"></asp:Label>
            </td>
        </tr>
    </table>
</div>
<asp:Panel ID="PnlPopCus" ScrollBars="Both" Style="display: none"
        runat="server" Width="230px" Height="450px" CssClass="modalPopup" 
    BackColor="White" BorderColor="#3399FF" BorderStyle="Solid"  >
        <telerik:RadTreeView ID="RadTreeViewAccCus" Runat="server" BorderColor="#507CD1" LoadingMessage="تحميـــــــــل ..." 
            Skin="Hay" style="text-align: left; direction: ltr;" BackColor="White">
            <ExpandAnimation Duration="100" />
            <CollapseAnimation Duration="100" Type="OutQuint" />
        </telerik:RadTreeView>
        <asp:Button ID="BtnOkCus" runat="server" Text="موافق" onclick="BtnOkCus_Click" 
            Width="213px" />
            <asp:Button ID="BtnCancelCus" runat="server" Text="اغلاق" Width="215px" />
</asp:Panel>
<asp:Panel ID="PnlPopSup" ScrollBars="Both" Style="display: none"
        runat="server" Width="230px" Height="450px" CssClass="modalPopup" 
    BackColor="White" BorderColor="#3399FF" BorderStyle="Solid"  >
        <telerik:RadTreeView ID="RadTreeViewAccSup" Runat="server" BorderColor="#507CD1" LoadingMessage="تحميـــــــــل ..." 
            Skin="Hay" style="text-align: left; direction: ltr;" BackColor="White">
            <ExpandAnimation Duration="100" />
            <CollapseAnimation Duration="100" Type="OutQuint" />
        </telerik:RadTreeView>
        <asp:Button ID="BtnOkSup" runat="server" Text="موافق" onclick="BtnOkSup_Click" 
        Width="213px" />
        <asp:Button ID="BtnCancelSup" runat="server" Text="اغلاق" Width="215px" />
</asp:Panel>
<asp:Panel ID="PnlPopInv" ScrollBars="Both" Style="display: none"
        runat="server" Width="230px" Height="450px" CssClass="modalPopup" 
    BackColor="White" BorderColor="#3399FF" BorderStyle="Solid"  >
        <telerik:RadTreeView ID="RadTreeViewAccInv" Runat="server" BorderColor="#507CD1" LoadingMessage="تحميـــــــــل ..." 
            Skin="Hay" style="text-align: left; direction: ltr;" BackColor="White">
            <ExpandAnimation Duration="100" />
            <CollapseAnimation Duration="100" Type="OutQuint" />
        </telerik:RadTreeView>
        <asp:Button ID="BtnOkInv" runat="server" Text="موافق" onclick="BtnOkInv_Click" 
            Width="235px" />
            <asp:Button ID="BtnCancelInv" runat="server" Text="اغلاق" Width="215px" />
</asp:Panel>
<asp:Panel ID="pnlPopPur" ScrollBars="Both" Style="display: none"
        runat="server" Width="230px" Height="450px" CssClass="modalPopup" 
    BackColor="White" BorderColor="#3399FF" BorderStyle="Solid"  >
        <telerik:RadTreeView ID="RadTreeViewAccPur" Runat="server" BorderColor="#507CD1" LoadingMessage="تحميـــــــــل ..." 
            Skin="Hay" style="text-align: left; direction: ltr;" BackColor="White">
            <ExpandAnimation Duration="100" />
            <CollapseAnimation Duration="100" Type="OutQuint" />
        </telerik:RadTreeView>
        <asp:Button ID="BtnOkPur" runat="server" Text="موافق" onclick="BtnOkPur_Click" 
            Width="235px" />
            <asp:Button ID="BtnCancelPur" runat="server" Text="اغلاق" Width="215px" />
</asp:Panel>
<asp:Panel ID="pnlPopSale" ScrollBars="Both" Style="display: none"
        runat="server" Width="230px" Height="450px" CssClass="modalPopup" 
    BackColor="White" BorderColor="#3399FF" BorderStyle="Solid"  >
        <telerik:RadTreeView ID="RadTreeViewAccSale" Runat="server" BorderColor="#507CD1" LoadingMessage="تحميـــــــــل ..." 
            Skin="Hay" style="text-align: left; direction: ltr;" BackColor="White">
            <ExpandAnimation Duration="100" />
            <CollapseAnimation Duration="100" Type="OutQuint" />
        </telerik:RadTreeView>
        <asp:Button ID="BtnOkSale" runat="server" Text="موافق" onclick="BtnOkSale_Click" 
            Width="235px" />
            <asp:Button ID="BtnCancelSale" runat="server" Text="اغلاق" Width="215px" />
</asp:Panel>
<asp:Panel ID="pnlPopUnderEx" ScrollBars="Both" Style="display: none"
        runat="server" Width="230px" Height="450px" CssClass="modalPopup" 
    BackColor="White" BorderColor="#3399FF" BorderStyle="Solid"  >
        <telerik:RadTreeView ID="RadTreeViewUnderEx" Runat="server" BorderColor="#507CD1" LoadingMessage="تحميـــــــــل ..." 
            Skin="Hay" style="text-align: left; direction: ltr;" BackColor="White">
            <ExpandAnimation Duration="100" />
            <CollapseAnimation Duration="100" Type="OutQuint" />
        </telerik:RadTreeView>
        <asp:Button ID="BtnOkUnderEx" runat="server" Text="موافق" onclick="BtnOkUnderEx_Click" 
            Width="235px" />
            <asp:Button ID="BtnCancelUnderEx" runat="server" Text="اغلاق" Width="215px" />
</asp:Panel>
<asp:Panel ID="pnlPopUnderCol" ScrollBars="Both" Style="display: none"
        runat="server" Width="230px" Height="450px" CssClass="modalPopup" 
    BackColor="White" BorderColor="#3399FF" BorderStyle="Solid"  >
        <telerik:RadTreeView ID="RadTreeViewUnderCol" Runat="server" BorderColor="#507CD1" LoadingMessage="تحميـــــــــل ..." 
            Skin="Hay" style="text-align: left; direction: ltr;" BackColor="White">
            <ExpandAnimation Duration="100" />
            <CollapseAnimation Duration="100" Type="OutQuint" />
        </telerik:RadTreeView>
        <asp:Button ID="BtnOkUnderCol" runat="server" Text="موافق" onclick="BtnOkUnderCol_Click" 
            Width="235px" />
            <asp:Button ID="BtnCancelUnderCol" runat="server" Text="اغلاق" Width="215px" />
</asp:Panel>
<asp:Panel ID="pnlPopSaleReturner" ScrollBars="Both" Style="display: none"
        runat="server" Width="230px" Height="450px" CssClass="modalPopup" 
    BackColor="White" BorderColor="#3399FF" BorderStyle="Solid"  >
        <telerik:RadTreeView ID="RadTreeViewSaleReturner" Runat="server" BorderColor="#507CD1" LoadingMessage="تحميـــــــــل ..." 
            Skin="Hay" style="text-align: left; direction: ltr;" BackColor="White">
            <ExpandAnimation Duration="100" />
            <CollapseAnimation Duration="100" Type="OutQuint" />
        </telerik:RadTreeView>
        <asp:Button ID="BtnOkSaleReturner" runat="server" Text="موافق" onclick="BtnOkSaleReturner_Click" 
            Width="235px" />
            <asp:Button ID="BtnCancelSaleReturner" runat="server" Text="اغلاق" Width="215px" />
</asp:Panel>
<asp:Panel ID="pnlPopBuyReturner" ScrollBars="Both" Style="display: none"
        runat="server" Width="230px" Height="450px" CssClass="modalPopup" 
    BackColor="White" BorderColor="#3399FF" BorderStyle="Solid"  >
        <telerik:RadTreeView ID="RadTreeViewBuyReturner" Runat="server" BorderColor="#507CD1" LoadingMessage="تحميـــــــــل ..." 
            Skin="Hay" style="text-align: left; direction: ltr;" BackColor="White">
            <ExpandAnimation Duration="100" />
            <CollapseAnimation Duration="100" Type="OutQuint" />
        </telerik:RadTreeView>
        <asp:Button ID="BtnOkBuyReturner" runat="server" Text="موافق" onclick="BtnOkBuyReturner_Click" 
            Width="235px" />
            <asp:Button ID="BtnCancelBuyReturner" runat="server" Text="اغلاق" Width="215px" />
</asp:Panel>
<asp:Panel ID="pnlPopCommercialCustomer" ScrollBars="Both" Style="display: none"
        runat="server" Width="230px" Height="450px" CssClass="modalPopup" 
    BackColor="White" BorderColor="#3399FF" BorderStyle="Solid"  >
        <telerik:RadTreeView ID="RadTreeViewCommercialCustomer" Runat="server" BorderColor="#507CD1" LoadingMessage="تحميـــــــــل ..." 
            Skin="Hay" style="text-align: left; direction: ltr;" BackColor="White">
            <ExpandAnimation Duration="100" />
            <CollapseAnimation Duration="100" Type="OutQuint" />
        </telerik:RadTreeView>
        <asp:Button ID="BtnOkCommercialCustomer" runat="server" Text="موافق" onclick="BtnOkCommercialCustomer_Click" 
            Width="235px" />
            <asp:Button ID="BtnCancelCommercialCustomer" runat="server" Text="اغلاق" Width="215px" />
</asp:Panel>