<%@ Page Title="" Language="C#" MasterPageFile="~/ETSTQuery/master.master" AutoEventWireup="true" CodeFile="meber_monyViewer.aspx.cs" Inherits="meber_monyViewer" %>

<%@ Register src="UC/meber_monyViewer.ascx" tagname="meber_monyViewer" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
    <uc1:meber_monyViewer ID="meber_monyViewer1" runat="server" />
</asp:Content>

