<%@ Page Language="C#" MasterPageFile="~/Code/empkgMasterPage.master" AutoEventWireup="true" CodeFile="CdGov.aspx.cs" Inherits="CdGov" Title="Untitled Page" %>

<%@ Register src="UC/CdGov.ascx" tagname="CdGov" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:CdGov ID="CdGov1" runat="server" />

</asp:Content>