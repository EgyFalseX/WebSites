<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="SendOpinion.aspx.cs" Inherits="SendOpinion" %>

<%@ Register src="UC/SendOpinion.ascx" tagname="SendOpinion" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc1:SendOpinion ID="SendOpinion1" runat="server" />
    
</asp:Content>

