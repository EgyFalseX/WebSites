<%@ Page Title="" Language="C#" MasterPageFile="~/Codes/ESchoolMP.master" AutoEventWireup="true" CodeFile="CDLogatcode.aspx.cs" Inherits="CDLogatcode" %>


<%@ Register src="UC/CDLogatcode.ascx" tagname="CDLogatcode" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc1:CDLogatcode ID="CDLogatcode1" runat="server" />
    
</asp:Content>

