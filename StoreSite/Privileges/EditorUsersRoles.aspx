<%@ Page Title="" Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="EditorUsersRoles.aspx.cs" Inherits="EditorUsersRoles" %>


<%@ Register src="UC/EditorUsersRoles.ascx" tagname="EditorUsersRoles" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <uc1:EditorUsersRoles ID="EditorUsersRoles1" runat="server" />


</asp:Content>

