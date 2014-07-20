<%@ Page Title="" Language="C#" MasterPageFile="~/Code/empkgMasterPage.master" AutoEventWireup="true" CodeFile="CDBank.aspx.cs" Inherits="CDBank" %>

<%@ Register src="UC/CDBank.ascx" tagname="CDBank" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:CDBank ID="CDBank1" runat="server" />
</asp:Content>

