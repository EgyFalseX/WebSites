<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="ViewContracUs.aspx.cs" Inherits="ViewContracUs" %>

<%@ Register src="UC/ViewContracUs.ascx" tagname="ViewContracUs" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ViewContracUs ID="ViewContracUs1" runat="server" />
</asp:Content>

