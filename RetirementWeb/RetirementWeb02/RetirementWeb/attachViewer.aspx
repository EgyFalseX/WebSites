<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="attachViewer.aspx.cs" Inherits="attachViewer" %>



<%@ Register src="UC/attachViewer.ascx" tagname="attachViewer" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">

    

    <uc1:attachViewer ID="attachViewer1" runat="server" />

    

</asp:Content>

