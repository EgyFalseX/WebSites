<%@ Page Title="" Language="C#" MasterPageFile="masters.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="centerEditor" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            height: 82px;
        }
        .style2
        {
            width: 72px;
            height: 64px;
        }
        .style3
        {
            height: 82px;
            width: 138px;
        }
        .style8
        {
            width: 138px;
            height: 39px;
        }
        .style9
        {
            height: 39px;
        }
        .style11
        {
            height: 43px;
        }
        .style19
    {
        height: 82px;
        width: 142px;
    }
    .style20
    {
        width: 142px;
        height: 39px;
    }
    .style21
    {
        width: 142px;
        height: 43px;
    }
    .style23
    {
        height: 82px;
        width: 127px;
    }
    .style24
    {
        width: 127px;
        height: 39px;
    }
    .style27
    {
        height: 28px;
        font-weight: 700;
        color: #000080;
    }
    .style28
    {
            width: 138px;
            height: 34px;
        }
    .style29
    {
        width: 127px;
        height: 34px;
    }
    .style30
    {
        width: 142px;
        height: 34px;
    }
    .style31
    {
        height: 34px;
    }
        .style35
        {
            height: 49px;
        }
        .style36
        {
            width: 127px;
            height: 49px;
        }
        .style37
        {
            width: 142px;
            height: 49px;
        }
        .style41
        {
            height: 43px;
            font-weight: bold;
        }
        .style42
        {
            height: 69px;
        }
        .style43
        {
            width: 127px;
            height: 69px;
        }
        .style44
        {
            width: 142px;
            height: 69px;
        }
        .style45
        {
            height: 44px;
        }
        .style46
        {
            width: 127px;
            height: 44px;
        }
        .style47
        {
            width: 142px;
            height: 44px;
        }
        .style49
        {
            width: 127px;
            height: 16px;
        }
        .style50
        {
            height: 16px;
        }
        .style51
        {
            width: 142px;
            height: 16px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <body>

<table align="center" style="width: 703px; height: 754px;">
    <tr>
        <td class="style27" align="center" bgcolor="#CCCCFF" colspan="5">
            التعريفات الأساسية</td>
    </tr>
    <tr>
        <td class="style3" align="center">
            <img alt="" class="style2" src="images/class.png" align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink6" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="faslEditor.aspx" Text="الفصول" 
                style="text-align: right" />
        </td>
        <td class="style23" align="center">
            <img alt="" class="style2" src="images/grade.png" align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink5" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="safEditor.aspx" Text="الصفوف الدراسية" 
                style="text-align: right" />
        </td>
        <td class="style19" align="center">
            <img alt="" class="style2" src="images/school.png" align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink4" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="schoolEditor.aspx" Text="المدارس" 
                style="text-align: right" />
        </td>
        <td class="style3" align="center">
            <img alt="" class="style2" src="images/year.png" align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink3" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="yearEditor.aspx" Text="العام الدراسي" 
                style="text-align: right" />
        </td>
        <td align="center" class="style1">
            <img alt="" class="style2" src="images/users.png" align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink2" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="UserEditor.aspx" Text="محرر المستخدمين" 
                style="text-align: right" />
        </td>
    </tr>
    <tr>
        <td class="style28" align="center">
            <img alt="" class="style2" 
                src="images/excel-process-management-and-consulting.png" align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink11" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="asaleepEditor.aspx" Text="الاساليب الإشرافية" 
                style="text-align: right" />
        </td>
        <td class="style29" align="center">
            <img alt="" class="style2" src="images/Categories.png" align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink9" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="takasosEditor.aspx" Text="التخصصات" 
                style="text-align: right" />
        </td>
        <td class="style30" align="center">
            <img alt="" class="style2" src="images/fast-icon1.png" align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink8" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="hesaEditor.aspx" Text="الحصص الدراسية" 
                style="text-align: right" />
        </td>
        <td class="style28" align="center">
            <img alt="" class="style2" src="images/books-icon-512.png" align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink7" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="madaEditor.aspx" Text="المواد الدراسية" 
                style="text-align: right" />
        </td>
        <td align="center" class="style31">
            <img alt="" class="style2" src="images/marketing-icon.png" align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink10" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="ehteagatEditor.aspx" Text="الاحتياجات التدريبية" 
                style="text-align: right" />
        </td>
    </tr>
    <tr>
        <td class="style8" align="center">
            </td>
        <td class="style24" align="center">
            </td>
        <td class="style20" align="center">
            <br />
            </td>
        <td class="style8" align="center">
            <img alt="" class="style2" src="images/about-icon.png" 
                align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink18" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="cdrobrexelementEditor.aspx" Text="معايير التقييم" 
                style="text-align: right" />
        </td>
        <td align="center" class="style9">
            <img alt="" class="style2" src="images/Classroom%20Learning%20Icon.png" 
                align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink12" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="cdtrainingEditor.aspx" Text="الدورات التدريبية" 
                style="text-align: right" />
        </td>
    </tr>
    <tr>
        <td class="style27" align="center" bgcolor="#CCCCFF" colspan="5">
            إدخال البيانات الخاصة بالعاملين وكذلك الإحتياجات التدريبية والأساليب مع طباعة 
            التقارير الخاصة بذلك<br />
        </td>
    </tr>
    <tr>
        <td class="style45" align="center">
            <br />
        </td>
        <td class="style46" align="center">
            <br />
        </td>
        <td class="style47" align="center">
            <img alt="" class="style2" src="images/services.png" 
                align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink25" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="XRepViewer05.aspx" Text="تقرير الخطة التدريبية" 
                style="text-align: right" />
        </td>
        <td class="style45" align="center">
            <img alt="" class="style2" src="images/services_cultural_change_and_training_services_icon_gray.png" 
                align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink24" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="tbltrplanEditor.aspx" Text="الخطة التدريبية" 
                style="text-align: right" />
        </td>
        <td align="center" class="style45">
            <img alt="" class="style2" src="images/teacher.png" 
                align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink13" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="tblempdataEditor.aspx" Text="بيانات العاملين" 
                style="text-align: right" />
        </td>
    </tr>
    <tr>
        <td class="style35" align="center">
            <img alt="" class="style2" src="images/ico-doc.png" 
                align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink23" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="XRepViewer04B.aspx" Text="طباعة خطة مدرسة" 
                style="text-align: right" />
            </td>
        <td class="style36" align="center">
            <img alt="" class="style2" src="images/planning2.png" 
                align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink22" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="XRepViewer04A.aspx" Text="طباعة خطة المشرف" 
                style="text-align: right" />
            </td>
        <td class="style37" align="center">
            <img alt="" class="style2" src="images/PDCA.png" 
                align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink16" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="tblplanEditor.aspx" Text="خطة المتابعة" 
                style="text-align: right" />
            </td>
        <td class="style35" align="center">
            <img alt="" class="style2" src="images/services.png" 
                align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink15" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="XRepViewer02.aspx" Text="طباعة تقرير الاحتياجات" 
                style="text-align: right" />
        </td>
        <td align="center" class="style35">
            <img alt="" class="style2" src="images/iab-job-task.png" 
                align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink14" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="tblehteagatEditor.aspx" Text="استمارة الاحتياجات" 
                style="text-align: right" />
        </td>
    </tr>
    <tr>
        <td class="style27" align="center" bgcolor="#CCCCFF" colspan="5">
            قسم مخصص لزيارات المتابعة واللقاءات الميدانية</td>
    </tr>
    <tr>
        <td class="style42" align="center">
            <br />
            </td>
        <td class="style43" align="center">
            <img alt="" class="style2" src="images/Teacher-512.png" 
                align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink17" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="TblformlessonEditor.aspx" Text="درس تطبيقي" 
                style="text-align: right" />
            </td>
        <td class="style44" align="center">
            <img alt="" class="style2" src="images/meeting.png" 
                align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink21" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="tblmeetingtrainEditor.aspx" Text="اللقاءات التربوية" 
                style="text-align: right" />
            </td>
        <td class="style42" align="center">
            <img alt="" class="style2" src="images/128_Student-1.png" 
                align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink20" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="tbladdformEdit.aspx" Text="تعديل استمارة زيارة" 
                style="text-align: right" />
        </td>
        <td align="center" class="style42">
            <img alt="" class="style2" src="images/2upwqpk.png" 
                align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink19" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="tbladdformNew.aspx" Text="تسجيل زيارة معلم" 
                style="text-align: right" />
        </td>
    </tr>
    <tr>
        <td class="style45" align="center">
            </td>
        <td class="style46" align="center">
            <img alt="" class="style2" src="images/services.png" 
                align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink32" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="XRepViewer09.aspx" Text="تقرير التوصيات" 
                style="text-align: right" />
        </td>
        <td class="style47" align="center">
            <img alt="" class="style2" src="images/approved-clipboard-icon-512.png" 
                align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink31" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="tblteachershodorEditor.aspx" Text="التوصيات الختامية" 
                style="text-align: right" />
        </td>
        <td class="style45" align="center">
            <img alt="" class="style2" src="images/meeting11.png" 
                align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink27" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="XRepViewer06.aspx" Text="تقرير اجتماع مادة" 
                style="text-align: right" />
        </td>
        <td align="center" class="style45">
            <img alt="" class="style2" src="images/meeting11.png" 
                align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink26" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="tblteachersmeetingEditor.aspx" Text="اجتماع معلمى المادة" 
                style="text-align: right" />
        </td>
    </tr>
    <tr>
        <td class="style27" align="center" bgcolor="#CCCCFF" colspan="5">
            التقييم السنوي للمعلمين</td>
    </tr>
    <tr>
        <td class="style50" align="center">
            </td>
        <td class="style49" align="center">
            </td>
        <td class="style51" align="center">
            <img alt="" class="style2" src="images/ico-doc.png" 
                align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink35" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="XRepViewer10.aspx" Text="التقرير السنوي" 
                style="text-align: right" />
        </td>
        <td class="style50" align="center">
            <img alt="" class="style2" src="images/Leader-512.png" 
                align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink34" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="tblteacheradaaall_mEditor.aspx" Text="استمارة المشرف" 
                style="text-align: right" />
        </td>
        <td align="center" class="style50">
            <img alt="" class="style2" src="images/Supervisor.png" 
                align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink33" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="tblteacheradaaallEditor.aspx" Text="استمارة المدير" 
                style="text-align: right" />
        </td>
    </tr>
    <tr>
        <td class="style27" align="center" bgcolor="#CCCCFF" colspan="5">
            قسم مخصص للمهام الخاصة التي يقوم بها المشرف على مدار الأسبوع أو خلال فترة محددة 
            وكذلك أي تكليفات إضافية </td>
    </tr>
    <tr>
        <td class="style41" align="center">
            </td>
        <td class="style41" align="center">
            <br />
        </td>
        <td class="style21" align="center">
            <img alt="" class="style2" src="images/services.png" 
                align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink30" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="XRepViewer07.aspx" Text="تقرير المهام" 
                style="text-align: right" />
            </td>
        <td class="style11" align="center">
            <img alt="" class="style2" src="images/planning2.png" 
                align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink29" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="tblweklytasksEditor.aspx" Text="المهام الإضافية" 
                style="text-align: right" />
            </td>
        <td align="center" class="style11">
            <img alt="" class="style2" src="images/planning2.png" 
                align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink28" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="tblweeklyplanEditor.aspx" Text="مهام المشرفين" 
                style="text-align: right" />
            </td>
    </tr>
    </table>
    



    

</asp:Content>

