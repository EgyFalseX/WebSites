<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="MeetingEditor.aspx.cs" Inherits="MeetingEditor" %>

<%@ Register src="UC/MeetingEditor.ascx" tagname="MeetingEditor" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc1:MeetingEditor ID="MeetingEditor1" runat="server" />
    
</asp:Content>

