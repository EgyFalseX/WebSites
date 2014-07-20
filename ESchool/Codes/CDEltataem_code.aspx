<%@ Page Title="" Language="C#" MasterPageFile="~/Codes/ESchoolMP.master" AutoEventWireup="true" CodeFile="CDEltataem_code.aspx.cs" Inherits="CDEltataem_code" %>


<%@ Register src="UC/CDEltataem_code.ascx" tagname="CDEltataem_code" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc1:CDEltataem_code ID="CDEltataem_code1" runat="server" />
    
</asp:Content>

