<%@ Page Language="C#" MasterPageFile="~/Code/empkgMasterPage.master" AutoEventWireup="true" CodeFile="CdBranches.aspx.cs" Inherits="CdBranches" Title="Untitled Page" %>

<%@ Register src="UC/CdBranches.ascx" tagname="CdBranches" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:CdBranches ID="CdBranches1" runat="server" />

</asp:Content>

    
    