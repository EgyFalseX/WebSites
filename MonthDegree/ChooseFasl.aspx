<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="ChooseFasl.aspx.cs" Inherits="ChooseFasl" %>

<%@ Register src="UC/ChooseFasl.ascx" tagname="ChooseFasl" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ChooseFasl ID="ChooseFasl1" runat="server" />
</asp:Content>

