<%@ Control Language="C#" AutoEventWireup="true" CodeFile="EditcoursenotimeDetails.ascx.cs" Inherits="EditcoursenotimeDetails" %>
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
    .style12
    {
        direction: rtl;
    }
    </style>

 
<div dir="rtl"> 
    <table class="style11">
        <tr>
            <td class="style12" valign="top">
                <telerik:RadPanelBar ID="RadPanelBarCourseItem" Runat="server">
                    <Items>
                        <telerik:RadPanelItem runat="server" EnableTheming="True" Height="64px" 
                            ImagePosition="Right" ImageUrl="../images/EditCourseDetails/00.jpg" 
                            NavigateUrl="../Editcoursenotime.aspx" Owner="RadPanelBarCourseItem" 
                            Text="إختر الدورة التدريبية">
                        </telerik:RadPanelItem>
                        <telerik:RadPanelItem runat="server" Height="64px" ImagePosition="Right" 
                            ImageUrl="../images/EditCourseDetails/01.jpg" 
                            NavigateUrl="../EditCoursenotimeDetails.aspx?Courseitem=1&amp;" Owner="RadPanelBarCourseItem" 
                            Text="محاور الدورة">
                        </telerik:RadPanelItem>
                    </Items>
                </telerik:RadPanelBar>
            </td>
            <td dir="ltr" style="text-align: right" class="style1">
                <dx:ASPxHtmlEditor ID="txt1" runat="server" Height="500px" Width="850px" Theme="SoftOrange">
                    <SettingsImageUpload UploadImageFolder="~/ThumbnailSliderWebApplication/UploadedImages/">
                    </SettingsImageUpload>
                    <SettingsText DesignViewTab="تصميم" HtmlViewTab="كود HTML" PreviewTab="عرض" />
                </dx:ASPxHtmlEditor>
                
            <asp:Button ID="BtnSave" runat="server" onclick="BtnSave_Click" 
                Text="حفــــــظ" Width="103px" />
                <br />
            <asp:Label ID="LblError" runat="server" Visible="False"></asp:Label>
                </td>
        </tr>
    </table>
</div>


