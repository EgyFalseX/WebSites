<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="ServiceRequest.aspx.cs" Inherits="ServiceRequest_Default" %>

<%@ Register src="UC/ServiceRequest.ascx" tagname="ServiceRequest" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ServiceRequest ID="ServiceRequest1" runat="server" />
</asp:Content>

