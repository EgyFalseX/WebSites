<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CreatePages.ascx.cs" Inherits="CreatePages" %>
<%@ Register assembly="DevExpress.Web.ASPxHtmlEditor.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHtmlEditor" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>
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
            <td dir="ltr" style="text-align: center" class="style1">
                
                <br />
                <dx:ASPxHtmlEditor ID="txt1" runat="server" Height="500px" Width="850px" Theme="SoftOrange">
                    <SettingsImageUpload UploadImageFolder="~/ThumbnailSliderWebApplication/UploadedImages/">
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


