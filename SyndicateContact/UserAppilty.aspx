<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="UserAppilty.aspx.cs" Inherits="UserAppilty" %>

<%@ Register src="UC/UserAppilty.ascx" tagname="UserAppilty" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc1:UserAppilty ID="UserAppilty1" runat="server" />
    
</asp:Content>

