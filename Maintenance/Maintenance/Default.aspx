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
                    <dx:NavBarItem NavigateUrl="MaintenanceOpenCase.aspx" Text="ارسال رسالة">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="MaintenanceEditor.aspx" Text="الوارد">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="MaintenanceEditorOutbox.aspx" Text="الصادر">
                    </dx:NavBarItem>
                </Items>
            </dx:NavBarGroup>
            <dx:NavBarGroup Text="المدير" Name="groupAdmin">
                <HeaderImage Url="images/adminGroup.png">
                </HeaderImage>
                <Items>
                    <dx:NavBarItem NavigateUrl="CDdept.aspx" Text="اكواد الجهات">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="Users.aspx" Text="المستخدمون">
                    </dx:NavBarItem>
                </Items>
            </dx:NavBarGroup>
        </Groups>
    </dx:ASPxNavBar>
            </td>
        </tr>
    </table>
</asp:Content>

