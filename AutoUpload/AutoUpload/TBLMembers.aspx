<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="TBLMembers.aspx.cs" Inherits="TBLMembers" %>

<%@ Register src="UC/TBLMembers.ascx" tagname="TBLMembers" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <uc1:TBLMembers ID="TBLMembers1" runat="server" />
</asp:Content>

