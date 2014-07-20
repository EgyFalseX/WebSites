<%@ Page Title="" Language="C#" MasterPageFile="~/Inputs/ESchoolMP.master" AutoEventWireup="true" CodeFile="TBLAsase.aspx.cs" Inherits="TBLAsase" %>


<%@ Register src="UC/TBLAsase.ascx" tagname="TBLAsase" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc1:TBLAsase ID="TBLAsase1" runat="server" />
    
</asp:Content>

