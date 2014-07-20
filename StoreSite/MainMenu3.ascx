<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MainMenu3.ascx.cs" Inherits="MainMenu3" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

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
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Code/CdStore.aspx">اكواد  مخازن الشركة</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image2" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Code/CdPaid.aspx">اكواد طرق الدفع</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image3" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink3" runat="server" 
                NavigateUrl="~/Code/CdWaredType.aspx">اكواد نوع اذن الاضافة</asp:HyperLink>
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
            <asp:Image ID="Image51" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink51" runat="server" NavigateUrl="~/Code/CdYear.aspx">اكواد العام المالي</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image52" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink52" runat="server" 
                NavigateUrl="~/Code/CdAccountNature.aspx">طبيعه الحسابات</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image53" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink53" runat="server" 
                NavigateUrl="~/Code/CdAccountRasid.aspx">طبيعة الرصيد</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image54" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink54" runat="server" 
                NavigateUrl="~/Code/CDCloseAccount.aspx">حسابات الاغلاق</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td colspan="2" style="text-align: center">
            <asp:Image ID="Image55" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink55" runat="server" 
                NavigateUrl="~/Code/CdEdaaType.aspx">انواع الايداعات</asp:HyperLink>
        </td>
        <td colspan="2" style="text-align: center">
            <asp:Image ID="Image56" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink56" runat="server" 
                NavigateUrl="~/Code/CDBank.aspx">حسابات البنوك</asp:HyperLink>
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
                NavigateUrl="~/Code/CdHeadCompany.aspx">بيانات مراكز الخدمة</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image10" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink10" runat="server" 
                NavigateUrl="~/Code/CdCallDir.aspx">نوع الاتصال</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image11" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink11" runat="server" 
                NavigateUrl="~/Code/CdCommWay.aspx">طرق الابلاغ</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image12" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink12" runat="server" 
                NavigateUrl="~/Code/CdServiceType.aspx">اكواد الخدمات</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td style="text-align: center" colspan="4">
            <asp:Image ID="Image13" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink13" runat="server" 
                NavigateUrl="~/Code/CdTransferType.aspx">اكواد تحويل المهام</asp:HyperLink>
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
            <asp:HyperLink ID="HyperLink14" runat="server" NavigateUrl="~/Code/CdGov.aspx">اكواد المحافظات</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image15" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink15" runat="server" 
                NavigateUrl="~/Code/CdMarakez.aspx">اكواد المراكز</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image16" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink16" runat="server" NavigateUrl="~/Code/CdHay.aspx">طرق الابلاغ</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image17" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink17" runat="server" 
                NavigateUrl="~/Code/CdServiceType.aspx">اكواد الاحياء</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:Image ID="Image18" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink18" runat="server" 
                NavigateUrl="~/Code/CdEdara.aspx">بيانات مراكز الخدمة</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image19" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink19" runat="server" 
                NavigateUrl="~/Code/CdHeadCompany.aspx">ادارات الشركة</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image20" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink20" runat="server" 
                NavigateUrl="~/Code/CdDepartment.aspx">اقسام الشركة</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image21" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink21" runat="server" NavigateUrl="~/Code/CdQual.aspx">اكواد المؤهلات</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:Image ID="Image22" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink22" runat="server" 
                NavigateUrl="~/Code/CdQualTakasos.aspx">اكواد تخصص المؤهلات</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image23" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink23" runat="server" 
                NavigateUrl="~/Code/CdQualTakder.aspx">اكواد تقدير المؤهلات</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image24" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink24" runat="server" NavigateUrl="~/Code/CdJob.aspx">اكواد الوظائف</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image25" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink25" runat="server" 
                NavigateUrl="~/Code/CdJobDesc.aspx">اكواد التوصيف الوظيفي</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:Image ID="Image26" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink26" runat="server" 
                NavigateUrl="~/Code/CdSalaryType.aspx">طرق حساب الراتب</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image27" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink27" runat="server" 
                NavigateUrl="~/Code/CdHarakaType.aspx">انواع حركة الباركو</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image28" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink28" runat="server" 
                NavigateUrl="~/Code/CdShift.aspx">اكواد فترات الحضور</asp:HyperLink>
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
            <asp:HyperLink ID="HyperLink29" runat="server" NavigateUrl="~/Code/CdGov.aspx">بيانات الشركة</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image30" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink30" runat="server" 
                NavigateUrl="~/Code/CdBranches.aspx">فروع الشركة</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image31" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink31" runat="server" 
                NavigateUrl="~/Input/EditorCustomer.aspx">بيانات العملاء</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image32" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink32" runat="server" 
                NavigateUrl="~/Input/EditorSupplier.aspx">بيانات الموردين</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:Image ID="Image33" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink33" runat="server" 
                NavigateUrl="~/Input/CatCreator.aspx">اكواد الاصناف</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image34" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink34" runat="server" 
                NavigateUrl="~/Input/EditorMaterial.aspx">بيانات الاصناف</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image35" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink35" runat="server" 
                NavigateUrl="~/Input/EditorPricingpolicy.aspx">التسعير</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image36" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink36" runat="server" 
                NavigateUrl="~/Input/EditorWared.aspx">ادخال الواردات</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:Image ID="Image37" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink37" runat="server" 
                NavigateUrl="~/Input/EditorSerial.aspx">ادخال السريال</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image38" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink38" runat="server" 
                NavigateUrl="~/Input/EditorBill.aspx">المبيعات</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image39" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink39" runat="server" 
                NavigateUrl="~/Input/EditorBillSerial.aspx">صرف البضاعة باركود</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <br />
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
            <asp:Image ID="Image72" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink72" runat="server" 
                NavigateUrl="~/Input/EditorOptions.aspx">خيارات شجرة الحسابات</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image73" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink73" runat="server" 
                NavigateUrl="~/Input/AccTreeBuilder.aspx">شجرة الحسابات</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image74" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink74" runat="server" 
                NavigateUrl="~/Input/EditorDailyConstraints.aspx">القيود اليوميه</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image75" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink75" runat="server" 
                NavigateUrl="~/Input/EditorCheck.aspx">ترقيم الشيكات</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            &nbsp;</td>
        <td style="text-align: center">
            <asp:Image ID="Image76" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink76" runat="server" 
                NavigateUrl="~/Input/EditorBankSarf.aspx">حركة البنك صرف</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image77" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink77" runat="server" 
                NavigateUrl="~/Input/EditorAlkazna.aspx">الخزينه</asp:HyperLink>
        </td>
        <td style="text-align: center">
            &nbsp;</td>
    </tr>
