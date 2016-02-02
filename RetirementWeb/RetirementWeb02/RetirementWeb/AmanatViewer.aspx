<%@ Page Title="" Language="C#" MasterPageFile="master.master" AutoEventWireup="true" CodeFile="AmanatViewer.aspx.cs" Inherits="AmanatViewer" %>



<%@ Register src="UC/AmanatViewer.ascx" tagname="AmanatViewer" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMain" Runat="Server">

    

    <uc1:AmanatViewer ID="AmanatViewer1" runat="server" />

    

</asp:Content>

