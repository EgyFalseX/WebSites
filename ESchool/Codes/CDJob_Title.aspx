<%@ Page Title="" Language="C#" MasterPageFile="~/Codes/ESchoolMP.master" AutoEventWireup="true" CodeFile="CDJob_Title.aspx.cs" Inherits="CDJob_Title" %>


<%@ Register src="UC/CDJob_Title.ascx" tagname="CDJob_Title" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc1:CDJob_Title ID="CDJob_Title1" runat="server" />
    
</asp:Content>

