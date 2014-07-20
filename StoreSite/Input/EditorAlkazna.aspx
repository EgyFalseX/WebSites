<%@ Page Title="" Language="C#" MasterPageFile="~/Input/empkgMasterPage.master" AutoEventWireup="true" CodeFile="EditorAlkazna.aspx.cs" Inherits="EditorAlkazna" %>

<%@ Register src="UC/EditorAlkazna.ascx" tagname="EditorAlkazna" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EditorAlkazna ID="EditorAlkazna1" runat="server" />
</asp:Content>

