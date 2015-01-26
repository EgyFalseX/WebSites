<%@ Page Title="" Language="C#" MasterPageFile="masterst.master" AutoEventWireup="true" CodeFile="StCenter.aspx.cs" Inherits="centerEditor" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 102px;
            height: 88px;
        }
        .style4
        {
            width: 182px;
        }
        .style13
    {
        height: 93px;
        width: 217px;
    }
    .style14
    {
        height: 93px;
        width: 182px;
    }
    .style15
    {
        height: 93px;
    }
    .style16
    {
        width: 217px;
        height: 76px;
    }
    .style17
    {
        width: 182px;
        height: 76px;
    }
    .style18
    {
        height: 76px;
    }
        .style19
        {
            height: 49px;
        }
        .style20
        {
            height: 49px;
            width: 182px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <body>

<table align="center" style="width: 617px; height: 362px;">
    <tr>
        <td class="style19" align="center">
            <img alt="" class="style2" src="images/basic.png" align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink4" runat="server" Font-Bold="True" 
                Font-Names="Arial Black" Font-Size="Medium" 
                NavigateUrl="~/stgate/stdata.aspx" Text="Basic data" 
                style="text-align: right" />
        </td>
        <td class="style20" align="center">
            <img alt="" class="style2" src="images/absent.png" align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink5" runat="server" Font-Bold="True" 
                Font-Names="Arial Black" Font-Size="Medium" 
                NavigateUrl="~/stgate/StAbsenceViewer.aspx" Text="Student's absence" 
                style="text-align: right" />
        </td>
        <td align="center" class="style19">
            <img alt="" class="style2" src="images/Gallery_icon.png" align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink6" runat="server" Font-Bold="True" 
                Font-Names="Arial Black" Font-Size="Medium" 
                NavigateUrl="~/stgate/stalmawahebViewer.aspx" Text="Students' talents" 
                style="text-align: right" />
        </td>
    </tr>
    <tr>
        <td class="style13" align="center">
            <img alt="" class="style2" src="images/icon-Advocate-case-management.png" 
                align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink7" runat="server" Font-Bold="True" 
                Font-Names="Arial Black" Font-Size="Medium" 
                NavigateUrl="~/stgate/STBehaviorViewer.aspx" Text="Behaviors" 
                style="text-align: right" />
        </td>
        <td class="style14" align="center">
            <img alt="" class="style2" src="images/group_doctors.png" align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink8" runat="server" Font-Bold="True" 
                Font-Names="Arial Black" Font-Size="Medium" 
                NavigateUrl="~/stgate/stelalageltpeViewer.aspx" Text="Therapeutic card" 
                style="text-align: right" />
        </td>
        <td align="center" class="style15">
            <img alt="" class="style2" src="images/img2.png" align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink9" runat="server" Font-Bold="True" 
                Font-Names="Arial Black" Font-Size="Medium" 
                NavigateUrl="~/stgate/stgamaatalnashatViewer.aspx" Text="Activity groups" 
                style="text-align: right" />
        </td>
    </tr>
    <tr>
        <td class="style16" align="center">
            <img alt="" class="style2" src="images/login.png" align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink10" runat="server" Font-Bold="True" 
                Font-Names="Arial Black" Font-Size="Medium" 
                NavigateUrl="~/stgate/stPermissionViewer.aspx" Text="Permissions" 
                style="text-align: right" />
            </td>
        <td class="style17" align="center">
            <br />
        </td>
        <td align="center" class="style18">
            <br />
        </td>
    </tr>
    </table>
    



    

</asp:Content>

