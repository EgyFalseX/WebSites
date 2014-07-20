<%@ Page Title="" Language="C#" MasterPageFile="~/Codes/ESchoolMP.master" AutoEventWireup="true" CodeFile="CDAlokobat.aspx.cs" Inherits="CDAlokobat" %>


<%@ Register src="UC/CDAlokobat.ascx" tagname="CDAlokobat" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc1:CDAlokobat ID="CDAlokobat1" runat="server" />
    
</asp:Content>

