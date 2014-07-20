<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SBBooksSearch.aspx.cs" Inherits="SBBooksSearch" %>

<%@ Register src="UserControls06/SBBooksSearch.ascx" tagname="SBBooksSearch" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:SBBooksSearch ID="SBBooksSearch1" runat="server" />
</asp:Content>

