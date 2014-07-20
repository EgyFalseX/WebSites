<%@ Page Title="" Language="C#" MasterPageFile="~/Codes/ESchoolMP.master" AutoEventWireup="true" CodeFile="CDTakdeer.aspx.cs" Inherits="CDTakdeer" %>


<%@ Register src="UC/CDTakdeer.ascx" tagname="CDTakdeer" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc1:CDTakdeer ID="CDTakdeer1" runat="server" />
    
</asp:Content>

