<%@ Page Title="" Language="C#" MasterPageFile="../Master.master" AutoEventWireup="true" CodeFile="UsersEditor.aspx.cs" Inherits="UsersEditor" %>

<%@ Register src="UC/UsersEditor.ascx" tagname="UsersEditor" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:UsersEditor ID="UsersEditor1" runat="server" />

</asp:Content>

