<%@ Page Title="" Language="C#" MasterPageFile="~/master.master" AutoEventWireup="true" CodeFile="ViewMembers.aspx.cs" Inherits="Default2" %>

<%@ Register src="UC/ViewMembers.ascx" tagname="ViewMembers" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <uc1:ViewMembers ID="ViewMembers1" runat="server" />
</asp:Content>

