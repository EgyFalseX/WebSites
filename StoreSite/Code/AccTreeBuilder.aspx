<%@ Page Title="" Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="AccTreeBuilder.aspx.cs" Inherits="AccTreeBuilder" %>

<%@ Register src="UC/AccTreeBuilder.ascx" tagname="AccTreeBuilder" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:AccTreeBuilder ID="AccTreeBuilder1" runat="server" />

</asp:Content>

