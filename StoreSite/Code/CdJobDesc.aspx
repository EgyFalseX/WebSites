<%@ Page Language="C#" MasterPageFile="~/Code/empkgMasterPage.master" AutoEventWireup="true" CodeFile="CdJobDesc.aspx.cs" Inherits="CdJobDesc" Title="Untitled Page" %>

<%@ Register src="UC/CdJobDesc.ascx" tagname="CdJobDesc" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:CdJobDesc ID="CdJobDesc1" runat="server" />

</asp:Content>