<%@ Page Title="" Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="EditorCommercialBill.aspx.cs" Inherits="EditorCommercialBill" %>



<%@ Register src="UC/EditorCommercialBill.ascx" tagname="EditorCommercialBill" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <uc1:EditorCommercialBill ID="EditorCommercialBill1" runat="server" />


</asp:Content>

