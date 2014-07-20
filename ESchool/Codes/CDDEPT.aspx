<%@ Page Title="" Language="C#" MasterPageFile="~/Codes/ESchoolMP.master" AutoEventWireup="true" CodeFile="CDDEPT.aspx.cs" Inherits="CDDEPT" %>


<%@ Register src="UC/CDDEPT.ascx" tagname="CDDEPT" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc1:CDDEPT ID="CDDEPT1" runat="server" />
    
</asp:Content>

