<%@ Page Title="" Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="CdHarakaType.aspx.cs" Inherits="CdHarakaType" %>

<%@ Register src="UC/CdHarakaType.ascx" tagname="CdHarakaType" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:CdHarakaType ID="CdHarakaType1" runat="server" />
</asp:Content>

