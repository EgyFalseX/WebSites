<%@ Page Title="" Language="C#" MasterPageFile="../Master.master" AutoEventWireup="true" CodeFile="RolesEditor.aspx.cs" Inherits="RolesEditor" %>

<%@ Register src="UC/RolesEditor.ascx" tagname="RolesEditor" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:RolesEditor ID="RolesEditor1" runat="server" />

</asp:Content>

