<%@ Page Title="" Language="C#" MasterPageFile="~/Codes/ESchoolMP.master" AutoEventWireup="true" CodeFile="CDnationalty.aspx.cs" Inherits="CDnationalty" %>



<%@ Register src="UC/CDnationalty.ascx" tagname="CDnationalty" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc1:CDnationalty ID="CDnationalty1" runat="server" />
    
</asp:Content>

