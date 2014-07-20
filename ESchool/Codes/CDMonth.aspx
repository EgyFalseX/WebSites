<%@ Page Title="" Language="C#" MasterPageFile="~/Codes/ESchoolMP.master" AutoEventWireup="true" CodeFile="CDMonth.aspx.cs" Inherits="CDMonth" %>


<%@ Register src="UC/CDMonth.ascx" tagname="CDMonth" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc1:CDMonth ID="CDMonth1" runat="server" />
    
</asp:Content>

