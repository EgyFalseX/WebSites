<%@ Page Title="" Language="C#" MasterPageFile="~/Input/empkgMasterPage.master" AutoEventWireup="true" CodeFile="EditorContractItems.aspx.cs" Inherits="EditorContractItems" %>

<%@ Register src="UC/EditorContractItems.ascx" tagname="EditorContractItems" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc1:EditorContractItems ID="EditorContractItems1" runat="server" />
    
    </asp:Content>

