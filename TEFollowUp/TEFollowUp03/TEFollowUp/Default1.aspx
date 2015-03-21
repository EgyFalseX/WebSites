<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="Default1.aspx.cs" Inherits="Default1" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxNavBar" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1
        {
            width: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <table align="center" class="auto-style1">
        <tr>
            <td>
    <dx:ASPxNavBar ID="ASPxNavBarMain" runat="server" Font-Bold="True" Font-Size="10pt" LoadingPanelText="جاري التحميل&amp;hellip;" RightToLeft="True" Width="325px" Theme="PlasticBlue" style="margin-right: 0px">
        <Groups>
            <dx:NavBarGroup Text="المستخدمين" Name="groupUser">
                <HeaderImage Url="images/userGroup.png">
                </HeaderImage>
            </dx:NavBarGroup>
            <dx:NavBarGroup Text="المدير" Name="groupAdmin">
                <HeaderImage Url="images/adminGroup.png">
                </HeaderImage>
                <Items>
                    <dx:NavBarItem NavigateUrl="UserEditor.aspx" Text="محرر المستخدمين">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="yearEditor.aspx" Text="العام الدراسي">
                    </dx:NavBarItem>
<dx:NavBarItem NavigateUrl="schoolEditor.aspx" Text="المدارس">
                    </dx:NavBarItem>
<dx:NavBarItem NavigateUrl="safEditor.aspx" Text="الصفوف">
                    </dx:NavBarItem>
<dx:NavBarItem NavigateUrl="faslEditor.aspx" Text="الفصول">
                    </dx:NavBarItem>
<dx:NavBarItem NavigateUrl="madaEditor.aspx" Text="المواد">
                    </dx:NavBarItem>
<dx:NavBarItem NavigateUrl="hesaEditor.aspx" Text="الحصص">
                    </dx:NavBarItem>
<dx:NavBarItem NavigateUrl="takasosEditor.aspx" Text="التخصص">
                    </dx:NavBarItem>
<dx:NavBarItem NavigateUrl="ehteagatEditor.aspx" Text="اكواد الاحتياجات">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="asaleepEditor.aspx" Text="اكواد الاساليب">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="cdtrainingEditor.aspx" Text="الدورات">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="tblempdataEditor.aspx" Text="بيانات العاملين">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="tblehteagatEditor.aspx" Text="الاحتياجات الفنية">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="XRepViewer02.aspx" Text="تقرير الاحتياجات">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="tblplanEditor.aspx" Text="خطة المتابعة">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="TblformlessonEditor.aspx" Text="متابعة درس">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="cdrobrexelementEditor.aspx" Text="معايير التقيم">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="tbladdformNew.aspx" Text="اضافة استمارة اداء المعلم">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="tbladdformEdit.aspx" Text="تعديل استمارة اداء المعلم">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="tblmeetingtrainEditor.aspx" Text="اللقاءات والدورات">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="XRepViewer04A.aspx" Text="خطة المشرف">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="XRepViewer04B.aspx" Text="خطة المدرسة">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="tbltrplanEditor.aspx" Text="الخطة التدريبية">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="cdtblhedeEditor.aspx" Text="معلومات عامة">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="XRepViewer05.aspx" Text="الخطة التدريبية">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="tblteachersmeetingEditor.aspx" Text="اجتماع معلمي المادة">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="XRepViewer06.aspx" Text="تقرير اجتماع مادة">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="tblweeklyplanEditor.aspx" Text="المهام الأسبوعية">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="tblweklytasksEditor.aspx" Text="المهام الاضافية">
                    </dx:NavBarItem>
					<dx:NavBarItem NavigateUrl="XRepViewer07.aspx" Text="المهام الاسبوعية للمشرف">
                    </dx:NavBarItem>
					<dx:NavBarItem NavigateUrl="XRepViewer08.aspx" Text="بطاقة تشخيص أداء معلم">
                    </dx:NavBarItem>
					<dx:NavBarItem NavigateUrl="tblteachershodorEditor.aspx" Text="التوصيات الختامية">
                    </dx:NavBarItem>
					<dx:NavBarItem NavigateUrl="XRepViewer09.aspx" Text="تقرير التوصيات الختامية">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="tblteacheradaaallEditor.aspx" Text="تقييم المعلم السنوي(مدير)">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="tblteacheradaaall_mEditor.aspx" Text="تقييم المعلم السنوي(مشرف)">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="XRepViewer10.aspx" Text="درجات  التقييم الختامي">
                    </dx:NavBarItem>
                </Items>
            </dx:NavBarGroup>
        </Groups>
    </dx:ASPxNavBar>
            </td>
        </tr>
    </table>
</asp:Content>

