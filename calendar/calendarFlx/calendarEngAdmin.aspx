<%@ Page Title="" Language="C#" MasterPageFile="calendarFlx.master" AutoEventWireup="true" CodeFile="calendarEngAdmin.aspx.cs" Inherits="calendarEngAdmin" %>

<%@ Register src="UC/calendarEngAdminUC.ascx" tagname="calendarEngAdminUC" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:calendarEngAdminUC ID="calendarEngAdminUC1" runat="server" />
</asp:Content>

