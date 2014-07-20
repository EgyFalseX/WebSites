<%@ Page Language="C#" MasterPageFile="~/Code/empkgMasterPage.master" AutoEventWireup="true" CodeFile="CdShift.aspx.cs" Inherits="_Default" Title="Untitled Page" %>

<%@ Register src="UC/CdYear.ascx" tagname="CdYear" tagprefix="uc1" %>

<%@ Register src="UC/CdShift.ascx" tagname="CdShift" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc2:CdShift ID="CdShift1" runat="server" />
    
</asp:Content>

