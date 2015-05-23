<%@ Page Title="" Language="C#" MasterPageFile="~/RetirementWeb/master.master" AutoEventWireup="true" CodeFile="ViewChanges.aspx.cs" Inherits="ViewChanges" %>

<%@ Register src="UC/ViewChanges.ascx" tagname="ViewChanges" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <uc1:ViewChanges ID="ViewChanges1" runat="server" />
</asp:Content>

