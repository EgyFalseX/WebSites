<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="EditGridCourse.aspx.cs" Inherits="EditGridCourse" %>

<%@ Register src="UC/EditGridCourse.ascx" tagname="EditGridCourse" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EditGridCourse ID="EditGridCourse1" runat="server" />
</asp:Content>

