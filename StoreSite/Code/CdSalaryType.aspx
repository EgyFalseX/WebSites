﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Code/empkgMasterPage.master" AutoEventWireup="true" CodeFile="CdSalaryType.aspx.cs" Inherits="Default2" %>

<%@ Register src="UC/CdSalaryType.ascx" tagname="CdSalaryType" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:CdSalaryType ID="CdSalaryType1" runat="server" />

</asp:Content>
