<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SBResearchSearch.aspx.cs" Inherits="SBResearchSearch" %>

<%@ Register src="UserControls06/SBResearchSearch.ascx" tagname="SBResearchSearch" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:SBResearchSearch ID="SBResearchSearch1" runat="server" />
</asp:Content>

