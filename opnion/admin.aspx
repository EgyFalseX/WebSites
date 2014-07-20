<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin" %>



<%@ Register src="UC/admin.ascx" tagname="admin" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
    
    <uc1:admin ID="admin1" runat="server" />
    
    
    
</asp:Content>

