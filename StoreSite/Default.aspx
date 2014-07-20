<%@ Page Title="" Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register src="MainMenuNoTable.ascx" tagname="MainMenuNoTable" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <uc1:MainMenuNoTable ID="MainMenuNoTable1" runat="server" />

    
    </asp:Content>

