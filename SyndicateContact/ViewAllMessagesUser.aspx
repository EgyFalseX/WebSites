<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="ViewAllMessagesUser.aspx.cs" Inherits="ViewAllMessagesUser" %>

<%@ Register src="UC/ViewAllMessagesUser.ascx" tagname="ViewAllMessagesUser" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
   
   
    
    <uc1:ViewAllMessagesUser ID="ViewAllMessagesUser1" runat="server" />
    
   
   
    
</asp:Content>

