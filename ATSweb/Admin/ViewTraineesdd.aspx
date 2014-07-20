<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="ViewTraineesdd.aspx.cs" Inherits="ViewTraineesdd" %>

<%@ Register src="UC/ViewTraineesdd.ascx" tagname="ViewTraineesdd" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ViewTraineesdd ID="ViewTraineesdd1" runat="server" />
</asp:Content>

