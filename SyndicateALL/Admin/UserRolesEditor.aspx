<%@ Page Title="" Language="C#" MasterPageFile="../Master.master" AutoEventWireup="true" CodeFile="UserRolesEditor.aspx.cs" Inherits="UserRolesEditor" %>

<%@ Register src="UC/UserRolesEditor.ascx" tagname="UserRolesEditor" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  
    <uc1:UserRolesEditor ID="UserRolesEditor1" runat="server" />

  
</asp:Content>

