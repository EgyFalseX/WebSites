<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="QAMenu.aspx.cs" Inherits="QAMenu" Title="Untitled Page" %>

<%@ Register src="UserControls06/QAMenu.ascx" tagname="QAMenu" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:QAMenu ID="QAMenu1" runat="server" />
</asp:Content>

