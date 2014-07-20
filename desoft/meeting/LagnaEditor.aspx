<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="LagnaEditor.aspx.cs" Inherits="MeetingEditor" %>


<%@ Register src="UC/LagnaEditor.ascx" tagname="LagnaEditor" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
    <uc1:LagnaEditor ID="LagnaEditor1" runat="server" />
    
    
</asp:Content>

