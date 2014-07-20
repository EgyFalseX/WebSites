<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="UserInfo.aspx.cs" Inherits="UserInfo" %>

<%@ Register src="UC/UserInfo.ascx" tagname="UserInfo" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc1:UserInfo ID="UserInfo1" runat="server" />
    
</asp:Content>

