<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FBSearchMSG.aspx.cs" Inherits="FBSearchMSG" Title="Untitled Page" %>

<%@ Register src="UserControls06/FBSearchMSG.ascx" tagname="FBSearchMSG" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:FBSearchMSG ID="FBSearchMSG1" runat="server" />
</asp:Content>

