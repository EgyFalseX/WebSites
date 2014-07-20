<%@ Page Title="" Language="C#" MasterPageFile="Magazine.master" AutoEventWireup="true" CodeFile="MagazinesAdmin.aspx.cs" Inherits="MagazinesAdmin" %>

<%@ Register src="UC/MagazinesAdminUC.ascx" tagname="MagazinesAdminUC" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:MagazinesAdminUC ID="MagazinesAdminUC1" runat="server" />
</asp:Content>

