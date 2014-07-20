<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="Itemtype.aspx.cs" Inherits="Itemtype" %>

<%@ Register src="UC/Itemtype.ascx" tagname="Itemtype" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <uc1:Itemtype ID="Itemtype1" runat="server" />
   
</asp:Content>

