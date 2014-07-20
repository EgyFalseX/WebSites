<%@ Page Title="" Language="C#" MasterPageFile="~/Codes/ESchoolMP.master" AutoEventWireup="true" CodeFile="CDEdara.aspx.cs" Inherits="CDEdara" %>


<%@ Register src="UC/CDEdara.ascx" tagname="CDEdara" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc1:CDEdara ID="CDEdara1" runat="server" />
    
</asp:Content>

