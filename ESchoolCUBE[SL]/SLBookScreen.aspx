<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="SLBookScreen.aspx.cs" Inherits="SBResearchSearch" %>

<%@ Register src="UserControl/SLBookScreen.ascx" tagname="SLBookScreen" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc2:SLBookScreen ID="SLBookScreen1" runat="server" />
</asp:Content>

