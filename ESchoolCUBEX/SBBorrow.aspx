<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SBBorrow.aspx.cs" Inherits="SBBorrow" %>

<%@ Register src="UserControls06/SBBorrow.ascx" tagname="SBBorrow" tagprefix="uc1" %>
<%@ Register src="UserControls06/SBBookDetials.ascx" tagname="sbbookdetials" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:SBBorrow ID="SBBorrow1" runat="server" />
</asp:Content>

