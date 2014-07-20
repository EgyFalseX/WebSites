<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="jobannouncementEditor.aspx.cs" Inherits="jobannouncementEditor" %>



<%@ Register src="UC/jobannouncementEditor.ascx" tagname="jobannouncementEditor" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc1:jobannouncementEditor ID="jobannouncementEditor1" runat="server" />
    
</asp:Content>

