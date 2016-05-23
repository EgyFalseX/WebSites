<%@ Page Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="ViewCourseNoTimeDetailsViewer.aspx.cs" Inherits="ViewCourseNoTimeDetailsViewer" Title="بيانات ومعلومات" %>

<%@ Register src="UC/ViewCourseNoTimeDetailsViewer.ascx" tagname="ViewDetails" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc1:ViewDetails ID="ViewDetails1" runat="server" />
    
    </asp:Content>

