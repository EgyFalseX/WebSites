<%@ Page Language="C#" MasterPageFile="~/Code/empkgMasterPage.master" AutoEventWireup="true" CodeFile="CdEdara.aspx.cs" Inherits="CdEdara" Title="Untitled Page" %>

<%@ Register src="UC/CdEdara.ascx" tagname="CdEdara" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:CdEdara ID="CdEdara1" runat="server" />

</asp:Content>