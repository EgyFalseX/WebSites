<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="ViewSyndicateCount.aspx.cs" Inherits="ViewSyndicateCount" %>

<%@ Register src="UC/ViewSyndicateCount.ascx" tagname="ViewSyndicateCount" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
   
    <uc1:ViewSyndicateCount ID="ViewSyndicateCount1" runat="server" />
   
</asp:Content>

