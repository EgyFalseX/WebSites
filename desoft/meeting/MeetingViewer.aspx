<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="MeetingViewer.aspx.cs" Inherits="MeetingViewer" %>



<%@ Register src="UC/MeetingViewer.ascx" tagname="MeetingViewer" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
    
    <uc1:MeetingViewer ID="MeetingViewer1" runat="server" />
    
    
    
</asp:Content>

