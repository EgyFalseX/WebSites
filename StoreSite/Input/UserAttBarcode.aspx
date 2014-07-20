<%@ Page Title="" Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="UserAttBarcode.aspx.cs" Inherits="UserAttBarcode" %>

<%@ Register src="UC/UserAttBarcode.ascx" tagname="UserAttBarcode" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <!--The next line of code will refresh the page every 1 minutes-->
      <meta http-equiv="refresh" content="60">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:UserAttBarcode ID="UserAttBarcode1" runat="server" />
</asp:Content>

