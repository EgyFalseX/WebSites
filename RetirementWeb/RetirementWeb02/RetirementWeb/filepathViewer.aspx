<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="filepathViewer.aspx.cs" Inherits="filepathViewer" %>

<%@ Register src="UC/filepathViewer.ascx" tagname="filepathViewer" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">

    <uc1:filepathViewer ID="filepathViewer1" runat="server" />

</asp:Content>

