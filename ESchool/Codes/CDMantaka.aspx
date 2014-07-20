<%@ Page Title="" Language="C#" MasterPageFile="~/Codes/ESchoolMP.master" AutoEventWireup="true" CodeFile="CDMantaka.aspx.cs" Inherits="CDMantaka" %>


<%@ Register src="UC/CDMantaka.ascx" tagname="CDMantaka" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc1:CDMantaka ID="CDMantaka1" runat="server" />
    
</asp:Content>

