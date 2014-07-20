<%@ Page Language="C#" MasterPageFile="~/EmpInterface/MasterPage.master" AutoEventWireup="true" CodeFile="EMPMInformation.aspx.cs" Inherits="EmpInterface_MInformation" Title="Untitled Page" %>

<%@ Register Src="../UserControls/EMPMainInformations.ascx" TagName="EMPMainInformations"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EMPMainInformations ID="EMPMainInformations1" runat="server" />
</asp:Content>

