<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="PlanViewer.aspx.cs" Inherits="PlanViewer" %>


<%@ Register src="UC/PlanViewer.ascx" tagname="PlanViewer" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <uc1:PlanViewer ID="PlanViewer1" runat="server" />
  
</asp:Content>

