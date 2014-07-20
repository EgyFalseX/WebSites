<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="jobregistrationEditor.aspx.cs" Inherits="jobregistrationEditor" %>

<%@ Register src="UC/jobregistrationEditor.ascx" tagname="jobregistrationEditor" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:jobregistrationEditor ID="jobregistrationEditor1" runat="server" />
</asp:Content>

