<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="EditUserMessages.aspx.cs" Inherits="EditUserMessages" %>

<%@ Register src="UC/EditUserMessages.ascx" tagname="EditUserMessages" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    
    <uc1:EditUserMessages ID="EditUserMessages1" runat="server" />
   
    
</asp:Content>

