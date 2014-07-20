<%@ Page Title="" Language="C#" MasterPageFile="~/Codes/ESchoolMP.master" AutoEventWireup="true" CodeFile="CDQualification.aspx.cs" Inherits="CDQualification" %>



<%@ Register src="UC/CDQualification.ascx" tagname="CDQualification" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc1:CDQualification ID="CDQualification1" runat="server" />
    
</asp:Content>

