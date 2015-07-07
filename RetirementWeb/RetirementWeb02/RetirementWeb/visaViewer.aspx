<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="visaViewer.aspx.cs" Inherits="visaViewer" %>



<%@ Register src="UC/visaViewer.ascx" tagname="visaViewer" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">

    

    <uc1:visaViewer ID="visaViewer1" runat="server" />

    

</asp:Content>

