<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="SLLibraryScreen.aspx.cs" Inherits="SBBorrow" %>

<%@ Register src="UserControl/SLLibraryScreen.ascx" tagname="SLLibraryScreen" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc2:SLLibraryScreen ID="SLLibraryScreen1" runat="server" />
</asp:Content>

