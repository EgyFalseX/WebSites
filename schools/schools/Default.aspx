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
                    <dx:NavBarItem NavigateUrl="schoolsEditor.aspx" Text="اضافة بيانات المدارس">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="Viewschools.aspx" Text="عرض بيانات المدارس">
                    </dx:NavBarItem>
                </Items>
            </dx:NavBarGroup>
            <dx:NavBarGroup Text="المدير" Name="groupAdmin">
                <HeaderImage Url="images/adminGroup.png">
                </HeaderImage>
                <Items>
                    <dx:NavBarItem NavigateUrl="cdhay.aspx" Text="اكواد الاحياء">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="schoolsEditor.aspx" Text="اضافة بيانات المدارس">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="Viewschools.aspx" Text="عرض بيانات المدارس">
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

