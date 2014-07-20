<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="BookingViewer.aspx.cs" Inherits="BookingViewer" %>

<%@ Register src="UC/BookingViewer.ascx" tagname="BookingViewer" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
  
    <uc1:BookingViewer ID="BookingViewer1" runat="server" />
  
  
</asp:Content>

