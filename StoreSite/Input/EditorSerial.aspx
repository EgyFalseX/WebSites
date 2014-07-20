<%@ Page Title="" Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="EditorSerial.aspx.cs" Inherits="EditorSerial" %>

<%@ Register src="UC/EditorSerial.ascx" tagname="EditorSerial" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EditorSerial ID="EditorSerial1" runat="server" />
</asp:Content>

