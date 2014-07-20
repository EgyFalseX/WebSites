<%@ Page Language="C#" MasterPageFile="~/EmpInterface/MasterPage.master" AutoEventWireup="true" CodeFile="EMPQualifieds.aspx.cs" Inherits="EmpInterface_EMPQualifieds" Title="Untitled Page" %>

<%@ Register Src="../UserControls/EMPQualifieds.ascx" TagName="EMPQualifieds" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EMPQualifieds ID="EMPQualifieds1" runat="server" />
</asp:Content>

