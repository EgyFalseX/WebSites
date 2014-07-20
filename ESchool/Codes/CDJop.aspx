<%@ Page Title="" Language="C#" MasterPageFile="~/Codes/ESchoolMP.master" AutoEventWireup="true" CodeFile="CDJop.aspx.cs" Inherits="CDJop" %>

<%@ Register src="UC/CDJop.ascx" tagname="CDJop" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc1:CDJop ID="CDJop1" runat="server" />
    
</asp:Content>

