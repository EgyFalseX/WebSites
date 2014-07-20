<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FBSendMSG.aspx.cs" Inherits="FBSendMSG" Title="Untitled Page" %>

<%@ Register src="UserControls06/FBSendMSG.ascx" tagname="FBSendMSG" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:FBSendMSG ID="FBSendMSG1" runat="server" />
</asp:Content>

