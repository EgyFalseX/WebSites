<%@ Page Title="" Language="C#" MasterPageFile="~/ETSTQuery/master.master" AutoEventWireup="true" CodeFile="member_no_rplyViewer.aspx.cs" Inherits="member_no_rplyViewer" %>

<%@ Register src="UC/member_no_rplyViewer.ascx" tagname="member_no_rplyViewer" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
   
    <uc1:member_no_rplyViewer ID="member_no_rplyViewer1" runat="server" />
   
</asp:Content>

