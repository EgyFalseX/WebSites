<%@ Page Language="C#" MasterPageFile="~/Code/empkgMasterPage.master" AutoEventWireup="true" CodeFile="CdCommWay.aspx.cs" Inherits="Default2" Title="Untitled Page" %>

<%@ Register src="UC/CdCommWay.ascx" tagname="CdCommWay" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:CdCommWay ID="CdCommWay1" runat="server" />

</asp:Content>

