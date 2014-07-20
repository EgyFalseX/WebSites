<%@ Page Title="" Language="C#" MasterPageFile="calendarFlx.master" AutoEventWireup="true" CodeFile="calendarEng.aspx.cs" Inherits="calendarEng" %>

<%@ Register src="UC/calendarEngUC.ascx" tagname="calendarEngUC" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:calendarEngUC ID="calendarEngUC1" runat="server" />
</asp:Content>

