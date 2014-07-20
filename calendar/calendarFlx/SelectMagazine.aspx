<%@ Page Title="" Language="C#" MasterPageFile="Magazine.master" AutoEventWireup="true" CodeFile="SelectMagazine.aspx.cs" Inherits="SelectMagazine" %>

<%@ Register src="UC/SelectMagazine.ascx" tagname="SelectMagazine" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:SelectMagazine ID="SelectMagazine1" runat="server" />
</asp:Content>

