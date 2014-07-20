<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FBAdmin.aspx.cs" Inherits="FBAdmin" Title="Untitled Page" %>

<%@ Register src="UserControls06/FBAdmin.ascx" tagname="FBAdmin" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:FBAdmin ID="FBAdmin1" runat="server" />
</asp:Content>

