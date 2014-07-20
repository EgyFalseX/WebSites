<%@ Page Title="" Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="EditorDailyConstraints.aspx.cs" Inherits="EditorDailyConstraints" %>

<%@ Register src="UC/EditorDailyConstraints.ascx" tagname="EditorDailyConstraints" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:EditorDailyConstraints ID="EditorDailyConstraints1" runat="server" />

</asp:Content>

