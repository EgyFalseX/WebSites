<%@ Page Title="" Language="C#" MasterPageFile="../Master.master" AutoEventWireup="true" CodeFile="CDGovEditor.aspx.cs" Inherits="CDGovEditor" %>

<%@ Register src="UC/CDGovEditor.ascx" tagname="CDGovEditor" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  
    <uc1:CDGovEditor ID="CDGovEditor1" runat="server" />

  
</asp:Content>

