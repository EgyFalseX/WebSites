<%@ Page Title="" Language="C#" MasterPageFile="Magazine.master" AutoEventWireup="true" CodeFile="MagazineDetailsAdmin.aspx.cs" Inherits="MagazineDetailsAdmin" %>

<%@ Register src="UC/MagazineDetailsAdminUC.ascx" tagname="MagazineDetailsAdminUC" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:MagazineDetailsAdminUC ID="MagazineDetailsAdminUC1" runat="server" />
</asp:Content>

