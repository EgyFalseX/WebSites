<%@ Page Title="" Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="EditorUsers.aspx.cs" Inherits="EditorUsers" %>


<%@ Register src="UC/EditorUsers.ascx" tagname="EditorUsers" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    <uc1:EditorUsers ID="EditorUsers1" runat="server" />



</asp:Content>

