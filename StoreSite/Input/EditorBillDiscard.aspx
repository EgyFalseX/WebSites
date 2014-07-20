<%@ Page Title="" Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="EditorBillDiscard.aspx.cs" Inherits="EditorBillDiscard" %>



<%@ Register src="UC/EditorBillDiscard.ascx" tagname="EditorBillDiscard" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:EditorBillDiscard ID="EditorBillDiscard1" runat="server" />

    </asp:Content>

