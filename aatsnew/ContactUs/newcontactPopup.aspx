<%@ Page Title="" Language="C#" MasterPageFile="~/ContactUs/Master.master" AutoEventWireup="true" CodeFile="newcontactPopup.aspx.cs" Inherits="newcontactPopup" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" class="auto-style1">
        <tr>
            <td style="text-align: center">
                <dx:ASPxButton ID="ASPxButton2" runat="server" Text="ASPxButton">
                    <ClientSideEvents Click="function(s, e) {
	popup.Show(); 
}" />
                </dx:ASPxButton>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <a href="#" onClick="window.open('newcontact.aspx','pagename','resizable,height=400,width=600'); return false;">New Page</a><noscript>You need Javascript to use the previous link or use <a href="yourpage.htm" target="_blank">New Page</a></noscript></td>
        </tr>
        </table>
</asp:Content>

