<%@ Page Title="" Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="SLUserManager.aspx.cs" Inherits="SBAddStuBook" %>

<%@ Register src="UserControl/SLUserManager.ascx" tagname="SLUserManager" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc2:SLUserManager ID="SLUserManager1" runat="server" />
    </asp:Content>

