<%@ Page Title="" Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="Basic.aspx.cs" Inherits="Basic" %>

<%@ Register src="UC/Basic.ascx" tagname="Basic" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:Basic ID="Basic1" runat="server" />
</asp:Content>

