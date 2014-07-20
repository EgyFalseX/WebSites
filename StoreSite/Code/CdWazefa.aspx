<%@ Page Title="" Language="C#" MasterPageFile="~/Code/empkgMasterPage.master" AutoEventWireup="true" CodeFile="CdWazefa.aspx.cs" Inherits="CdWazefa" %>

<%@ Register src="UC/CdWazefa.ascx" tagname="CdWazefa" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:CdWazefa ID="CdWazefa1" runat="server" />
</asp:Content>

