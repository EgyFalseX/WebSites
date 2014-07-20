<%@ Page Title="" Language="C#" MasterPageFile="~/ETSTQuery/master.master" AutoEventWireup="true" CodeFile="teabea_no_rplyViewer.aspx.cs" Inherits="teabea_no_rplyViewer" %>

<%@ Register src="UC/teabea_no_rplyViewer.ascx" tagname="teabea_no_rplyViewer" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
   
    <uc1:teabea_no_rplyViewer ID="teabea_no_rplyViewer1" runat="server" />
   
</asp:Content>

