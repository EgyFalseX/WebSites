<%@ Page Title="" Language="C#" MasterPageFile="~/Codes/ESchoolMP.master" AutoEventWireup="true" CodeFile="CDHaletalked.aspx.cs" Inherits="CDHaletalked" %>


<%@ Register src="UC/CDHaletalked.ascx" tagname="CDHaletalked" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc1:CDHaletalked ID="CDHaletalked1" runat="server" />
    
</asp:Content>

