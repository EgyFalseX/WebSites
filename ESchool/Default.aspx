<%@ Page Title="" Language="C#" MasterPageFile="~/ESchoolMP.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
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
            Font-Size="15pt">
            <Items>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    NavigateUrl="~/Codes/CDAlhasas.aspx" Text="اكواد اسماء الحصص" 
                    Value="CDAlhasas.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    NavigateUrl="~/Codes/CDAlhasas_time.aspx" Text="اكواد اوقات الحصص" 
                    Value="CDAlhasas_time.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    NavigateUrl="~/Codes/CDMarahel.aspx" Text="اكواد المراحل" 
                    Value="CDMarahel.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    NavigateUrl="~/Codes/CDAlokobat.aspx" Text="اكواد العقوبات" 
                    Value="CDAlokobat.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    NavigateUrl="~/Codes/CDAlsofof.aspx" Text="اكواد الصفوف" Value="CDAlsofof.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    NavigateUrl="~/Codes/CDColekeyat.aspx" Text="اكواد السلوكيات" 
                    Value="CDColekeyat.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    NavigateUrl="~/Codes/CDDayname.aspx" Text="اكواد الايام" Value="CDDayname.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    NavigateUrl="~/Codes/CDDyana.aspx" Text="اكواد الديانه" Value="CDDyana.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    NavigateUrl="~/Codes/CDEFasl.aspx" Text="اكواد الفصول" Value="CDEFasl.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    NavigateUrl="~/Codes/cdEyab_code.aspx" Text="اكواد الغياب" 
                    Value="cdEyab_code.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    NavigateUrl="~/Codes/CDGov.aspx" Text="اكواد المحافظه" Value="CDGov.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    NavigateUrl="~/Codes/CDHaletalked.aspx" Text="اكواد حالة القيد" 
                    Value="CDHaletalked.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    NavigateUrl="~/Codes/CDHealth_office.aspx" Text="اكواد مكاتب الصحه" 
                    Value="CDHealth_office.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    NavigateUrl="~/Codes/CDJop.aspx" Text="اكواد الوظائف" Value="CDJop.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    NavigateUrl="~/Codes/CDLogatcode.aspx" Text="اكواد اللغات" 
                    Value="CDLogatcode.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    NavigateUrl="~/Codes/CDFATRA.aspx" Text="اكواد فترة الدرجة" 
                    Value="CDFATRA.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    NavigateUrl="~/Codes/CDTakdeer.aspx" Text="اكواد التقديرات" 
                    Value="CDTakdeer.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    NavigateUrl="~/Codes/CDBank.aspx" Text="اكواد البنوك" Value="CDBank.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    NavigateUrl="~/Codes/CDBnod_alcrf.aspx" Text=" اكواد بنود الصرف" 
                    Value="CDBnod_alcrf.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    NavigateUrl="~/Codes/CDCourses.aspx" Text="اكواد الدورات التدريبية" 
                    Value="CDCourses.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    NavigateUrl="~/Codes/CDDEPT.aspx" Text="اكواد الاقسام" Value="CDDEPT.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    NavigateUrl="~/Codes/CDEdara.aspx" Text="اكواد الادارات المدرسية" 
                    Value="CDEdara.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    NavigateUrl="~/Codes/CDEDARET.aspx" Text="اكواد الادارات التعليمية" 
                    Value="CDEDARET.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    NavigateUrl="~/Codes/CDEltataem_code.aspx" Text="اكواد التطعيمات" 
                    Value="CDEltataem_code.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    NavigateUrl="~/Codes/CDFaslDrasy.aspx" Text="اكواد الفصل الدراسي" 
                    Value="CDFaslDrasy.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    NavigateUrl="~/Codes/CDGamaat_alnashat.aspx" Text="اكواد جماعات النشاط" 
                    Value="CDGamaat_alnashat.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/CodesImg.png" 
                    NavigateUrl="~/Codes/CDAgaza_Geha.aspx" Text="اكواد جهة الاجازة" 
                    Value="CDAgaza_Geha.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" NavigateUrl="~/Codes/CDEmpJop.aspx" 
                    Text="اكواد وظائف العاملين" Value="CDEmpJop.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" NavigateUrl="~/Codes/CDJob_Title.aspx" 
                    Text="اكواد الوصف الوظيفي" Value="CDJob_Title.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" NavigateUrl="~/Codes/CDMantaka.aspx" 
                    Text="اكواد المناطق والاحياء" Value="CDMantaka.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" NavigateUrl="~/Codes/CDMonth.aspx" 
                    Text="اكواد الشهور" Value="CDMonth.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" NavigateUrl="~/Codes/CDMarakez.aspx" 
                    Text="اكواد المراكز والاقسام" Value="CDMarakez.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" NavigateUrl="~/Codes/CDMawad.aspx" 
                    Text="اكواد المواد" Value="CDMawad.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" NavigateUrl="~/Codes/CDMawad_alsofof.aspx" 
                    Text="اكواد حصص المواد" Value="CDMawad_alsofof.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" NavigateUrl="~/Codes/CDTypeAldaragat.aspx" 
                    Text="اكواد نوع الدرجات" Value="CDTypeAldaragat.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" 
                    NavigateUrl="~/Codes/CDMawad_aldragat.aspx" Text="اكواد درجات المواد" 
                    Value="CDMawad_aldragat.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" NavigateUrl="~/Codes/CDJOBCases.aspx" 
                    Text="اكواد الحالات الوظيفية" Value="CDJOBCases.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" NavigateUrl="~/Codes/CDJobDegree.aspx" 
                    Text="اكواد الدرجات الوظيفية " Value="CDJobDegree.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" NavigateUrl="~/Codes/CDnationalty.aspx" 
                    Text="اكواد الجنسيات" Value="CDnationalty.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" NavigateUrl="~/Codes/CDPlaceTraining.aspx" 
                    Text="اكواد جهات الدورات التدريبية" Value="CDPlaceTraining.aspx">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" NavigateUrl="~/Codes/CDQualification.aspx" 
                    Text="اكواد المؤهلات" Value="CDQualification.aspx">
                </telerik:RadPanelItem>
            </Items>
        </telerik:RadPanelItem>
        <telerik:RadPanelItem runat="server" Text="ادخال بيانات" 
            ImageUrl="~/images/InputsImg.png" Font-Bold="False" 
            ForeColor="Blue" ImagePosition="Right" Font-Size="15pt" 
            Owner="RadPanelBarMain">
            <Items>
                <telerik:RadPanelItem runat="server" ImageUrl="~/images/InputsImg.png" 
                    NavigateUrl="~/Input/TBLAsase.aspx" Text="العام الدراسي" Value="TBLAsase.aspx">
                </telerik:RadPanelItem>
            </Items>
        </telerik:RadPanelItem>
        <telerik:RadPanelItem runat="server" Text="استعلامات" 
            ImageUrl="~/images/QueriesImg.png" Font-Bold="False" 
            ForeColor="Blue" ImagePosition="Right" Font-Size="15pt" 
            Font-Strikeout="False" Owner="RadPanelBarMain">
        </telerik:RadPanelItem>
        <telerik:RadPanelItem runat="server" Font-Bold="False" Font-Size="15pt" 
            ForeColor="Green" ImagePosition="Right" ImageUrl="~/images/QueriesImg.png" 
            NavigateUrl="~/Report/Reports.aspx" Text="التقـــــارير" Value="Reports.aspx" 
            Owner="RadPanelBarMain">
        </telerik:RadPanelItem>
        <telerik:RadPanelItem runat="server" Font-Bold="False" Font-Size="15pt" 
            ForeColor="Blue" ImagePosition="Right" ImageUrl="~/images/PermissionsImg.png" 
            Text="الصلاحيــــــــــــات">
            <Items>
                <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="10pt" 
                    ForeColor="Green" ImageUrl="~/images/PermissionsImg.png" 
                    NavigateUrl="~/Privileges/EditorUsers.aspx" Text="المستخدمين" 
                    Value="EditorUsers.aspx" Visible="False">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="10pt" 
                    ForeColor="Green" ImageUrl="~/images/PermissionsImg.png" 
                    NavigateUrl="~/Privileges/EditorRoles.aspx" Text="الصلاحيات" 
                    Value="EditorRoles.aspx" Visible="False">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="10pt" 
                    ForeColor="Green" ImageUrl="~/images/PermissionsImg.png" 
                    NavigateUrl="~/Privileges/EditorRoleDetails.aspx" Text="تفاصيل الصلاحيات" 
                    Value="EditorRoleDetails.aspx" Visible="False">
                </telerik:RadPanelItem>
                <telerik:RadPanelItem runat="server" Font-Bold="True" Font-Size="10pt" 
                    ForeColor="Green" ImageUrl="~/images/PermissionsImg.png" 
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
</asp:Content>

