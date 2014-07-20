<%@ Page Title="" Language="C#" MasterPageFile="~/Codes/ESchoolMP.master" AutoEventWireup="true" CodeFile="CDMarahel.aspx.cs" Inherits="CDMarahel" %>



<%@ Register src="UC/CDMarahel.ascx" tagname="CDMarahel" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc1:CDMarahel ID="CDMarahel1" runat="server" />
    
</asp:Content>

