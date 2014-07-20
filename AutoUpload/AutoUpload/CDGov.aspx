<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="CDGov.aspx.cs" Inherits="CDGov" %>

<%@ Register src="UC/CDGov.ascx" tagname="CDGov" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <uc1:CDGov ID="CDGov1" runat="server" />
</asp:Content>