</table>


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
                NavigateUrl="~/Input/OrderAdd.aspx">بلاغات الاعطال</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image44" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink44" runat="server" 
                NavigateUrl="~/Input/EditorTaskOrder.aspx">توزيع المهام</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            &nbsp;</td>
        <td style="text-align: center">
            &nbsp;</td>
    </tr>
</table>


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
                NavigateUrl="~/Input/FullTblEmp.aspx">بيانات العاملين</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image46" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink46" runat="server" 
                NavigateUrl="~/Input/EditorUserAtt.aspx">الاوقات المقررة للحضور</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image47" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink47" runat="server" 
                NavigateUrl="~/Input/UserAttBarcode.aspx">تسجل الحضور بالباركود</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image48" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink48" runat="server" 
                NavigateUrl="~/Input/UserAttNoBarcode.aspx">تسجيل الحضور يدويا</asp:HyperLink>
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


<table width ="353px" >
    <tr>
        <td style="text-align: center">
            &nbsp;</td>
        <td style="text-align: center">
            &nbsp;</td>
    </tr>
    <tr>
        <td style="text-align: center">
            <asp:Image ID="Image49" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink49" runat="server" 
                NavigateUrl="~/Query/CommunicationGrid.aspx">الاتصالات</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image50" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink50" runat="server" 
                NavigateUrl="~/Query/QryWared.aspx">التوريدات</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            &nbsp;</td>
        <td style="text-align: center">
            &nbsp;</td>
    </tr>
</table>





<p>
    &nbsp;</p>
<p>
    &nbsp;</p>


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
            <asp:Image ID="Image66" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink66" runat="server" 
                NavigateUrl="~/Input/EditorOptions.aspx">خيارات شجرة الحسابات</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image67" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink67" runat="server" 
                NavigateUrl="~/Input/AccTreeBuilder.aspx">شجرة الحسابات</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image68" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink68" runat="server" 
                NavigateUrl="~/Input/EditorDailyConstraints.aspx">القيود اليوميه</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image69" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink69" runat="server" 
                NavigateUrl="~/Input/EditorCheck.aspx">ترقيم الشيكات</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
                                            &nbsp;</td>
        <td style="text-align: center">
            <asp:Image ID="Image70" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink70" runat="server" 
                NavigateUrl="~/Input/EditorBankSarf.aspx">حركة البنك صرف</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image71" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink71" runat="server" 
                NavigateUrl="~/Input/EditorAlkazna.aspx">الخزينه</asp:HyperLink>
        </td>
        <td style="text-align: center">
            &nbsp;</td>
    </tr>
</table>

<p>
    &nbsp;</p>
            


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
                NavigateUrl="~/Input/EditorOptions.aspx">خيارات شجرة الحسابات</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image6" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink6" runat="server" 
                NavigateUrl="~/Input/EditorDailyConstraints.aspx">القيود اليوميه</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image7" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink7" runat="server" 
                NavigateUrl="~/Input/EditorCheck.aspx">ترقيم الشيكات</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td style="text-align: center">
            &nbsp;</td>
        <td style="text-align: center">
            <asp:Image ID="Image8" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink8" runat="server" 
                NavigateUrl="~/Input/EditorBankSarf.aspx">حركة البنك صرف</asp:HyperLink>
        </td>
        <td style="text-align: center">
            <asp:Image ID="Image40" runat="server" Height="50px" 
                ImageUrl="~/images/CodesImg.png" Width="50px" />
            <br />
            <asp:HyperLink ID="HyperLink40" runat="server" 
                NavigateUrl="~/Input/EditorAlkazna.aspx">الخزينه</asp:HyperLink>
        </td>
        <td style="text-align: center">
            &nbsp;</td>
    </tr>
</table>







