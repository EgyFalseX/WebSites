<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="aa.aspx.cs" Inherits="Default" %>

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
                </Items>
            </dx:NavBarGroup>
        </Groups>
    </dx:ASPxNavBar>
            </td>
        </tr>
    </table>
</asp:Content>

