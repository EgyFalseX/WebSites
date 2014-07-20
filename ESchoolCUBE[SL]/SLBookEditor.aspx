<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="SLBookEditor.aspx.cs" Inherits="SBResearchSearch" %>

<%@ Register src="UserControl/SLBookEditor.ascx" tagname="SLBookEditor" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc1:SLBookEditor ID="SLBookEditor1" runat="server" />
    
</asp:Content>

