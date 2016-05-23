<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CreatePages.ascx.cs" Inherits="CreatePages" %>
<%@ Register assembly="DevExpress.Web.ASPxHtmlEditor.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHtmlEditor" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>
<style type="text/css">

    .style11
    {
        width: 614px;
        height: 645px;
    }
    .style1
    {
        width: 200px;
    }
    </style>

<div dir="rtl" style="width: 702px; height: 630px;"> 
    <table class="style11" align="left">
        <tr>
            <td dir="ltr">
                
                &nbsp;</td>
        </tr>
        <tr>
            <td dir="ltr" style="text-align: center" class="style1">
                <dx:ASPxHtmlEditor ID="txt1" runat="server" Height="518px" Width="700px" 
                    Theme="Office2003Olive">
                    <SettingsImageUpload UploadImageFolder="~/Trainers/UC/files/">
                        <ValidationSettings MaxFileSize="153600" 
                            MaxFileSizeErrorText="حجم الملف لا يجب ان يزيد عن 150ك">
                        </ValidationSettings>
                    </SettingsImageUpload>
                    <SettingsText DesignViewTab="تصميم" HtmlViewTab="كود HTML" PreviewTab="عرض" />
                </dx:ASPxHtmlEditor>
                </td>
        </tr>
        <tr>
            <td dir="ltr" style="text-align: right" class="style1">
                </td>
        </tr>
        <tr>
            <td dir="ltr" style="text-align: right" class="style1">
            <asp:Button ID="BtnSave" runat="server" onclick="BtnSave_Click" 
                Text="حفــــــظ" Width="103px" />
                <br />
            <asp:Label ID="LblError" runat="server" Visible="False"></asp:Label>
                </td>
        </tr>
    </table>
</div>


                <asp:AccessDataSource ID="dsData" runat="server" 
                    DataFile="../Data/GallaryData.mdb" 
                    SelectCommand="SELECT ID, VideoFolder FROM VideoFolder ORDER BY ID DESC">
                </asp:AccessDataSource>
                


