<%@ Page Language="C#" MasterPageFile="MasterPages.master" AutoEventWireup="true" CodeFile="ViewDetails.aspx.cs" Inherits="ViewMenu" Title="بيانات ومعلومات" %>

<%@ Register src="UC/ViewDetails.ascx" tagname="ViewDetails" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc1:ViewDetails ID="ViewDetails1" runat="server" />
    
    </asp:Content>

