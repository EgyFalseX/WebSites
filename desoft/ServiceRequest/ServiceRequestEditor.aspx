<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="ServiceRequestEditor.aspx.cs" Inherits="ServiceRequestEditor" %>


<%@ Register src="UC/ServiceRequestEditor.ascx" tagname="ServiceRequestEditor" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc1:ServiceRequestEditor ID="ServiceRequestEditor1" runat="server" />
    
</asp:Content>

