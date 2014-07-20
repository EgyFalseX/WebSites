<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="eventNews_s.aspx.cs" Inherits="eventNews" %>



<%@ Register src="UC/eventNews_s.ascx" tagname="eventNews" tagprefix="uc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    
   
   
    <uc1:eventNews ID="eventNews1" runat="server" />
   
    
   
   
</asp:Content>

