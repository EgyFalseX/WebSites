<%@ Page Title="" Language="C#" MasterPageFile="~/Master.master" AutoEventWireup="true" CodeFile="Editadvcourse.aspx.cs" Inherits="Editadvcourse" %>

<%@ Register src="UC/Editadvcourse.ascx" tagname="Editadvcourse" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:Editadvcourse ID="Editadvcourse1" runat="server" />
</asp:Content>

