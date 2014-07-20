<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="CDMaritalStatus.aspx.cs" Inherits="CDMaritalStatus" %>

<%@ Register src="UC/CDGov.ascx" tagname="CDGov" tagprefix="uc1" %>

<%@ Register src="UC/CDMaritalStatus.ascx" tagname="CDMaritalStatus" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    
    <uc2:CDMaritalStatus ID="CDMaritalStatus1" runat="server" />
    
</asp:Content>

