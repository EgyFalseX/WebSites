<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ServiceQeury.aspx.cs" Inherits="ServiceQeury" %>

<%@ Register src="UC/ServiceQeury.ascx" tagname="ServiceQeury" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ServiceQeury ID="ServiceQeury1" runat="server" />
</asp:Content>

