<%@ Page Title="" Language="C#" MasterPageFile="~/Query/empkgMasterPage.master" AutoEventWireup="true" CodeFile="QryWared.aspx.cs" Inherits="QryWared" %>

<%@ Register src="UC/QryWared.ascx" tagname="QryWared" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:QryWared ID="QryWared1" runat="server" />
</asp:Content>

