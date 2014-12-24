<%@ Page Language="C#" MasterPageFile="MasterPage.master" AutoEventWireup="true" CodeFile="SubjectViewPage.aspx.cs" Inherits="SubjectViewPage" Title="إيجكس للحاسبات ونظم الإدارة" %>

<%@ Register src="UC/SubjectPageViewer.ascx" tagname="SubjectPageViewer" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc1:SubjectPageViewer ID="schoolPageViewer1" runat="server" />
    
    </asp:Content>

