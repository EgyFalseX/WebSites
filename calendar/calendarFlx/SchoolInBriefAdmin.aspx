<%@ Page Title="" Language="C#" MasterPageFile="SchoolInBrief.master" AutoEventWireup="true" CodeFile="SchoolInBriefAdmin.aspx.cs" Inherits="SchoolInBriefAdmin" %>



<%@ Register src="UC/SchoolInBriefAdmin.ascx" tagname="SchoolInBriefAdmin" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:SchoolInBriefAdmin ID="SchoolInBriefAdmin1" runat="server" />
    </asp:Content>

