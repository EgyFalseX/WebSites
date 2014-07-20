<%@ Page Title="" Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="EditorUserAtt.aspx.cs" Inherits="EditorUserAtt" %>

<%@ Register src="UC/EditorUserAtt.ascx" tagname="EditorUserAtt" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:EditorUserAtt ID="EditorUserAtt1" runat="server" />

</asp:Content>

