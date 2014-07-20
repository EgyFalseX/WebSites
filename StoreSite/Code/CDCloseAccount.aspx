<%@ Page Title="" Language="C#" MasterPageFile="~/Code/empkgMasterPage.master" AutoEventWireup="true" CodeFile="CDCloseAccount.aspx.cs" Inherits="CDCloseAccount" %>


<%@ Register src="UC/CDCloseAccount.ascx" tagname="CDCloseAccount" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:CDCloseAccount ID="CDCloseAccount1" runat="server" />
</asp:Content>

