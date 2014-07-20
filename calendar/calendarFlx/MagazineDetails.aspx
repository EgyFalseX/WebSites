<%@ Page Title="" Language="C#" MasterPageFile="Magazine.master" AutoEventWireup="true" CodeFile="MagazineDetails.aspx.cs" Inherits="MagazineDetails" %>

<%@ Register src="UC/MagazineDetails.ascx" tagname="MagazineDetails" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:MagazineDetails ID="MagazineDetails1" runat="server" />
</asp:Content>

