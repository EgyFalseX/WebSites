<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="MemCardEditor.aspx.cs" Inherits="MemCardEditor" %>



<%@ Register src="UC/MemCardEditor.ascx" tagname="MemCardEditor" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc1:MemCardEditor ID="MemCardEditor1" runat="server" />
    
</asp:Content>

