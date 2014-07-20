<%@ Page Language="C#" MasterPageFile="~/Code/empkgMasterPage.master" AutoEventWireup="true" CodeFile="CdTransactionType.aspx.cs" Inherits="_Default" Title="Untitled Page" %>

<%@ Register src="UC/CdTransactionType.ascx" tagname="CdTransactionType" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc1:CdTransactionType ID="CdTransactionType1" runat="server" />
    
</asp:Content>

