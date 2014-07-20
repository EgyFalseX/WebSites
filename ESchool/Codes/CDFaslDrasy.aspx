<%@ Page Title="" Language="C#" MasterPageFile="~/Codes/ESchoolMP.master" AutoEventWireup="true" CodeFile="CDFaslDrasy.aspx.cs" Inherits="CDFaslDrasy" %>


<%@ Register src="UC/CDFaslDrasy.ascx" tagname="CDFaslDrasy" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc1:CDFaslDrasy ID="CDFaslDrasy1" runat="server" />
    
</asp:Content>

