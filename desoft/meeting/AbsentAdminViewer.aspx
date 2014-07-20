<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="AbsentAdminViewer.aspx.cs" Inherits="AbsentAdminViewer" %>

<%@ Register src="UC/AbsentAdminViewer.ascx" tagname="AbsentAdminViewer" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
  
    <uc1:AbsentAdminViewer ID="AbsentAdminViewer1" runat="server" />
  
  
</asp:Content>

