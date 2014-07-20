<%@ Page Title="" Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="EditorCommercialCustomers.aspx.cs" Inherits="EditorCommercialCustomers" %>

<%@ Register src="UC/EditorCommercialCustomers.ascx" tagname="EditorCommercialCustomers" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EditorCommercialCustomers ID="EditorCommercialCustomers1" runat="server" />
</asp:Content>

