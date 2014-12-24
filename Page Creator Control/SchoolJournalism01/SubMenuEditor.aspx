<%@ Page Title="" Language="C#" MasterPageFile="MasterPage1.master" AutoEventWireup="true" CodeFile="SubMenuEditor.aspx.cs" Inherits="SubMenuEditor" %>

<%@ Register src="UC/SubMenuEditor.ascx" tagname="SubMenuEditor" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:SubMenuEditor ID="SubMenuEditor1" runat="server" />
</asp:Content>

