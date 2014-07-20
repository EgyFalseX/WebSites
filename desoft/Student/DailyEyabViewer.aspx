<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="DailyEyabViewer.aspx.cs" Inherits="DailyEyabViewer" %>

<%@ Register src="UC/DailyEyabViewer.ascx" tagname="DailyEyabViewer" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:DailyEyabViewer ID="DailyEyabViewer1" runat="server" />
</asp:Content>

