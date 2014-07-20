<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="jobregistrationDetailsEditor.aspx.cs" Inherits="jobregistrationDetailsEditor" %>

<%@ Register src="UC/jobregistrationDetailsEditor.ascx" tagname="jobregistrationDetailsEditor" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:jobregistrationDetailsEditor ID="jobregistrationDetailsEditor1" 
        runat="server" />
</asp:Content>

