<%@ Page Title="" Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="EditorRoles.aspx.cs" Inherits="EditorRoles" %>


<%@ Register src="UC/EditorRoles.ascx" tagname="EditorRoles" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <uc1:EditorRoles ID="EditorRoles1" runat="server" />


</asp:Content>

