<%@ Page Title="" Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="EditorCustomerFastEdit.aspx.cs" Inherits="EditorCustomerFastEdit" %>



<%@ Register src="UC/EditorCustomerFastEdit.ascx" tagname="EditorCustomerFastEdit" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc1:EditorCustomerFastEdit ID="EditorCustomerFastEdit1" runat="server" />
    
</asp:Content>

