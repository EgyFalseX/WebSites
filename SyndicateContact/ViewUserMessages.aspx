<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="ViewUserMessages.aspx.cs" Inherits="ViewUserMessages" %>

<%@ Register src="UC/ViewUserMessages.ascx" tagname="ViewUserMessages" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
    
    <uc1:ViewUserMessages ID="ViewUserMessages1" runat="server" />
     
    
</asp:Content>

