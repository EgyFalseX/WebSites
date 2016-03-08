<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CPViewCourseDetailsReportUserControl.ascx.cs" Inherits="CPViewCourseDetailsReportUserControl" %>
<%@ Register assembly="DevExpress.Web.ASPxHtmlEditor.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHtmlEditor" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>
<dx:ASPxHtmlEditor ID="ASPxHtmlEditor1" runat="server">
    <SettingsImageUpload UploadImageFolder="~/Admin/UploadFiles/Courses/Details/">
    </SettingsImageUpload>
</dx:ASPxHtmlEditor>
<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="font-weight: 700" Text="حفظ" />

<br />
    <asp:Label ID="msgLabel" runat="server" Font-Bold="True" ForeColor="#009933"></asp:Label>


