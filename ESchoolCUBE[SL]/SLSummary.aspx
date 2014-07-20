<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="SLSummary.aspx.cs" Inherits="SBBooksSearch" %>

<%@ Register src="UserControl/SLSummary.ascx" tagname="SLSummary" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc2:SLSummary ID="SLSummary1" runat="server" />
</asp:Content>

