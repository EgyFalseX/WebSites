<%@ Page Language="C#" MasterPageFile="~/Code/empkgMasterPage.master" AutoEventWireup="true" CodeFile="CdJob.aspx.cs" Inherits="CdJob" Title="Untitled Page" %>

<%@ Register src="UC/CdJob.ascx" tagname="CdJob" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:CdJob ID="CdJob1" runat="server" />

</asp:Content>