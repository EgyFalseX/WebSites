<%@ Page Title="" Language="C#" MasterPageFile="~/Input/empkgMasterPage.master" AutoEventWireup="true" CodeFile="EditorBankSarf.aspx.cs" Inherits="EditorBankSarf" %>

<%@ Register src="UC/EditorBankSarf.ascx" tagname="EditorBankSarf" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EditorBankSarf ID="EditorBankSarf1" runat="server" />
</asp:Content>

