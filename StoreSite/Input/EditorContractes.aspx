<%@ Page Title="" Language="C#" MasterPageFile="~/Input/empkgMasterPage.master" AutoEventWireup="true" CodeFile="EditorContractes.aspx.cs" Inherits="EditorContractes" %>


<%@ Register src="UC/EditorContractes.ascx" tagname="EditorContractes" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EditorContractes ID="EditorContractes1" runat="server" />
    </asp:Content>

