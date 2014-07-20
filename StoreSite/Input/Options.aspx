<%@ Page Title="" Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="Options.aspx.cs" Inherits="Options" %>

<%@ Register src="UC/EditorOptions.ascx" tagname="EditorOptions" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EditorOptions ID="EditorOptions1" runat="server" />
</asp:Content>

