<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StuMenuEditor.aspx.cs" Inherits="StuMenuEditor" Title="Untitled Page" %>

<%@ Register src="UserControls06/StuMenuEditor.ascx" tagname="StuMenuEditor" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:StuMenuEditor ID="StuMenuEditor1" runat="server" />
</asp:Content>

