<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="CompanionCardEditor.aspx.cs" Inherits="CompanionCardEditor" %>


<%@ Register src="UC/CompanionCardEditor.ascx" tagname="CompanionCardEditor" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    
    <uc1:CompanionCardEditor ID="CompanionCardEditor1" runat="server" />
    
    
</asp:Content>

