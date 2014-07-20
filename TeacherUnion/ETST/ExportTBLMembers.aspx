<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="ExportTBLMembers.aspx.cs" Inherits="ExportTBLMembers" %>



<%@ Register src="UC/ExportTBLMembers.ascx" tagname="ExportTBLMembers" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc1:ExportTBLMembers ID="ExportTBLMembers1" runat="server" />
    
</asp:Content>

