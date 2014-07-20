<%@ Page Title="" Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="EditorWared.aspx.cs" Inherits="EditorWared" %>

<%@ Register src="UC/EditorWared.ascx" tagname="EditorWared" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EditorWared ID="EditorWared1" runat="server" />
</asp:Content>

