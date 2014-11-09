<%@ Page Title="" Language="C#" MasterPageFile="masteruser.master" AutoEventWireup="true" CodeFile="SubjectStudentCreateDetails.aspx.cs" Inherits="SubjectStudentCreateDetails" %>
<%@ Register assembly="DevExpress.Web.ASPxHtmlEditor.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHtmlEditor" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <style type="text/css">

    .style11
    {
        width: 847px;
    }
    .style1
    {
        width: 645px;
    }
    </style>

<div dir="rtl"> 
    <table class="style11">
        <tr>
            <td class="style12">
                &nbsp;</td>
            <td dir="ltr" class="style1">
                
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style12">
                &nbsp;</td>
            <td dir="ltr" style="text-align: center" class="style1">
                
                <br />
                <dx:ASPxHtmlEditor ID="txt1" runat="server" Height="500px" Width="850px" Theme="Office2003Blue">
                    <SettingsImageUpload UploadImageFolder="~/frsan/UploadedImages/">
                    </SettingsImageUpload>
                    <SettingsText DesignViewTab="تصميم" HtmlViewTab="كود HTML" PreviewTab="عرض" />
                </dx:ASPxHtmlEditor>
                </td>
        </tr>
        <tr>
            <td class="style12">
                &nbsp;</td>
            <td dir="ltr" style="text-align: right" class="style1">
                </td>
        </tr>
        <tr>
            <td class="style12">
                &nbsp;</td>
            <td dir="ltr" style="text-align: right" class="style1">
            <asp:Button ID="BtnSave" runat="server" onclick="BtnSave_Click" 
                Text="حفــــــظ" Width="103px" />
                <br />
            <asp:Label ID="LblError" runat="server" Visible="False"></asp:Label>
                </td>
        </tr>
    </table>
</div>

</asp:Content>

