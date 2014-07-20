<%@ Page Title="" Language="C#" MasterPageFile="calendarFlx.master" AutoEventWireup="true" CodeFile="ChangePasswordcalendar.aspx.cs" Inherits="ChangePasswordcalendar" %>

<%@ Register src="UC/ChangePasswordcalendarUC.ascx" tagname="ChangePasswordcalendarUC" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ChangePasswordcalendarUC ID="ChangePasswordcalendarUC1" runat="server" />
</asp:Content>

