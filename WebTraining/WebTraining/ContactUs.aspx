<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="ContactUs" %>
<%@ Register src="UC/ContactUs.ascx" tagname="ContactUs" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ContactUs ID="ContactUs1" runat="server" />
</asp:Content>
