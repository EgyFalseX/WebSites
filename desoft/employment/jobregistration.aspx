<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="jobregistration.aspx.cs" Inherits="jobregistration" %>

<%@ Register src="UC/jobregistration.ascx" tagname="jobregistration" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:jobregistration ID="jobregistration1" runat="server" />
</asp:Content>

