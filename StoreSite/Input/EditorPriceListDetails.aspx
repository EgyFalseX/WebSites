<%@ Page Title="" Language="C#" MasterPageFile="~/Input/empkgMasterPage.master" AutoEventWireup="true" CodeFile="EditorPriceListDetails.aspx.cs" Inherits="EditorPriceListDetails" %>


<%@ Register src="UC/EditorPriceListDetails.ascx" tagname="EditorPriceListDetails" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
    <uc1:EditorPriceListDetails ID="EditorPriceListDetails1" runat="server" />
    
    
    </asp:Content>

