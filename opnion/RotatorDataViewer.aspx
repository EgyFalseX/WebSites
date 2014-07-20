<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="RotatorDataViewer.aspx.cs" Inherits="RotatorDataViewer" %>

<%@ Register src="UC/RotatorDataViewer.ascx" tagname="RotatorDataViewer" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <uc1:RotatorDataViewer ID="RotatorDataViewer1" runat="server" />
   
</asp:Content>

