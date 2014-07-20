<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="TBLAllMember.aspx.cs" Inherits="TBLAllMember" %>

<%@ Register src="UC/TBLAllMember.ascx" tagname="TBLAllMember" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc1:TBLAllMember ID="TBLAllMember1" runat="server" />
    
</asp:Content>

