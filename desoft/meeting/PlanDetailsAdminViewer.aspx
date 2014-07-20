<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="PlanDetailsAdminViewer.aspx.cs" Inherits="PlanDetailsAdminViewer" %>

<%@ Register src="UC/PlanDetailsAdminViewer.ascx" tagname="PlanDetailsAdminViewer" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <uc1:PlanDetailsAdminViewer ID="PlanDetailsAdminViewer1" runat="server" />
  
</asp:Content>

