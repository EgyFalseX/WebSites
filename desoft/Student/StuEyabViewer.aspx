<%@ Page Title="" Language="C#" MasterPageFile="Master.master" AutoEventWireup="true" CodeFile="StuEyabViewer.aspx.cs" Inherits="StuEyabViewer" %>

<%@ Register src="UC/StuEyabViewer.ascx" tagname="StuEyabViewer" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:StuEyabViewer ID="StuEyabViewer1" runat="server" />
</asp:Content>

