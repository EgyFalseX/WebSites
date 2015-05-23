<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="tblpic.aspx.cs" Inherits="tblpic" %>

<%@ Register src="UC/tblpic.ascx" tagname="tblpic" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">

    <uc1:tblpic ID="tblpic1" runat="server" />

</asp:Content>

