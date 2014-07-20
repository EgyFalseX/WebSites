<%@ Page Title="" Language="C#" MasterPageFile="~/ETSTQuery/master.master" AutoEventWireup="true" CodeFile="tabea_no_monyViewer.aspx.cs" Inherits="tabea_no_monyViewer" %>

<%@ Register src="UC/tabea_no_monyViewer.ascx" tagname="tabea_no_monyViewer" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">
 
    <uc1:tabea_no_monyViewer ID="tabea_no_monyViewer1" runat="server" />
 
</asp:Content>

