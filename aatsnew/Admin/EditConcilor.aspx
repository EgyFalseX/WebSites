<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="EditConcilor.aspx.cs" Inherits="EditConcilor" %>

<%@ Register src="UC/EditConcilor.ascx" tagname="EditConcilor" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EditConcilor ID="EditConcilor1" runat="server" />
</asp:Content>

