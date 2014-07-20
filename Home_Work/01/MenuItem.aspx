<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="MenuItem.aspx.cs" Inherits="MenuItem" %>

<%@ Register src="UC/MenuItem.ascx" tagname="MenuItem" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <uc1:MenuItem ID="MenuItem1" runat="server" />
   
</asp:Content>

