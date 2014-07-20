<%@ Page Title="" Language="C#" MasterPageFile="../Master.master" AutoEventWireup="true" CodeFile="CDSubCommitteData.aspx.cs" Inherits="CDSubCommitteData" %>

<%@ Register src="UC/CDSubCommitteData.ascx" tagname="CDSubCommitteData" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:CDSubCommitteData ID="CDSubCommitteData1" runat="server" />

</asp:Content>

