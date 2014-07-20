<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="ExportTblMembers.aspx.cs" Inherits="ExportTblMembers" %>



<%@ Register src="UC/ExportTblMembers.ascx" tagname="ExportTblMembers" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" runat="Server">
    
    
    
    <uc1:ExportTblMembers ID="ExportTblMembers1" runat="server" />
    
    
    
</asp:Content>

