<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="ContactUsEditor.aspx.cs" Inherits="ContactUsEditor" %>

<%@ Register src="UC/ContactUsEditor.ascx" tagname="ContactUs" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ContactUs ID="ContactUs1" runat="server" />
</asp:Content>

