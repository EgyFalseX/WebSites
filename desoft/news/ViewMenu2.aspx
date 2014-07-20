<%@ Page Title="" Language="C#" MasterPageFile="~/news/Master.master" AutoEventWireup="true" CodeFile="ViewMenu2.aspx.cs" Inherits="ViewMenu2" %>

<%@ Register src="UC/Viewer2.ascx" tagname="Viewer2" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:Viewer2 ID="Viewer21" runat="server" />
</asp:Content>

