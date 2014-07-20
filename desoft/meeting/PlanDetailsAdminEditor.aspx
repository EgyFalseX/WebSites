<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="PlanDetailsAdminEditor.aspx.cs" Inherits="PlanDetailsAdminEditor" %>


<%@ Register src="UC/PlanDetailsAdminEditor.ascx" tagname="PlanDetailsAdminEditor" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <uc1:PlanDetailsAdminEditor ID="PlanDetailsAdminEditor1" runat="server" />
  
</asp:Content>

