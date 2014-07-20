<%@ Page Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Title="Untitled Page" %>

<%@ Register Src="UserControls/DoTheLogin.ascx" TagName="DoTheLogin" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:DoTheLogin ID="DoTheLogin1" runat="server" />
</asp:Content>

