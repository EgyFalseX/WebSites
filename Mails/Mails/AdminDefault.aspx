<%@ Page Title="" Language="C#" MasterPageFile="AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminDefault.aspx.cs" Inherits="AdminDefault" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        .auto-style1
        {
            width: 231px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <table align="center" class="auto-style1">
        <tr>
            <td class="dxflHACSys">
    <dx:ASPxNavBar ID="ASPxNavBarMain" runat="server" Font-Bold="True" Font-Size="10pt" LoadingPanelText="جاري التحميل&amp;hellip;" RightToLeft="True" Width="325px" Theme="PlasticBlue">
        <Groups>
            <dx:NavBarGroup Text="المدير" Name="groupAdmin">
                <HeaderImage Url="images/adminGroup.png">
                </HeaderImage>
                <Items>
                    <dx:NavBarItem NavigateUrl="CDdeptEditor.aspx" Text="الادارات">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="CDtitleEditor.aspx" Text="الوظائف">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="UsersEditor.aspx" Text="المستخدمين">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="RolesEditor.aspx" Text="المجموعات">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="UsersInRolesEditor.aspx" Text="مجموعات المستخدمين">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="AdminMails.aspx" Text="الرسائل">
                    </dx:NavBarItem>
                </Items>
            </dx:NavBarGroup>
        </Groups>
    </dx:ASPxNavBar>
            </td>
        </tr>
    </table>

</asp:Content>

