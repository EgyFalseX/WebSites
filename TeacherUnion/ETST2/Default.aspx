<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

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
    <dx:ASPxNavBar ID="ASPxNavBarMain" runat="server" Font-Bold="True" Font-Size="10pt" LoadingPanelText="جاري التحميل&amp;hellip;" RightToLeft="True" Width="325px" Theme="PlasticBlue">
        <Groups>
            <dx:NavBarGroup Text="المستخدمين" Name="groupUser">
                <HeaderImage Url="images/userGroup.png">
                </HeaderImage>
                <Items>
                    <dx:NavBarItem NavigateUrl="TBLMembers.aspx" Text="بيانات الاعضاء">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="TBLMembersEditor.aspx" Text="تعديل بيانات الاعضاء">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="OldTBLMembersEditor.aspx" Text="تحديث بيانات عضو قديم">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="ViewTBLMembers.aspx" Text="عرض الاعضاء">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="ViewTBLCompanion.aspx" Text="عرض التابعين">
                    </dx:NavBarItem>
                    <dx:NavBarItem Text="حساب اشتراك التكافل العلاجي" NavigateUrl="calc.aspx">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="esalmony.aspx" Text="مبالغ الايصالات">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="SelectMedicalChanges.aspx" Text="التحويلات الطبية">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="ViewMedical.aspx" Text="عرض التحويلات الطبية">
                    </dx:NavBarItem>
                </Items>
            </dx:NavBarGroup>
            <dx:NavBarGroup Text="المدير" Name="groupAdmin">
                <HeaderImage Url="images/adminGroup.png">
                </HeaderImage>
                <Items>
                    <dx:NavBarItem NavigateUrl="CDCompanionType.aspx" Text="فئات التابعين">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="CDGov.aspx" Text="المحافظات">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="CDIdType.aspx" Text="نوع مستند الاثبات">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="CDMaritalStatus.aspx" Text="الحالات الاجتماعية">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="CDSyndicate.aspx" Text="النقابات الفرعية">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="CDSubCommitte.aspx" Text="اللجان النقابية">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="TBLMembersClosedField.aspx" Text="اغلاق تعديل بيانات الاعضاء">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="ExportTBLMembers.aspx" Text="تصدير الاعضاء">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="ExportTBLCompanion.aspx" Text="تصدير التابعين">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="MemCardEditor.aspx" Text="تسليم كارنيهات الاعضاء">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="CompanionCardEditor.aspx" Text="تسليم كارنيهات التابعين">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="ViewSyndicateCount.aspx" Text="الاعضاء و التابعين حسب الفرعيات">
                    </dx:NavBarItem>
                </Items>
            </dx:NavBarGroup>
            <dx:NavBarGroup Text="اخري" Name="groupOther">
                <HeaderImage Url="images/otherGroup.png">
                </HeaderImage>
                <Items>
                    <dx:NavBarItem NavigateUrl="advets/tbladvViewer.aspx" Text="عرض الفعاليات">
                    </dx:NavBarItem>
                </Items>
            </dx:NavBarGroup>
        </Groups>
    </dx:ASPxNavBar>
            </td>
        </tr>
    </table>
</asp:Content>

