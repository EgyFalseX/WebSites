<%@ Page Language="C#" MasterPageFile="~/Code/empkgMasterPage.master" AutoEventWireup="true" CodeFile="CdCallDir.aspx.cs" Inherits="_Default" Title="Untitled Page" %>

<%@ Register src="UC/CdCallDir.ascx" tagname="CdCallDir" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:CdCallDir ID="CdCallDir1" runat="server" />

</asp:Content>

