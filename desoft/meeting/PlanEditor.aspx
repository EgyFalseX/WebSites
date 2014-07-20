<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="PlanEditor.aspx.cs" Inherits="PlanEditor" %>


<%@ Register src="UC/PlanEditor.ascx" tagname="PlanEditor" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
  
    <uc1:PlanEditor ID="PlanEditor1" runat="server" />
  
  
</asp:Content>

