<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="addata.aspx.cs" Inherits="addata" %>

<%@ Register src="UC/addata.ascx" tagname="addata" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc1:addata ID="addata1" runat="server" />
    
</asp:Content>

