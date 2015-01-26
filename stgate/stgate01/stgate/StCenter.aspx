<%@ Page Title="" Language="C#" MasterPageFile="masterst.master" AutoEventWireup="true" CodeFile="StCenter.aspx.cs" Inherits="centerEditor" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            height: 144px;
        }
        .style2
        {
            width: 96px;
            height: 65px;
        }
        .style3
        {
            height: 144px;
            width: 182px;
        }
        .style4
        {
            width: 182px;
        }
        .style5
        {
            height: 144px;
            width: 217px;
        }
        .style6
        {
            width: 217px;
        }
        .style7
        {
            width: 217px;
            height: 158px;
        }
        .style8
        {
            width: 182px;
            height: 158px;
        }
        .style9
        {
            height: 158px;
        }
        .style10
        {
            width: 217px;
            height: 127px;
        }
        .style11
        {
            width: 182px;
            height: 127px;
        }
        .style12
        {
            height: 127px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <body>

<table align="center" style="width: 617px; height: 754px;">
    <tr>
        <td class="style5" align="center">
            <img alt="" class="style2" src="images/basic.png" align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink4" runat="server" Font-Bold="True" 
                Font-Names="Arial Black" Font-Size="Medium" 
                NavigateUrl="~/stgate/stdata.aspx" Text="Basic data" 
                style="text-align: right" />
        </td>
        <td class="style3" align="center">
            <img alt="" class="style2" src="../icons/video.jpg" align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink3" runat="server" Font-Bold="True" 
                Font-Names="Arial Black" Font-Size="Medium" 
                NavigateUrl="~/images/pica/UploadFiles.aspx" Text="صور الرئسية" 
                style="text-align: right" />
        </td>
        <td align="center" class="style1">
            <img alt="" class="style2" src="../icons/video.jpg" align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink2" runat="server" Font-Bold="True" 
                Font-Names="Arial Black" Font-Size="Medium" 
                NavigateUrl="~/adv2/UploadFiles.aspx" Text="صور الاعلانات" 
                style="text-align: right" />
        </td>
    </tr>
    <tr>
        <td class="style7" align="center">
            &nbsp;</td>
        <td class="style8" align="center">
            <br />
        </td>
        <td align="center" class="style9">
            <br />
        </td>
    </tr>
    <tr>
        <td class="style7" align="center">
            <br />
            </td>
        <td class="style8" align="center">
            <br />
        </td>
        <td align="center" class="style9">
            <br />
        </td>
    </tr>
    <tr>
        <td class="style10" align="center">
            <br />
        </td>
        <td class="style11" align="center">
            <br />
        </td>
        <td align="center" class="style12">
            <br />
        </td>
    </tr>
    <tr>
        <td class="style10" align="center">
            <br />
        </td>
        <td class="style11" align="center">
            <br />
        </td>
        <td align="center" class="style12">
            <br />
        </td>
    </tr>
    <tr>
        <td class="style10" align="center">
            <br />
            </td>
        <td class="style11" align="center">
            <br />
        </td>
        <td align="center" class="style12">
            <br />
        </td>
    </tr>
    <tr>
        <td class="style10" align="center">
            <br />
            </td>
        <td class="style11" align="center">
            <br />
        </td>
        <td align="center" class="style12">
            <br />
        </td>
    </tr>
    <tr>
        <td class="style6" align="center">
            <br />
        </td>
        <td class="style4" align="center">
            <br />
        </td>
        <td align="center">
            <br />
        </td>
    </tr>
    <tr>
        <td class="style6" align="center">
            &nbsp;</td>
        <td class="style4" align="center">
            &nbsp;</td>
        <td align="center">
            <br />
        </td>
    </tr>
    </table>
    



    

</asp:Content>

