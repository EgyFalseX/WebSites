<%@ Page Title="" Language="C#" MasterPageFile="~/Query/empkgMasterPage.master" AutoEventWireup="true" CodeFile="CommunicationGrid.aspx.cs" Inherits="CommunicationGrid" %>

<%@ Register src="~/Query/UC/CommunicationGrid.ascx" tagname="CommunicationGrid" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:CommunicationGrid ID="CommunicationGrid1" runat="server" />
</asp:Content>

