<%@ Page Title="" Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="EditorCustomer.aspx.cs" Inherits="EditorCustomer" %>

<%@ Register src="UC/EditorCustomer.ascx" tagname="EditorCustomer" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EditorCustomer ID="EditorCustomer1" runat="server" />
</asp:Content>

