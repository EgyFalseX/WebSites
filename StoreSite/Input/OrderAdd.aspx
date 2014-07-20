<%@ Page Title="" Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="OrderAdd.aspx.cs" Inherits="OrderAdd" %>
<%@ Register src="UC/OrderAdd.ascx" tagname="OrderAdd" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="CSS/PopUpStyle.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:OrderAdd ID="OrderAdd1" runat="server" />
</asp:Content>

