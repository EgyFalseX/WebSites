<%@ Page Title="" Language="C#" MasterPageFile="~/Codes/ESchoolMP.master" AutoEventWireup="true" CodeFile="CDMawad.aspx.cs" Inherits="CDMawad" %>


<%@ Register src="UC/CDMawad.ascx" tagname="CDMawad" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc1:CDMawad ID="CDMawad1" runat="server" />
    
</asp:Content>

