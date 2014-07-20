<%@ Page Title="" Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Reports" %>

<%@ Register src="UC/Reports.ascx" tagname="Reports" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc1:Reports ID="Reports1" runat="server" />
    
</asp:Content>

