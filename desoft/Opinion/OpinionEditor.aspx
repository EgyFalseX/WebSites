<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="OpinionEditor.aspx.cs" Inherits="OpinionEditor" %>



<%@ Register src="UC/OpinionEditor.ascx" tagname="OpinionEditor" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    
  
    <uc1:OpinionEditor ID="OpinionEditor1" runat="server" />
  
    
  
</asp:Content>

