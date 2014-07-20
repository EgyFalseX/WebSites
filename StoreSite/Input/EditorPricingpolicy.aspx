<%@ Page Title="" Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="EditorPricingpolicy.aspx.cs" Inherits="EditorPricingpolicy" %>

<%@ Register src="UC/EditorPricingpolicy.ascx" tagname="EditorPricingpolicy" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EditorPricingpolicy ID="EditorPricingpolicy1" runat="server" />
</asp:Content>

