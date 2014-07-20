<%@ Page Title="" Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="EditorAksat.aspx.cs" Inherits="EditorCommercialBill" %>



<%@ Register src="UC/EditorAksat.ascx" tagname="EditorAksat" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <uc1:EditorAksat ID="EditorAksat1" runat="server" />


</asp:Content>

