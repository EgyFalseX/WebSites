<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="CourseViewer.aspx.cs" Inherits="CourseViewer" %>

<%@ Register src="UC/CourseViewer.ascx" tagname="CourseViewer" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:CourseViewer ID="CourseViewer1" runat="server" />
</asp:Content>

