<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="PlanAdminEditor.aspx.cs" Inherits="PlanAdminEditor" %>

<%@ Register src="UC/PlanAdminEditor.ascx" tagname="PlanAdminEditor" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <uc1:PlanAdminEditor ID="PlanAdminEditor1" runat="server" />
  
</asp:Content>

