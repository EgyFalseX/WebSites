<%@ Page Language="C#" MasterPageFile="~/EmpInterface/MasterPage.master" AutoEventWireup="true" CodeFile="EMPDegrees.aspx.cs" Inherits="EmpInterface_EMPDegrees" Title="Degrees Page" %>

<%@ Register Src="../UserControls/EMPDegrees.ascx" TagName="EMPDegrees" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EMPDegrees ID="EMPDegrees1" runat="server" />
</asp:Content>

