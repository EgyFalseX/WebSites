<%@ Page Title="" Language="C#" MasterPageFile="~/empkgMasterPage.master" AutoEventWireup="true" CodeFile="EditorBillSerial.aspx.cs" Inherits="EditorBillSerial" %>

<%@ Register src="UC/EditorBillSerial.ascx" tagname="EditorBillSerial" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:EditorBillSerial ID="EditorBillSerial1" runat="server" />
</asp:Content>

