<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="MembersEditor.aspx.cs" Inherits="MembersEditor" %>

<%@ Register src="UC/MembersEditor.ascx" tagname="MembersEditor" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:MembersEditor ID="MembersEditor1" runat="server" />
</asp:Content>

