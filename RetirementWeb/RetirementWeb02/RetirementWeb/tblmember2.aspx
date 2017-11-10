<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="tblmember2.aspx.cs" Inherits="tblmember2" %>

<%@ Register src="UC/tblmember2.ascx" tagname="tblmember" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">

    <uc1:tblmember ID="tblmember1" runat="server" />

</asp:Content>

