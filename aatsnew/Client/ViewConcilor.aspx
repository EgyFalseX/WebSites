﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="ViewConcilor.aspx.cs" Inherits="ViewConcilor" %>

<%@ Register src="UC/ViewConcilor.ascx" tagname="ViewConcilor" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ViewConcilor ID="ViewConcilor1" runat="server" />
</asp:Content>

