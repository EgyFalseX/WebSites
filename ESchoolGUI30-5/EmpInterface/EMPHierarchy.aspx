<%@ Page Language="C#" MasterPageFile="~/EmpInterface/MasterPage.master" AutoEventWireup="true" CodeFile="EMPHierarchy.aspx.cs" Inherits="EmpInterface_EMPHierarchy" Title="Untitled Page" %>

<%@ Register Src="../UserControls/EMPHierarchy.ascx" TagName="EMPHierarchy" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EMPHierarchy ID="EMPHierarchy1" runat="server" />
   
</asp:Content>

