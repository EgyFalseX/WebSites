<%@ Page Title="" Language="C#" MasterPageFile="~/Input/empkgMasterPage.master" AutoEventWireup="true" CodeFile="EditorCheck.aspx.cs" Inherits="EditorCheck" %>

<%@ Register src="UC/EditorCheck.ascx" tagname="EditorCheck" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EditorCheck ID="EditorCheck1" runat="server" />
</asp:Content>

