<%@ Page Title="" Language="C#" MasterPageFile="~/Input/empkgMasterPage.master" AutoEventWireup="true" CodeFile="EditorEdaa.aspx.cs" Inherits="EditorEdaa" %>
<%@ Register src="UC/EditorEdaa.ascx" tagname="EditorEdaa" tagprefix="uc1" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EditorEdaa ID="EditorEdaa1" runat="server" />
    </asp:Content>

