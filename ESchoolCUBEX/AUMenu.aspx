<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AUMenu.aspx.cs" Inherits="AUMenu" Title="Untitled Page" %>

<%@ Register src="UserControls06/AUMenu.ascx" tagname="AUMenu" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:AUMenu ID="AUMenu1" runat="server" />
</asp:Content>

