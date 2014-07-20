<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="CDSubCommitte.aspx.cs" Inherits="CDSubCommitte" %>

<%@ Register src="UC/CDGov.ascx" tagname="CDGov" tagprefix="uc1" %>

<%@ Register src="UC/CDSubCommitte.ascx" tagname="CDSubCommitte" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc2:CDSubCommitte ID="CDSubCommitte1" runat="server" />
    
</asp:Content>

