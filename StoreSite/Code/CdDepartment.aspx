<%@ Page Language="C#" MasterPageFile="~/Code/empkgMasterPage.master" AutoEventWireup="true" CodeFile="CdDepartment.aspx.cs" Inherits="CdDepartment" Title="Untitled Page" %>

<%@ Register src="UC/CdDepartment.ascx" tagname="CdDepartment" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <uc1:CdDepartment ID="CdDepartment1" runat="server" />

</asp:Content>