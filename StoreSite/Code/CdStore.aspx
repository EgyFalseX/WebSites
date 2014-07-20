<%@ Page Title="" Language="C#" MasterPageFile="~/Code/empkgMasterPage.master" AutoEventWireup="true" CodeFile="CdStore.aspx.cs" Inherits="Default2" %>

<%@ Register src="UC/CdStore.ascx" tagname="CdStore" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc1:CdStore ID="CdStore1" runat="server" />
    
</asp:Content>

