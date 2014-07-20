<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="TrainershowViewer.aspx.cs" Inherits="TrainershowViewer" %>

<%@ Register src="UC/TrainershowViewer.ascx" tagname="TrainershowViewer" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:TrainershowViewer ID="TrainershowViewer1" runat="server" />
</asp:Content>

