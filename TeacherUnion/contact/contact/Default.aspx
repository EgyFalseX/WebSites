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
    <dx:ASPxNavBar ID="ASPxNavBarMain" runat="server" Font-Bold="True" Font-Size="10pt" LoadingPanelText="جاري التحميل&amp;hellip;" RightToLeft="True" Width="325px" Theme="PlasticBlue" style="margin-right: 0px">
        <Groups>
            <dx:NavBarGroup Text="المستخدمين" Name="groupUser" Expanded="True">
                <HeaderImage Url="images/userGroup.png">
                </HeaderImage>
                <Items>
                    <dx:NavBarItem NavigateUrl="alldata1Editor.aspx" Text="بيانات مجالس الفرعيات">
                    </dx:NavBarItem>
                    <dx:NavBarItem NavigateUrl="alldata3Editor.aspx" Text="بيانات مسؤلي الاتصال">
                    </dx:NavBarItem>
                </Items>
            </dx:NavBarGroup>
            <dx:NavBarGroup Text="المدير" Name="groupAdmin" Expanded="True">
                <HeaderImage Url="images/adminGroup.png">
                </HeaderImage>
            </dx:NavBarGroup>
        </Groups>
    </dx:ASPxNavBar>
            </td>
        </tr>
    </table>
</asp:Content>

