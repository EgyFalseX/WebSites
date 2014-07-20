<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="ViewAllMessages.aspx.cs" Inherits="ViewAllMessages" %>

<%@ Register src="UC/ViewAllMessages.ascx" tagname="ViewAllMessages" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
   
    
    <uc1:ViewAllMessages ID="ViewAllMessages1" runat="server" />
    
   
    
</asp:Content>

