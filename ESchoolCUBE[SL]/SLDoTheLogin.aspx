<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="SLDoTheLogin.aspx.cs" Inherits="SBBorrow" %>

<%@ Register src="UserControl/SLDoTheLogin.ascx" tagname="SLDoTheLogin" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc3:SLDoTheLogin ID="SLDoTheLogin1" runat="server" />
</asp:Content>

