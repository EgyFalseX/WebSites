<%@ Page Title="" Language="C#" MasterPageFile="~/Codes/ESchoolMP.master" AutoEventWireup="true" CodeFile="CDHealth_office.aspx.cs" Inherits="CDHealth_office" %>


<%@ Register src="UC/CDHealth_office.ascx" tagname="CDHealth_office" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc1:CDHealth_office ID="CDHealth_office1" runat="server" />
    
</asp:Content>

