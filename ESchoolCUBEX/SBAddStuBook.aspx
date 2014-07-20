<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SBAddStuBook.aspx.cs" Inherits="SBAddStuBook" %>

<%@ Register src="UserControls06/SBAddStuBook.ascx" tagname="SBAddStuBook" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <uc1:SBAddStuBook ID="SBAddStuBook1" runat="server" />
</asp:Content>

