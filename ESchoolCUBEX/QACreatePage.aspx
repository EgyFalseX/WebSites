﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" validateRequest=false  CodeFile="QACreatePage.aspx.cs" Inherits="QACreatePage" Title="Untitled Page" %>

<%@ Register src="UserControls06/QACreatePage.ascx" tagname="QACreatePage" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:QACreatePage ID="QACreatePage1" runat="server" />
</asp:Content>

