<%@ Page Language="C#" MasterPageFile="~/Code/empkgMasterPage.master" AutoEventWireup="true" CodeFile="CdMarakez.aspx.cs" Inherits="CdMarakez" Title="Untitled Page" %>

<%@ Register src="UC/CdMarakez.ascx" tagname="CdMarakez" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:CdMarakez ID="CdMarakez1" runat="server" />

</asp:Content>