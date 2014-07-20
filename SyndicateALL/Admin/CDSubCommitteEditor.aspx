<%@ Page Title="" Language="C#" MasterPageFile="../Master.master" AutoEventWireup="true" CodeFile="CDSubCommitteEditor.aspx.cs" Inherits="CDSubCommitteEditor" %>

<%@ Register src="UC/CDSubCommitteEditor.ascx" tagname="CDSubCommitteEditor" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <uc1:CDSubCommitteEditor ID="CDSubCommitteEditor1" runat="server" />
  
</asp:Content>

