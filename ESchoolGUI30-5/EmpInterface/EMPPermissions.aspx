<%@ Page Language="C#" MasterPageFile="~/EmpInterface/MasterPage.master" AutoEventWireup="true" CodeFile="EMPPermissions.aspx.cs" Inherits="EmpInterface_EMPPermissions" Title="Untitled Page" %>

<%@ Register Src="../UserControls/EMPPermissions.ascx" TagName="EMPPermissions" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EMPPermissions ID="EMPPermissions1" runat="server" />
</asp:Content>

