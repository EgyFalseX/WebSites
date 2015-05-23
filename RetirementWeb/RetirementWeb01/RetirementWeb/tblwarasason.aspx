<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="tblwarasason.aspx.cs" Inherits="tblwarasason" %>

<%@ Register src="UC/tblwarasason.ascx" tagname="tblwarasason" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">

    <uc1:tblwarasason ID="tblwarasason1" runat="server" />

</asp:Content>

