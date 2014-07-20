<%@ Page Language="C#" MasterPageFile="~/Code/empkgMasterPage.master" AutoEventWireup="true" CodeFile="CdHay.aspx.cs" Inherits="CdHay" Title="Untitled Page" %>

<%@ Register src="UC/CdHay.ascx" tagname="CdHay" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:CdHay ID="CdHay1" runat="server" />

</asp:Content>