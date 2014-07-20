<%@ Page Title="" Language="C#" MasterPageFile="Magazine.master" AutoEventWireup="true" CodeFile="Magazines.aspx.cs" Inherits="Magazines" %>

<%@ Register src="UC/Magazines.ascx" tagname="Magazines" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:Magazines ID="Magazines1" runat="server" />
</asp:Content>

