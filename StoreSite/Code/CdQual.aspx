<%@ Page Title="" Language="C#" MasterPageFile="~/Code/empkgMasterPage.master" AutoEventWireup="true" CodeFile="CdQual.aspx.cs" Inherits="Default2" %>

<%@ Register src="UC/CdQual.ascx" tagname="CdQual" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:CdQual ID="CdQual1" runat="server" />

</asp:Content>

