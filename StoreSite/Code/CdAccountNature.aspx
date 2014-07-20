<%@ Page Title="" Language="C#" MasterPageFile="~/Code/empkgMasterPage.master" AutoEventWireup="true" CodeFile="CdAccountNature.aspx.cs" Inherits="CdAccountNature" %>

<%@ Register src="UC/CdAccountNature.ascx" tagname="CdAccountNature" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:CdAccountNature ID="CdAccountNature1" runat="server" />

</asp:Content>

