<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="PlanDetailsEditor.aspx.cs" Inherits="PlanDetailsEditor" %>

<%@ Register src="UC/PlanDetailsEditor.ascx" tagname="PlanDetailsEditor" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <uc1:PlanDetailsEditor ID="PlanDetailsEditor1" runat="server" />
  
</asp:Content>

