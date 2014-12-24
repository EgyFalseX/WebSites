<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="schoolPageViewer.aspx.cs" Inherits="ViewMenu" Title="إيجكس للحاسبات ونظم الإدارة" %>

<%@ Register src="UC/schoolPageViewer.ascx" tagname="schoolPageViewer" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc1:schoolPageViewer ID="schoolPageViewer1" runat="server" />
    
    </asp:Content>

