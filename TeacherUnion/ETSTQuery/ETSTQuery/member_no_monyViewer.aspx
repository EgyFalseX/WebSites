<%@ Page Title="" Language="C#" MasterPageFile="~/ETSTQuery/master.master" AutoEventWireup="true" CodeFile="member_no_monyViewer.aspx.cs" Inherits="member_no_monyViewer" %>

<%@ Register src="UC/member_no_monyViewer.ascx" tagname="member_no_monyViewer" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">

   
    <uc1:member_no_monyViewer ID="member_no_monyViewer1" runat="server" />

   
</asp:Content>

