<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SBAddResearch.aspx.cs" Inherits="SBAddResearch" %>

<%@ Register src="UserControls06/SBAddResearch.ascx" tagname="SBAddResearch" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <uc1:SBAddResearch ID="SBAddResearch1" runat="server" />
</asp:Content>

