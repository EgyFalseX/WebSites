<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="CDCompanionType.aspx.cs" Inherits="CDCompanionType" %>

<%@ Register src="UC/CDGov.ascx" tagname="CDGov" tagprefix="uc1" %>

<%@ Register src="UC/CDCompanionType.ascx" tagname="CDCompanionType" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc2:CDCompanionType ID="CDCompanionType1" runat="server" />
    
</asp:Content>

