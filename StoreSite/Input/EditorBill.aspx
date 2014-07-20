<%@ Page Title="" Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="EditorBill.aspx.cs" Inherits="EditorBill" %>

<%@ Register src="UC/EditorBill.ascx" tagname="EditorBill" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:EditorBill ID="EditorBill1" runat="server" />

</asp:Content>

