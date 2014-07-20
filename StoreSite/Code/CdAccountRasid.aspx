<%@ Page Language="C#" MasterPageFile="~/Code/empkgMasterPage.master" AutoEventWireup="true" CodeFile="CdAccountRasid.aspx.cs" Inherits="_Default" Title="Untitled Page" %>

<%@ Register src="UC/CdAccountRasid.ascx" tagname="CdAccountRasid" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <uc1:CdAccountRasid ID="CdAccountRasid1" runat="server" />
    
</asp:Content>

