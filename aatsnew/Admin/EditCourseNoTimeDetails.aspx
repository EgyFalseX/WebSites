<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="EditCourseNoTimeDetails.aspx.cs" Inherits="EditCourseNoTimeDetails" %>

<%@ Register src="UC/EditCourseNoTimeDetails.ascx" tagname="EditCourseDetails" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc1:EditCourseDetails ID="EditCourseDetails1" runat="server" />
    
</asp:Content>

