<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="JobsEditor.aspx.cs" Inherits="JobsEditor" %>


<%@ Register src="UC/JobsEditor.ascx" tagname="JobsEditor" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <uc1:JobsEditor ID="JobsEditor1" runat="server" />
  
</asp:Content>

