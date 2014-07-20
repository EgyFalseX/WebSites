<%@ Page Title="" Language="C#" MasterPageFile="~/Input/empkgMasterPage.master" AutoEventWireup="true" CodeFile="EditorPricelists.aspx.cs" Inherits="EditorPricelists" %>


<%@ Register src="UC/EditorPricelists.ascx" tagname="EditorPricelists" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc1:EditorPricelists ID="EditorPricelists1" runat="server" />
    
    </asp:Content>

