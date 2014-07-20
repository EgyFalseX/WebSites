<%@ Page Title="" Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="EditorMaterial.aspx.cs" Inherits="EditorMaterial" %>

<%@ Register src="UC/EditorMaterial.ascx" tagname="EditorMaterial" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>&#1605;&#1581;&#1585;&#1585; &#1575;&#1604;&#1575;&#1589;&#1606;&#1575;&#1601;</title>v
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:EditorMaterial ID="EditorMaterial1" runat="server" />

</asp:Content>

