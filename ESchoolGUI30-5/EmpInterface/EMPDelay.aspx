<%@ Page Language="C#" MasterPageFile="~/EmpInterface/MasterPage.master" AutoEventWireup="true" CodeFile="EMPDelay.aspx.cs" Inherits="EmpInterface_EMPDelay" Title="Untitled Page" %>

<%@ Register Src="../UserControls/EMPDelay.ascx" TagName="EMPDelay" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EMPDelay ID="EMPDelay1" runat="server" />
</asp:Content>

