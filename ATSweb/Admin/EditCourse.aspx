<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="EditCourse.aspx.cs" Inherits="EditCourse" %>

<%@ Register src="UC/EditCourse.ascx" tagname="EditCourse" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EditCourse ID="EditCourse1" runat="server" />
</asp:Content>

