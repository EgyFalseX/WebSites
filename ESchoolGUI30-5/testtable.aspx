<%@ Page Language="C#" MasterPageFile="~/MainMasterPage.master" AutoEventWireup="true" CodeFile="testtable.aspx.cs" Inherits="testtable" Title="Untitled Page" %>

<%@ Register src="TestTable.ascx" tagname="TestTable" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:TestTable ID="TestTable1" runat="server" />
</asp:Content>

