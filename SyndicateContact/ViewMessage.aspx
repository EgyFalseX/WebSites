<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="ViewMessage.aspx.cs" Inherits="ViewMessage" %>
<%@ Register src="UC/ViewMessage.ascx" tagname="ViewMessage" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
    <uc1:ViewMessage ID="ViewMessage1" runat="server" />
    
    
</asp:Content>

