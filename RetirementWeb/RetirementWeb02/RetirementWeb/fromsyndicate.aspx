<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="fromsyndicate.aspx.cs" Inherits="fromsyndicate" %>



<%@ Register src="UC/fromsyndicate.ascx" tagname="fromsyndicate" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">

    <uc1:fromsyndicate ID="fromsyndicate1" runat="server" />

</asp:Content>

