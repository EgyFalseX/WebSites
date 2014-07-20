<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="ViewMenu.aspx.cs" Inherits="ViewMenu" %>



<%@ Register src="UC/ViewMenu.ascx" tagname="ViewMenu" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    
   
    <uc1:ViewMenu ID="ViewMenu1" runat="server" />
   
    
   
</asp:Content>

