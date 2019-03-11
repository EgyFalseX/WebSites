<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="DgreeEditor.aspx.cs" Inherits="DgreeEditor" %>

<%@ Register src="UC/DgreeEditor.ascx" tagname="DgreeEditor" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:DgreeEditor ID="DgreeEditor1" runat="server" />
</asp:Content>

