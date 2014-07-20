<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="StaffCodeEditor.aspx.cs" Inherits="StaffCodeEditor" %>

<%@ Register src="UC/StaffCodeEditor.ascx" tagname="StaffCodeEditor" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:StaffCodeEditor ID="StaffCodeEditor1" runat="server" />
</asp:Content>

