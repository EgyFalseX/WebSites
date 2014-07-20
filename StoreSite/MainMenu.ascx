<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MainMenu.ascx.cs" Inherits="MainMenu" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<style type="text/css">
    .style1
    {
        width: 100px;
    }
    .style3
    {
        width: 181px;
    }
</style>
<telerik:RadScriptManager ID="RadScriptManager1" Runat="server">
</telerik:RadScriptManager>
<div>
    <table align="center" class="style1">
        <tr>
            <td>
<telerik:RadPanelBar ID="RadPanelBar1" Runat="server" Skin="Web20" 
    style="text-align: center" ExpandMode="SingleExpandedItem" Font-Bold="False" 
                    AllowCollapseAllItems="True" ToolTip="E-E-Soft" 
                    Width="550px" ForeColor="Black">
    <Items>
        <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
            Owner="RadPanelBar1" Text="اكواد" Font-Bold="False" Font-Italic="False" 
            Font-Overline="False" Font-Strikeout="False" 
            Font-Underline="False" ForeColor="Blue" ImagePosition="Right" Value="A">
            <Items>
                <telerik:RadPanelItem Text="المخازن" ImageUrl="~/images/CodesImg.png" Value="1">
                    <Items>
                        <telerik:RadPanelItem>
                            <ItemTemplate>
                                <table width ="353px" >
                                    <tr>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image1" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Code/CdStore.aspx" 
                                                ForeColor="Blue">اكواد  مخازن الشركة</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image2" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Code/CdPaid.aspx" 
                                                ForeColor="Blue">اكواد طرق الدفع</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image3" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink3" runat="server" 
                                                NavigateUrl="~/Code/CdWaredType.aspx" ForeColor="Blue">اكواد نوع اذن الاضافة</asp:HyperLink>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelItem>
                <telerik:RadPanelItem Text="الحسابات" ImageUrl="~/images/CodesImg.png" 
                    Value="2">
                    <Items>
                        <telerik:RadPanelItem>
                            <ItemTemplate>
                                <table style="width: 450px">
                                    <tr>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image4" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Code/CdYear.aspx" 
                                                ForeColor="Blue">اكواد العام المالي</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image6" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink6" runat="server" 
                                                NavigateUrl="~/Code/CdAccountNature.aspx" ForeColor="Blue">طبيعه الحسابات</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image7" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink7" runat="server" 
                                                NavigateUrl="~/Code/CdAccountRasid.aspx" ForeColor="Blue">طبيعة الرصيد</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image5" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink5" runat="server" 
                                                NavigateUrl="~/Code/AccTreeBuilder.aspx" ForeColor="Blue">شجرة الحسابات</asp:HyperLink>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="text-align: center">
                                            <asp:Image ID="Image40" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink40" runat="server" 
                                                NavigateUrl="~/Code/CdEdaaType.aspx" ForeColor="Blue">انواع الايداعات</asp:HyperLink>
                                        </td>
                                        <td colspan="2" style="text-align: center">
                                            <asp:Image ID="Image41" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink41" runat="server" 
                                                NavigateUrl="~/Code/CDBank.aspx" ForeColor="Blue">حسابات البنوك</asp:HyperLink>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelItem>
                <telerik:RadPanelItem Text="مركز الخدمة" ImageUrl="~/images/CodesImg.png" 
                    Value="3">
                    <Items>
                        <telerik:RadPanelItem>
                            <ItemTemplate>
                                <table style="width: 450px" >
                                    <tr>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image9" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink9" runat="server" 
                                                NavigateUrl="~/Code/CdHeadCompany.aspx" ForeColor="Blue">بيانات مراكز الخدمة</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image10" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink10" runat="server" 
                                                NavigateUrl="~/Code/CdCallDir.aspx" ForeColor="Blue">نوع الاتصال</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image11" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink11" runat="server" 
                                                NavigateUrl="~/Code/CdCommWay.aspx" ForeColor="Blue">طرق الابلاغ</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image12" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink12" runat="server" 
                                                NavigateUrl="~/Code/CdServiceType.aspx" ForeColor="Blue">اكواد الخدمات</asp:HyperLink>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center" colspan="4">
                                            <asp:Image ID="Image13" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink13" runat="server" 
                                                NavigateUrl="~/Code/CdTransferType.aspx" ForeColor="Blue">اكواد تحويل المهام</asp:HyperLink>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelItem>
                <telerik:RadPanelItem Text="اكواد عامة" ImageUrl="~/images/CodesImg.png" 
                    Value="4">
                    <Items>
                        <telerik:RadPanelItem>
                            <ItemTemplate>
                                <table style="width: 450px" >
                                    <tr>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image14" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink14" runat="server" NavigateUrl="~/Code/CdGov.aspx" 
                                                ForeColor="Blue">اكواد المحافظات</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image15" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink15" runat="server" 
                                                NavigateUrl="~/Code/CdMarakez.aspx" ForeColor="Blue">اكواد المراكز</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image17" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink17" runat="server" ForeColor="Blue" 
                                                NavigateUrl="~/Code/CdHay.aspx">اكواد الاحياء</asp:HyperLink>
                                            <br />
                                        </td>
                                        <td style="text-align: center">
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image18" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink18" runat="server" 
                                                NavigateUrl="~/Code/CdHeadCompany.aspx" ForeColor="Blue">بيانات مراكز الخدمة</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image19" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink19" runat="server" 
                                                NavigateUrl="~/Code/CdEdara.aspx" ForeColor="Blue">ادارات الشركة</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image20" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink20" runat="server" 
                                                NavigateUrl="~/Code/CdDepartment.aspx" ForeColor="Blue">اقسام الشركة</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image21" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink21" runat="server" NavigateUrl="~/Code/CdQual.aspx" 
                                                ForeColor="Blue">اكواد المؤهلات</asp:HyperLink>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image22" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink22" runat="server" 
                                                NavigateUrl="~/Code/CdQualTakasos.aspx" ForeColor="Blue">اكواد تخصص المؤهلات</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image23" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink23" runat="server" 
                                                NavigateUrl="~/Code/CdQualTakder.aspx" ForeColor="Blue">اكواد تقدير المؤهلات</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image24" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink24" runat="server" NavigateUrl="~/Code/CdJob.aspx" 
                                                ForeColor="Blue">اكواد الوظائف</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image25" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink25" runat="server" 
                                                NavigateUrl="~/Code/CdJobDesc.aspx" ForeColor="Blue">اكواد التوصيف الوظيفي</asp:HyperLink>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image26" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink26" runat="server" 
                                                NavigateUrl="~/Code/CdSalaryType.aspx" ForeColor="Blue">طرق حساب الراتب</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image27" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink27" runat="server" 
                                                NavigateUrl="~/Code/CdHarakaType.aspx" ForeColor="Blue">انواع حركة الباركو</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image28" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink28" runat="server" 
                                                NavigateUrl="~/Code/CdShift.aspx" ForeColor="Blue">اكواد فترات الحضور</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelItem>
            </Items>
        </telerik:RadPanelItem>
        <telerik:RadPanelItem runat="server" Text="ادخال بيانات" 
            ImageUrl="~/images/InputImg.png" Font-Bold="False" 
            ForeColor="Blue" ImagePosition="Right" Value="B">
            <Items>
                <telerik:RadPanelItem Text="المخازن" ImageUrl="~/images/InputImg.png" Value="5">
                    <Items>
                        <telerik:RadPanelItem>
                            <ItemTemplate>
                                <table style="width: 450px" >
                                    <tr>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image29" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink29" runat="server" NavigateUrl="~/Input/Basic.aspx" 
                                                ForeColor="Blue">بيانات الشركة</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image30" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink30" runat="server" 
                                                NavigateUrl="~/Code/CdBranches.aspx" ForeColor="Blue">فروع الشركة</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image31" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink31" runat="server" 
                                                NavigateUrl="~/Input/EditorCustomer.aspx" ForeColor="Blue">بيانات العملاء</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image32" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink32" runat="server" 
                                                NavigateUrl="~/Input/EditorSupplier.aspx" ForeColor="Blue">بيانات الموردين</asp:HyperLink>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image33" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink33" runat="server" 
                                                NavigateUrl="~/Input/CatCreator.aspx" ForeColor="Blue">اكواد الاصناف</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image34" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink34" runat="server" 
                                                NavigateUrl="~/Input/EditorMaterial.aspx" ForeColor="Blue">بيانات الاصناف</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image35" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink35" runat="server" 
                                                NavigateUrl="~/Input/EditorPricingpolicy.aspx" ForeColor="Blue">التسعير</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image36" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink36" runat="server" 
                                                NavigateUrl="~/Input/EditorWared.aspx" ForeColor="Blue">ادخال الواردات</asp:HyperLink>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image37" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink37" runat="server" 
                                                NavigateUrl="~/Input/EditorSerial.aspx" ForeColor="Blue">ادخال السريال</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image38" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink38" runat="server" 
                                                NavigateUrl="~/Input/EditorBill.aspx" ForeColor="Blue">المبيعات</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image39" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink39" runat="server" 
                                                NavigateUrl="~/Input/EditorBillSerial.aspx" ForeColor="Blue">صرف البضاعة باركود</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image40" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink40" runat="server" ForeColor="Blue" 
                                                NavigateUrl="~/Input/EditorDiscard.aspx">مردود المبيعات</asp:HyperLink>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image44" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink44" runat="server" ForeColor="Blue" 
                                                NavigateUrl="~/Input/EditorContractSystemes.aspx">انظمة العقود</asp:HyperLink>
                                            <br />
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image43" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink43" runat="server" ForeColor="Blue" 
                                                NavigateUrl="~/Input/EditorContractes.aspx">عقود العملاء</asp:HyperLink>
                                            <br />
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image41" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink41" runat="server" ForeColor="Blue" 
                                                NavigateUrl="~/Input/EditorBillDiscard.aspx">مرتجعات الموردين</asp:HyperLink>
                                            <br />
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image42" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink42" runat="server" ForeColor="Blue" 
                                                NavigateUrl="~/Input/EditorCommercialCustomers.aspx">عملاء البيع التجاري</asp:HyperLink>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image49" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink49" runat="server" ForeColor="Blue" 
                                                NavigateUrl="~/Input/EditorPriceListDetails.aspx">الاقساط</asp:HyperLink>
                                            <br />
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image46" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink46" runat="server" ForeColor="Blue" 
                                                NavigateUrl="~/Input/EditorPriceListDetails.aspx">تفاصيل قوائم الاسعار</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image45" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink45" runat="server" ForeColor="Blue" 
                                                NavigateUrl="~/Input/EditorPricelists.aspx">قوائم الاسعار</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image48" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink48" runat="server" ForeColor="Blue" 
                                                NavigateUrl="~/Input/EditorContractItems.aspx">ماركات العقد</asp:HyperLink>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image50" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink50" runat="server" ForeColor="Blue" 
                                                NavigateUrl="~/Input/EditorCommercialBill.aspx">فواتير البيع التجاري</asp:HyperLink>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelItem>
                <telerik:RadPanelItem Text="الحسابات" ImageUrl="~/images/InputImg.png" 
                    Value="6">
                    <Items>
                        <telerik:RadPanelItem>
                            <ItemTemplate>
                                <table width="400px">
    <tr>
        <td style="text-align: center">
            &nbsp;</td>
        <td style="text-align: center">
            &nbsp;</td>
        <td style="text-align: center">
            &nbsp;</td>
        <td style="text-align: center">
            &nbsp;</td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:Image ID="Image4" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink4" runat="server" 
                NavigateUrl="~/Input/EditorOptions.aspx" ForeColor="Blue">خيارات شجرة الحسابات</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image6" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink6" runat="server" 
                NavigateUrl="~/Input/EditorDailyConstraints.aspx" ForeColor="Blue">القيود اليوميه</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image7" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink7" runat="server" 
                NavigateUrl="~/Input/EditorCheck.aspx" ForeColor="Blue">ترقيم الشيكات</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:Image ID="Image41" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink41" runat="server" ForeColor="Blue" 
                NavigateUrl="~/Input/EditorEdaa.aspx">حركة البنك ايداع</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image8" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink8" runat="server" 
                NavigateUrl="~/Input/EditorBankSarf.aspx" ForeColor="Blue">حركة البنك صرف</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image40" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink40" runat="server" 
                NavigateUrl="~/Input/EditorAlkazna.aspx" ForeColor="Blue">الخزينه</asp:HyperLink>
        </td>
        <td style="text-align: center">
            &nbsp;</td>
    </tr>
