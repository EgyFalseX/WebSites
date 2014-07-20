<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MainMenuNoTable.ascx.cs" Inherits="MainMenu" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<style type="text/css">
    .style1
    {
        width: 100px;
    }
</style>
<telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
</telerik:RadScriptManager>
<div>
    <table align="center" class="style1">
        <tr>
            <td>
<telerik:RadPanelBar ID="RadPanelBarMain" Runat="server" Skin="Hay" 
    style="text-align: center" ExpandMode="SingleExpandedItem" Font-Bold="False" 
                    AllowCollapseAllItems="True" ToolTip="E-E-Soft" 
                    Width="500px" Font-Size="30pt" onload="RadPanelBarMain_Load">
    <Items>
        <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
            Owner="RadPanelBarMain" Text="اكواد" Font-Bold="False" Font-Italic="False" 
            Font-Overline="False" Font-Strikeout="False" 
            Font-Underline="False" ForeColor="Blue" ImagePosition="Right" 
            Font-Size="15pt" Visible="False">
            <Items>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    Text="المخازن" Font-Bold="True" Font-Size="12pt" ForeColor="Blue" 
                    ImagePosition="Right" Visible="False">
                    <Items>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                            NavigateUrl="~/Code/CdWaredType.aspx" Owner="" 
                            Text="اكواد نوع اذن الاضافة" Font-Bold="True" Font-Size="10pt" 
                            ForeColor="Green" Value="CdWaredType.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                            NavigateUrl="~/Code/CdPaid.aspx" Owner="" Text="اكواد طرق الدفع" 
                            Font-Bold="True" Font-Size="10pt" ForeColor="Green" Value="CdPaid.aspx" 
                            Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                            NavigateUrl="~/Code/CdStore.aspx" Owner="" Text="اكواد  مخازن الشركة" 
                            Font-Bold="True" Font-Size="10pt" ForeColor="Green" Value="CdStore.aspx" 
                            Visible="False">
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    Text="الحسابات" Font-Bold="True" Font-Size="12pt" ForeColor="Blue" 
                    ImagePosition="Right" Visible="False">
                    <Items>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                            NavigateUrl="~/Code/AccTreeBuilder.aspx" Owner="" Text="شجرة الحسابات" 
                            Font-Bold="True" Font-Size="10pt" ForeColor="Green" 
                            Value="AccTreeBuilder.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                            NavigateUrl="~/Code/CdAccountRasid.aspx" Owner="" Text="طبيعة الرصيد" 
                            Font-Bold="True" Font-Size="10pt" ForeColor="Green" 
                            Value="CdAccountRasid.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                            NavigateUrl="~/Code/CdAccountNature.aspx" Owner="" Text="طبيعه الحسابات" 
                            Font-Bold="True" Font-Size="10pt" ForeColor="Green" 
                            Value="CdAccountNature.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                            NavigateUrl="~/Code/CdYear.aspx" Owner="" Text="اكواد العام المالي" 
                            Font-Bold="True" Font-Size="10pt" ForeColor="Green" Value="CdYear.aspx" 
                            Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="10pt" 
                            ForeColor="Green" ImageUrl="~/images/CodesImg.png" 
                            NavigateUrl="~/Code/CDBank.aspx" Owner="" Text="حسابات البنوك" 
                            Value="CDBank.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                            NavigateUrl="~/Code/CdEdaaType.aspx" Owner="" Text="انواع الايداعات" 
                            Font-Bold="True" Font-Size="10pt" ForeColor="Green" 
                            Value="CdEdaaType.aspx" Visible="False">
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    Text="مركز الخدمة" Font-Bold="True" Font-Size="12pt" ForeColor="Blue" 
                    ImagePosition="Right" Visible="False">
                    <Items>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                            NavigateUrl="~/Code/CdServiceType.aspx" Owner="" Text="اكواد الخدمات" 
                            Font-Bold="True" Font-Size="10pt" ForeColor="Green" 
                            Value="CdServiceType.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                            NavigateUrl="~/Code/CdCommWay.aspx" Owner="" Text="طرق الابلاغ" 
                            Font-Bold="True" Font-Size="10pt" ForeColor="Green" Value="CdCommWay.aspx" 
                            Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                            NavigateUrl="~/Code/CdCallDir.aspx" Owner="" Text="نوع الاتصال" 
                            Font-Bold="True" Font-Size="10pt" ForeColor="Green" Value="CdCallDir.aspx" 
                            Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                            NavigateUrl="~/Code/CdHeadCompany.aspx" Owner="" 
                            Text="بيانات مراكز الخدمة" Font-Bold="True" Font-Size="10pt" ForeColor="Green" 
                            Value="CdHeadCompany.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                            NavigateUrl="~/Code/CdTransferType.aspx" Owner="" 
                            Text="اكواد تحويل المهام" Font-Bold="True" Font-Size="10pt" ForeColor="Green" 
                            Value="CdTransferType.aspx" Visible="False">
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    Text="اكواد عامة" Font-Bold="True" Font-Size="12pt" ForeColor="Blue" 
                    ImagePosition="Right" Visible="False">
                    <Items>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                            NavigateUrl="~/Code/CdGov.aspx" Owner="" Text="اكواد المحافظات" 
                            Font-Bold="True" Font-Size="10pt" ForeColor="Green" Value="CdGov.aspx" 
                            Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                            NavigateUrl="~/Code/CdMarakez.aspx" Owner="" Text="اكواد المراكز" 
                            Font-Bold="True" Font-Size="10pt" ForeColor="Green" Value="CdMarakez.aspx" 
                            Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                            NavigateUrl="~/Code/CdHay.aspx" Owner="" Text="اكواد الاحياء" 
                            Font-Bold="True" Font-Size="10pt" ForeColor="Green" Value="CdHay.aspx" 
                            Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="10pt" 
                            ForeColor="Green" ImageUrl="~/images/CodesImg.png" 
                            NavigateUrl="~/Code/CdHeadCompany.aspx" Owner="" Text="بيانات مراكز الخدمة" 
                            Value="CdHeadCompany.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                            NavigateUrl="~/Code/CdEdara.aspx" Owner="" Text="ادارات الشركة" 
                            Font-Bold="True" Font-Size="10pt" ForeColor="Green" Value="CdEdara.aspx" 
                            Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                            NavigateUrl="~/Code/CdDepartment.aspx" Owner="" Text="اقسام الشركة" 
                            Font-Bold="True" Font-Size="10pt" ForeColor="Green" 
                            Value="CdDepartment.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                            NavigateUrl="~/Code/CdQual.aspx" Owner="" Text="اكواد المؤهلات" 
                            Font-Bold="True" Font-Size="10pt" ForeColor="Green" Value="CdQual.aspx" 
                            Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                            NavigateUrl="~/Code/CdQualTakasos.aspx" Owner="" 
                            Text="اكواد تخصص المؤهلات" Font-Bold="True" Font-Size="10pt" ForeColor="Green" 
                            Value="CdQualTakasos.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                            NavigateUrl="~/Code/CdQualTakder.aspx" Owner="" 
                            Text="اكواد تقدير المؤهلات" Font-Bold="True" Font-Size="10pt" ForeColor="Green" 
                            Value="CdQualTakder.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                            NavigateUrl="~/Code/CdJob.aspx" Owner="" Text="اكواد الوظائف" 
                            Font-Bold="True" Font-Size="10pt" ForeColor="Green" Value="CdJob.aspx" 
                            Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                            NavigateUrl="~/Code/CdJobDesc.aspx" Owner="" Text="اكواد التوصيف الوظيفي" 
                            Font-Bold="True" Font-Size="10pt" ForeColor="Green" Value="CdJobDesc.aspx" 
                            Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                            NavigateUrl="~/Code/CdSalaryType.aspx" Owner="" Text="طرق حساب الراتب" 
                            Font-Bold="True" Font-Size="10pt" ForeColor="Green" 
                            Value="CdSalaryType.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                            NavigateUrl="~/Code/CdHarakaType.aspx" Owner="" Text="انواع حركة الباركود" 
                            Font-Bold="True" Font-Size="10pt" ForeColor="Green" 
                            Value="CdHarakaType.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                            NavigateUrl="~/Code/CdShift.aspx" Owner="" Text="اكواد فترات الحضور" 
                            Font-Bold="True" Font-Size="10pt" ForeColor="Green" Value="CdShift.aspx" 
                            Visible="False">
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelItem>
            </Items>
        </telerik:RadPanelItem>
        <telerik:RadPanelItem runat="server" Text="ادخال بيانات" 
            ImageUrl="~/images/InputImg.png" Font-Bold="False" 
            ForeColor="Blue" ImagePosition="Right" Font-Size="15pt" 
            Owner="RadPanelBarMain" Visible="False">
            <Items>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/InputImg.png" 
                    Text="المخازن" Font-Bold="True" Font-Size="12pt" ForeColor="Blue" 
                    ImagePosition="Right" Visible="False">
                    <Items>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/Basic.aspx" Owner="" Text="بيانات الشركة" 
                            Font-Bold="True" Font-Size="10pt" ForeColor="Green" Value="Basic.aspx" 
                            Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Code/CdBranches.aspx" Owner="" Text="فروع الشركة" 
                            Font-Bold="True" Font-Size="10pt" ForeColor="Green" 
                            Value="CdBranches.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/EditorCustomer.aspx" Owner="" Text="بيانات العملاء" 
                            Font-Bold="True" Font-Size="10pt" ForeColor="Green" 
                            Value="EditorCustomer.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="10pt" 
                            ForeColor="Green" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/EditorCustomerFastEdit.aspx" 
                            Text="بيانات العملاء - تعديل سريع" Value="EditorCustomerFastEdit.aspx" 
                            Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/EditorSupplier.aspx" Owner="" Text="بيانات الموردين" 
                            Font-Bold="True" Font-Size="10pt" ForeColor="Green" 
                            Value="EditorSupplier.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/CatCreator.aspx" Owner="" Text="اكواد الاصناف" 
                            Font-Bold="True" Font-Italic="False" Font-Size="10pt" ForeColor="Green" 
                            Value="CatCreator.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/EditorMaterial.aspx" Owner="" Text="بيانات الاصناف" 
                            Font-Bold="True" Font-Size="10pt" ForeColor="Green" 
                            Value="EditorMaterial.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/EditorPricingpolicy.aspx" Owner="" Text="التسعير" 
                            Font-Bold="True" Font-Size="10pt" ForeColor="Green" 
                            Value="EditorPricingpolicy.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="10pt" 
                            ForeColor="Green" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/EditorPriceListDetails.aspx" Owner="" Text="الاقساط" 
                            Value="EditorPriceListDetails.aspx" Visible="False">
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="12pt" 
                    ForeColor="Blue" ImagePosition="Right" ImageUrl="~/images/InputImg.png" 
                    Text="ادخال حركة المخزن" Visible="False">
                    <Items>
                        <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="10pt" 
                            ForeColor="Green" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/EditorWared.aspx" Owner="" Text="ادخال الواردات" 
                            Value="EditorWared.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="10pt" 
                            ForeColor="Green" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/EditorSerial.aspx" Owner="" Text="ادخال السريال" 
                            Value="EditorSerial.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="10pt" 
                            ForeColor="Green" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/EditorBill.aspx" Owner="" Text="المبيعات" 
                            Value="EditorBill.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="10pt" 
                            ForeColor="Green" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/EditorBillSerial.aspx" Owner="" Text="صرف البضاعة باركود" 
                            Value="EditorBillSerial.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="10pt" 
                            ForeColor="Green" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/EditorDiscard.aspx" Owner="" Text="مردود المبيعات" 
                            Value="EditorDiscard.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="10pt" 
                            ForeColor="Green" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/EditorBillDiscard.aspx" Owner="" Text="مرتجعات الموردين" 
                            Value="EditorBillDiscard.aspx" Visible="False">
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="12pt" 
                    ForeColor="Blue" ImagePosition="Right" ImageUrl="~/images/InputImg.png" 
                    Text="ادخال البيع التجاري" Visible="False">
                    <Items>
                        <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="10pt" 
                            ForeColor="Green" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/EditorPricelists.aspx" Owner="" Text="قوائم الاسعار" 
                            Value="EditorPricelists.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="10pt" 
                            ForeColor="Green" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/EditorPriceListDetails.aspx" Owner="" 
                            Text="تفاصيل قوائم الاسعار" Value="EditorPriceListDetails.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="10pt" 
                            ForeColor="Green" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/EditorCommercialCustomers.aspx" Owner="" 
                            Text="عملاء البيع التجاري" Value="EditorCommercialCustomers.aspx" 
                            Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="10pt" 
                            ForeColor="Green" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/EditorContractSystemes.aspx" Owner="" Text="انظمة العقود" 
                            Value="EditorContractSystemes.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="10pt" 
                            ForeColor="Green" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/EditorContractes.aspx" Owner="" Text="عقود العملاء" 
                            Value="EditorContractes.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="10pt" 
                            ForeColor="Green" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/EditorContractItems.aspx" Owner="" Text="ماركات العقد" 
                            Value="EditorContractItems.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="10pt" 
                            ForeColor="Green" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/EditorCommercialBill.aspx" Owner="" 
                            Text="فواتير البيع التجاري" Value="EditorCommercialBill.aspx" Visible="False">
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/InputImg.png" 
                    Text="الحسابات" Font-Bold="True" Font-Size="12pt" ForeColor="Blue" 
                    ImagePosition="Right" Visible="False">
                    <Items>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/EditorOptions.aspx" Owner="" 
                            Text="خيارات شجرة الحسابات" Font-Bold="True" Font-Size="10pt" ForeColor="Green" 
                            Value="EditorOptions.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/EditorDailyConstraints.aspx" Owner="" 
                            Text="القيود اليوميه" Font-Bold="True" Font-Size="10pt" ForeColor="Green" 
                            Value="EditorDailyConstraints.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="10pt" 
                            ForeColor="Green" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/EditorCheck.aspx" Text="ترقيم الشيكات" 
                            Value="EditorCheck.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="10pt" 
                            ForeColor="Green" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/EditorEdaa.aspx" Text="حركة البنك ايداع" 
                            Value="EditorEdaa.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="10pt" 
                            ForeColor="Green" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/EditorBankSarf.aspx" Text="حركة البنك صرف" 
                            Value="EditorBankSarf.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="10pt" 
                            ForeColor="Green" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/EditorAlkazna.aspx" Text="الخزينه" 
                            Value="EditorAlkazna.aspx" Visible="False">
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/InputImg.png" 
                    Text="مركز الخدمة" Font-Bold="True" Font-Size="12pt" ForeColor="Blue" 
                    ImagePosition="Right" Visible="False">
                    <Items>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/OrderAdd.aspx" Owner="" Text="بلاغات الاعطال" 
                            Font-Bold="True" Font-Size="10pt" ForeColor="Green" Value="OrderAdd.aspx" 
                            Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/EditorTaskOrder.aspx" Owner="" Text="توزيع المهام" 
                            Font-Bold="True" Font-Size="10pt" ForeColor="Green" 
                            Value="EditorTaskOrder.aspx" Visible="False">
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/InputImg.png" 
                    Text="شئون العاملين" Font-Bold="True" Font-Size="12pt" ForeColor="Blue" 
                    ImagePosition="Right" Visible="False">
                    <Items>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/FullTblEmp.aspx" Owner="" Text="بيانات العاملين" 
                            Font-Bold="True" Font-Size="10pt" ForeColor="Green" 
                            Value="FullTblEmp.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/EditorUserAtt.aspx" Owner="" 
                            Text="الاوقات المقررة للحضور" Font-Bold="True" Font-Size="10pt" 
                            ForeColor="Green" Value="EditorUserAtt.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/UserAttBarcode.aspx" Owner="" 
                            Text="تسجل الحضور بالباركود" Font-Bold="True" Font-Size="10pt" 
                            ForeColor="Green" Value="UserAttBarcode.aspx" Visible="False">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" ImageUrl="~/images/InputImg.png" 
                            NavigateUrl="~/Input/UserAttNoBarcode.aspx" Owner="" 
                            Text="تسجيل الحضور يدويا" Font-Bold="True" Font-Size="10pt" ForeColor="Green" 
                            Value="UserAttNoBarcode.aspx" Visible="False">
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelItem>
            </Items>
        </telerik:RadPanelItem>
        <telerik:RadPanelItem runat="server" Text="استعلامات" 
            ImageUrl="~/images/QueryImg.png" Font-Bold="False" 
            ForeColor="Blue" ImagePosition="Right" Font-Size="15pt" 
            Font-Strikeout="False" Owner="RadPanelBarMain" Visible="False">
            <Items>
                <telerik:RadPanelItem runat="server" Text="الاتصالات" 
                    ImageUrl="~/images/QueryImg.png" 
                    NavigateUrl="~/Query/CommunicationGrid.aspx" Font-Bold="True" Font-Size="10pt" 
                    ForeColor="Green" Value="CommunicationGrid.aspx" Visible="False">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" Text="التوريدات" 
                    ImageUrl="~/images/QueryImg.png" NavigateUrl="~/Query/QryWared.aspx" 
                    Font-Bold="True" Font-Size="10pt" ForeColor="Green" Value="QryWared.aspx" 
                    Visible="False">
                </telerik:RadPanelItem>
            </Items>
        </telerik:RadPanelItem>
        <telerik:RadPanelItem runat="server" Font-Bold="False" Font-Size="15pt" 
            ForeColor="Green" ImagePosition="Right" ImageUrl="~/images/QueryImg.png" 
            NavigateUrl="~/Report/Reports.aspx" Text="التقـــــارير" Value="Reports.aspx" 
            Owner="RadPanelBarMain" Visible="False">
        </telerik:RadPanelItem>
        <telerik:RadPanelItem runat="server" Font-Bold="False" Font-Size="15pt" 
            ForeColor="Blue" ImagePosition="Right" ImageUrl="~/images/Permission.png" 
            Text="الصلاحيــــــــــــات" Visible="False">
            <Items>
                <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="10pt" 
                    ForeColor="Green" ImageUrl="~/images/Permission.png" 
                    NavigateUrl="~/Privileges/EditorUsers.aspx" Text="المستخدمين" 
                    Value="EditorUsers.aspx" Visible="False">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="10pt" 
                    ForeColor="Green" ImageUrl="~/images/Permission.png" 
                    NavigateUrl="~/Privileges/EditorRoles.aspx" Text="الصلاحيات" 
                    Value="EditorRoles.aspx" Visible="False">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="10pt" 
                    ForeColor="Green" ImageUrl="~/images/Permission.png" 
                    NavigateUrl="~/Privileges/EditorRoleDetails.aspx" Text="تفاصيل الصلاحيات" 
                    Value="EditorRoleDetails.aspx" Visible="False">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="10pt" 
                    ForeColor="Green" ImageUrl="~/images/Permission.png" 
                    NavigateUrl="~/Privileges/EditorUsersRoles.aspx" Text="صلاحيات المستخدمين" 
                    Value="EditorUsersRoles.aspx" Visible="False">
                </telerik:RadPanelItem>
            </Items>
        </telerik:RadPanelItem>
    </Items>
<ExpandAnimation Type="InElastic" Duration="500"></ExpandAnimation>

<CollapseAnimation Type="OutBounce" Duration="500"></CollapseAnimation>
</telerik:RadPanelBar>
            </td>
        </tr>
    </table>

</div>