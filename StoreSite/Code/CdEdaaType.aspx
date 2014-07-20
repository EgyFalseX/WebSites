<%@ Page Title="" Language="C#" MasterPageFile="~/Code/empkgMasterPage.master" AutoEventWireup="true" CodeFile="CdEdaaType.aspx.cs" Inherits="CdEdaaType" %>

<%@ Register src="UC/CdEdaaType.ascx" tagname="CdEdaaType" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:CdEdaaType ID="CdEdaaType1" runat="server" />
</asp:Content>

