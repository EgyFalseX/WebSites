<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="CDSyndicate.aspx.cs" Inherits="CDSyndicate" %>

<%@ Register src="UC/CDGov.ascx" tagname="CDGov" tagprefix="uc1" %>

<%@ Register src="UC/CDSyndicate.ascx" tagname="CDSyndicate" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc2:CDSyndicate ID="CDSyndicate1" runat="server" />
    
</asp:Content>

