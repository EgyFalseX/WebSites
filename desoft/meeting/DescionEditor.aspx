<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="DescionEditor.aspx.cs" Inherits="DescionEditor" %>

<%@ Register src="UC/DescionEditor.ascx" tagname="DescionEditor" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <uc1:DescionEditor ID="DescionEditor1" runat="server" />
  
</asp:Content>

