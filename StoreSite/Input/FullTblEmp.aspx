<%@ Page Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="FullTblEmp.aspx.cs" Inherits="Default3" Title="Untitled Page" %>


<%@ Register src="UC/EditorEmp.ascx" tagname="EditorEmp" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EditorEmp ID="EditorEmp1" runat="server" />
    </asp:Content>

