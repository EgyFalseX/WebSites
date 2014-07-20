<%@ Page Language="C#" MasterPageFile="~/Code/empkgMasterPage.master" AutoEventWireup="true" CodeFile="CdServiceType.aspx.cs" Inherits="Default3" Title="Untitled Page" %>

<%@ Register src="UC/CdServiceType.ascx" tagname="CdServiceType" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:CdServiceType ID="CdServiceType1" runat="server" />

</asp:Content>

