<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="OpinionViewer.aspx.cs" Inherits="OpinionViewer" %>

<%@ Register src="UC/OpinionViewer.ascx" tagname="OpinionViewer" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc1:OpinionViewer ID="OpinionViewer1" runat="server" />
    
</asp:Content>

