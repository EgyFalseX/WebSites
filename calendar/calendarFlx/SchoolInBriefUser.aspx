<%@ Page Title="" Language="C#" MasterPageFile="SchoolInBrief.master" AutoEventWireup="true" CodeFile="SchoolInBriefUser.aspx.cs" Inherits="SchoolInBriefUser" %>



<%@ Register src="UC/SchoolInBriefUser.ascx" tagname="SchoolInBriefUser" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:SchoolInBriefUser ID="SchoolInBriefUser1" runat="server" />
    </asp:Content>

