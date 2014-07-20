<%@ Page Title="" Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="stPayments.aspx.cs" Inherits="stPayments" %>

<%@ Register src="UC/stPayments.ascx" tagname="stPayments" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:stPayments ID="stPayments1" runat="server" />
</asp:Content>

