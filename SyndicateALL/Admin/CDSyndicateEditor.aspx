<%@ Page Title="" Language="C#" MasterPageFile="../Master.master" AutoEventWireup="true" CodeFile="CDSyndicateEditor.aspx.cs" Inherits="CDSyndicateEditor" %>



<%@ Register src="UC/CDSyndicateEditor.ascx" tagname="CDSyndicateEditor" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  
    <uc1:CDSyndicateEditor ID="CDSyndicateEditor1" runat="server" />

  
</asp:Content>

