<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="ViewCourseDetails.aspx.cs" Inherits="ViewCourseDetails" %>

<%@ Register src="UC/ViewCourseDetails.ascx" tagname="ViewCourseDetails" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ViewCourseDetails ID="ViewCourseDetails1" runat="server" />
</asp:Content>

