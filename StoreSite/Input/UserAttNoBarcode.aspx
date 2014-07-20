<%@ Page Title="" Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="UserAttNoBarcode.aspx.cs" Inherits="UserAttNoBarcode" %>

<%@ Register src="UC/UserAttNoBarcode.ascx" tagname="UserAttNoBarcode" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<!--The next line of code will refresh the page every 2 minutes-->
      <meta http-equiv="refresh" content="120">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc1:UserAttNoBarcode ID="UserAttNoBarcode1" runat="server" />
    
</asp:Content>

