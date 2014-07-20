<%@ Page Title="" Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="EditorTaskOrder.aspx.cs" Inherits="EditorTaskOrder" %>

<%@ Register src="UC/EditorTaskOrder.ascx" tagname="EditorTaskOrder" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:EditorTaskOrder ID="EditorTaskOrder1" runat="server" />

</asp:Content>

