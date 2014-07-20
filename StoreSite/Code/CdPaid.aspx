<%@ Page Title="" Language="C#" MasterPageFile="~/Code/empkgMasterPage.master" AutoEventWireup="true" CodeFile="CdPaid.aspx.cs" Inherits="CdPaid" %>

<%@ Register src="UC/CdPaid.ascx" tagname="CdPaid" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:CdPaid ID="CdPaid1" runat="server" />
</asp:Content>

