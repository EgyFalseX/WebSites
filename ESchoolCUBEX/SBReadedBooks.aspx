<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SBReadedBooks.aspx.cs" Inherits="SBReadedBooks" %>

<%@ Register src="UserControls06/SBReadedBooks.ascx" tagname="SBReadedBooks" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:SBReadedBooks ID="SBReadedBooks1" runat="server" />
</asp:Content>

