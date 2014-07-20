<%@ Page Title="" Language="C#" MasterPageFile="~/Codes/ESchoolMP.master" AutoEventWireup="true" CodeFile="CDEmpJop.aspx.cs" Inherits="CDEmpJop" %>


<%@ Register src="UC/CDEmpJop.ascx" tagname="CDEmpJop" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc1:CDEmpJop ID="CDEmpJop1" runat="server" />
    
</asp:Content>

