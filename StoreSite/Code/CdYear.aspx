<%@ Page Language="C#" MasterPageFile="~/Code/empkgMasterPage.master" AutoEventWireup="true" CodeFile="CdYear.aspx.cs" Inherits="_Default" Title="Untitled Page" %>

<%@ Register src="UC/CdYear.ascx" tagname="CdYear" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc1:CdYear ID="CdYear1" runat="server" />
    
</asp:Content>

