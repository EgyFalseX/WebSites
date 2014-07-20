<%@ Page Title="" Language="C#" MasterPageFile="~/Codes/ESchoolMP.master" AutoEventWireup="true" CodeFile="CDAlhasas.aspx.cs" Inherits="CDAlhasas" %>

<%@ Register src="UC/CDAlhasas.ascx" tagname="CDAlhasas" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <uc1:CDAlhasas ID="CDAlhasas1" runat="server" />
</asp:Content>

