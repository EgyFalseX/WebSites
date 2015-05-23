<%@ Page Title="" Language="C#" MasterPageFile="master1.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="centerEditor" %>
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
            width: 88px;
            height: 78px;
        }
        .style27
    {
        font-weight: 700;
        color: #000080;
    }
        .style33
        {
            width: 249px;
            height: 62px;
        }
        .style34
        {
            width: 249px;
            height: 31px;
        }
        .style35
        {
            height: 31px;
        }
        .style36
        {
            height: 62px;
        }
        </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <body>

<table align="center" style="width: 703px; height: 371px;">
    <tr>
        <td class="style34" align="center">
            <img alt="" class="style2" src="images/karten.png" align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink6" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" Text="بطاقات للتوزيع" 
                style="text-align: right" />
        </td>
        <td class="style35" align="center">
            <img alt="" class="style2" src="images/child%20rights%20and%20equality.png" 
                align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink5" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="tblwarasa.aspx" Text="بيانات الورثة" 
                style="text-align: right" />
            <br />
        </td>
        <td class="style35" align="center">
            <img alt="" class="style2" src="images/Senior-Sign.png" align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink3" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" 
                NavigateUrl="tblmember.aspx" Text="بيانات الاعضاء" 
                style="text-align: right" />
            <br />
            
        </td>
    </tr>
    <tr>
        <td class="style33" align="center">
            <img alt="" class="style2" 
                src="images/atm.png" align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink11" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" Text="منافذ الصرف" 
                style="text-align: right" />
        </td>
        <td class="style36" align="center">
            <img alt="" class="style2" src="images/checklist-icon.png" align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink9" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" Text="إرشادات" 
                style="text-align: right" />
            <br />
        </td>
        <td class="style36" align="center">
            <img alt="" class="style2" src="images/sec1-hands.png" align="middle" /><br />
            <dx:ASPxHyperLink ID="ASPxHyperLink7" runat="server" Font-Bold="True" 
                Font-Names="Simplified Arabic" Font-Size="Medium" Text="استعلامات الصرف" 
                style="text-align: right" />
            <br />
        </td>
    </tr>
    </table>
    



    

</asp:Content>

