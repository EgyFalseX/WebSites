<%@ Page Title="" Language="C#" MasterPageFile="~/Codes/ESchoolMP.master" AutoEventWireup="true" CodeFile="CDJOBCases.aspx.cs" Inherits="CDJOBCases" %>


<%@ Register src="UC/CDJOBCases.ascx" tagname="CDJOBCases" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc1:CDJOBCases ID="CDJOBCases1" runat="server" />
    
</asp:Content>

