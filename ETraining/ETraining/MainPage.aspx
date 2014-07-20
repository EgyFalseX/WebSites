<%@ Page Title="" Language="C#" MasterPageFile="~/ETraining/EESoftMaster.master" AutoEventWireup="true" CodeFile="MainPage.aspx.cs" Inherits="MainPage" %>

<%@ Register src="UC/ControlMenu.ascx" tagname="ControlMenu" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ControlMenu ID="ControlMenu1" runat="server" />
</asp:Content>

