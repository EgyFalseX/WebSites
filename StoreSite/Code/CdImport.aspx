<%@ Page Title="" Language="C#" MasterPageFile="~/Code/empkgMasterPage.master" AutoEventWireup="true" CodeFile="CdImport.aspx.cs" Inherits="CdImport" %>

<%@ Register src="UC/CdImport.ascx" tagname="CdImport" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:CdImport ID="CdImport1" runat="server" />
</asp:Content>