</table>
                            </ItemTemplate>
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/InputImg.png" 
                    Text="مركز الخدمة" Value="7">
                    <Items>
                        <telerik:RadPanelItem>
                            <ItemTemplate>
                                <table width ="353px" >
                                    <tr>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image43" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink43" runat="server" 
                                                NavigateUrl="~/Input/OrderAdd.aspx" ForeColor="Blue">بلاغات الاعطال</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image44" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink44" runat="server" 
                                                NavigateUrl="~/Input/EditorTaskOrder.aspx" ForeColor="Blue">توزيع المهام</asp:HyperLink>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/InputImg.png" 
                    Text="شئون العاملين" Value="8">
                    <Items>
                        <telerik:RadPanelItem>
                            <ItemTemplate>
                                <table style="width: 450px" >
                                    <tr>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image45" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink45" runat="server" 
                                                NavigateUrl="~/Input/FullTblEmp.aspx" ForeColor="Blue">بيانات العاملين</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image46" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink46" runat="server" 
                                                NavigateUrl="~/Input/EditorUserAtt.aspx" ForeColor="Blue">الاوقات المقررة للحضور</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image47" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink47" runat="server" 
                                                NavigateUrl="~/Input/UserAttBarcode.aspx" ForeColor="Blue">تسجل الحضور بالباركود</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image48" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink48" runat="server" 
                                                NavigateUrl="~/Input/UserAttNoBarcode.aspx" ForeColor="Blue">تسجيل الحضور يدويا</asp:HyperLink>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </telerik:RadPanelItem>
                    </Items>
                    
                </telerik:RadPanelItem>
            </Items>
        </telerik:RadPanelItem>
        <telerik:RadPanelItem runat="server" Text="استعلامات" 
            ImageUrl="~/images/QueryImg.png" Font-Bold="False" 
            ForeColor="Blue" ImagePosition="Right" Value="C">
            <Items>
            <telerik:RadPanelItem>
                            <ItemTemplate>
                                <table width ="353px" align="center" >
                                    <tr>
                                        <td style="text-align: center" class="style3">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center" class="style3">
                                            <asp:Image ID="Image49" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink49" runat="server" 
                                                NavigateUrl="~/Query/CommunicationGrid.aspx" ForeColor="Blue">الاتصالات</asp:HyperLink>
                                        </td>
                                        <td style="text-align: center">
                                            <asp:Image ID="Image50" runat="server" Height="50px" 
                                                ImageUrl="~/images/CodesImg.png" Width="50px" />
                                            <br />
                                            <asp:HyperLink ID="HyperLink50" runat="server" 
                                                NavigateUrl="~/Query/QryWared.aspx" ForeColor="Blue">التوريدات</asp:HyperLink>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: center" class="style3">
                                            &nbsp;</td>
                                        <td style="text-align: center">
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </telerik:RadPanelItem>
            </Items>
        </telerik:RadPanelItem>
        <telerik:RadPanelItem runat="server" ForeColor="Blue" ImagePosition="Right" 
            ImageUrl="~/images/QueryImg.png" NavigateUrl="~/Report/Reports.aspx" 
            Text="التقارير">
        </telerik:RadPanelItem>
    </Items>
<ExpandAnimation Type="Linear" Duration="500"></ExpandAnimation>

<CollapseAnimation Type="OutBounce" Duration="500"></CollapseAnimation>
</telerik:RadPanelBar>
            </td>
        </tr>
    </table>

</div>