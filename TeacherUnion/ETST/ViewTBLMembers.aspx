<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="ViewTBLMembers.aspx.cs" Inherits="ViewTBLMembers" %>

<%@ Register src="UC/ViewTBLMembers.ascx" tagname="ViewTBLMembers" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">

   
    <uc1:ViewTBLMembers ID="ViewTBLMembers1" runat="server" />

   
</asp:Content>

