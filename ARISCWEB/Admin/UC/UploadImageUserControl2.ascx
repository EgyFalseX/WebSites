<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UploadImageUserControl2.ascx.cs" Inherits="UploadImageUserControl2" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxEditors" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGridView.Export" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxRatingControl" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxUploadControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPopupControl" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxHiddenField" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxCallbackPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxLoadingPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPanel" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxTabControl" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v12.2, Version=12.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxClasses" tagprefix="dx" %>
<style type="text/css">
img 
{
	border-width: 0px;
}

.dxeBase
{
	font: 12px Tahoma;
}
</style>

<dx:ASPxHiddenField ID="pictureHiddenField" runat="server" ClientInstanceName="pictureHiddenField">
</dx:ASPxHiddenField>
<dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="ASPxLoadingPanel1" CssFilePath="~/App_Themes/Office2010Black/{0}/styles.css" CssPostfix="Office2010Black" ImageSpacing="5px" Modal="True" Theme="Glass">
    <Image Url="~/App_Themes/Office2010Black/Web/Loading.gif">
    </Image>
</dx:ASPxLoadingPanel>
<dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" ClientIDMode="AutoID" ClientInstanceName="ASPxCallbackPanel1" ClientVisible="False" Width="200px" Theme="Glass">
    <ClientSideEvents EndCallback="function(s, e) {
	ASPxLoadingPanel1.Hide();
}" />
    <PanelCollection>
        <dx:PanelContent ID="PanelContent2" runat="server" SupportsDisabledAttribute="True">
        </dx:PanelContent>
    </PanelCollection>
</dx:ASPxCallbackPanel>
<dx:ASPxUploadControl ID="imageASPxUploadControl" runat="server" ClientInstanceName="imageASPxUploadControl" EnableTheming="True" FileUploadMode="OnPageLoad" Theme="Glass" Width="280px">
    <ValidationSettings AllowedFileExtensions=".jpg, .jpeg" MaxFileSize="50000">
    </ValidationSettings>
    <ClientSideEvents FileUploadComplete="function(s, e) {
	msgUploadASPxLabel.SetText('Uploaded Succesfully');     
}" />
</dx:ASPxUploadControl>
<dx:ASPxButton ID="uploadASPxButton" runat="server" AutoPostBack="False" ClientInstanceName="uploadASPxButton" EnableTheming="True" Font-Bold="True" OnClick="uploadASPxButton_Click" Text="Upload^" Theme="Glass" CausesValidation="False">
    <ClientSideEvents Click="function(s, e) {
	
	
		ASPxCallbackPanel1.PerformCallback();
		ASPxLoadingPanel1.Show();
	
}" />
</dx:ASPxButton>
<dx:ASPxLabel ID="msgUploadASPxLabel" runat="server" ClientInstanceName="msgUploadASPxLabel" style="font-weight: 700; color: #008000;">
</dx:ASPxLabel>

