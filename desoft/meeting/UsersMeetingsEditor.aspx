<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="UsersMeetingsEditor.aspx.cs" Inherits="UsersMeetingsEditor" %>

<%@ Register src="UC/UsersMeetingsEditor.ascx" tagname="UsersMeetingsEditor" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc1:UsersMeetingsEditor ID="UsersMeetingsEditor1" runat="server" />
    
</asp:Content>

