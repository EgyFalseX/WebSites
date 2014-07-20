<%@ Page Title="" Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="EditorSupplier.aspx.cs" Inherits="EditorSupplier" %>

<%@ Register src="UC/EditorSupplier.ascx" tagname="EditorSupplier" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>&#1605;&#1581;&#1585;&#1585; &#1575;&#1604;&#1605;&#1608;&#1585;&#1583;&#1610;&#1606;</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:EditorSupplier ID="EditorSupplier1" runat="server" />

</asp:Content>

