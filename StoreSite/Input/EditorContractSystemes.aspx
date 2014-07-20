<%@ Page Title="" Language="C#" MasterPageFile="~/Input/empkgMasterPage.master" AutoEventWireup="true" CodeFile="EditorContractSystemes.aspx.cs" Inherits="EditorContractSystemes" %>

<%@ Register src="UC/EditorContractSystemes.ascx" tagname="EditorContractSystemes" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EditorContractSystemes ID="EditorContractSystemes1" runat="server" />
</asp:Content>

