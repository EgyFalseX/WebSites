<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="TrainershowEditor.aspx.cs" Inherits="TrainershowEditor" %>

<%@ Register src="UC/TrainershowEditor.ascx" tagname="TrainershowEditor" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:TrainershowEditor ID="TrainershowEditor1" runat="server" />
</asp:Content>

