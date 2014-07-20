<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="BookingEditor.aspx.cs" Inherits="BookingEditor" %>

<%@ Register src="UC/BookingEditor.ascx" tagname="BookingEditor" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <uc1:BookingEditor ID="BookingEditor1" runat="server" />
  
</asp:Content>

