<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="AbsentEditor.aspx.cs" Inherits="AbsentEditor" %>


<%@ Register src="UC/AbsentEditor.ascx" tagname="AbsentEditor" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
  
    <uc1:AbsentEditor ID="AbsentEditor1" runat="server" />
  
  
</asp:Content>

