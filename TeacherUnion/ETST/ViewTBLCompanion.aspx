<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="ViewTBLCompanion.aspx.cs" Inherits="ViewTBLCompanion" %>

<%@ Register src="UC/ViewTBLCompanion.ascx" tagname="ViewTBLCompanion" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">

    <uc1:ViewTBLCompanion ID="ViewTBLCompanion1" runat="server" />

</asp:Content>

